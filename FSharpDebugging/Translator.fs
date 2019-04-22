module Translator

open System.Diagnostics
open System.IO
open Microsoft.VisualStudio.Debugger.Evaluation
open Microsoft.VisualStudio.Debugger

// used to track whether this expression is a synthetic expression intended to go to C#
type CSharpExpressionMarker() =
    inherit DkmDataItem()

let translateCSharp (expr: DkmLanguageExpression) addr ctx =
    let mutable err, res = null, null
    expr.CompileExpression(addr, ctx, &err, &res)
    if err <> null then Error err
    else
        let bytes = res.Binary
        let bytesFile = Path.ChangeExtension(Path.GetTempFileName(), "dll")
        File.WriteAllBytes(bytesFile, bytes |> Array.ofSeq)

        let ilasmPath = """c:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.6.1 Tools\ildasm.exe"""
        let ilFile = Path.ChangeExtension(Path.GetTempFileName(), "il")
        let spawn = new Process()
        spawn.StartInfo.FileName <- ilasmPath
        spawn.StartInfo.WorkingDirectory <- Path.GetDirectoryName(bytesFile)
        spawn.StartInfo.WindowStyle <- ProcessWindowStyle.Hidden
        spawn.StartInfo.Arguments <- 
            sprintf "%s /out=%s" bytesFile ilFile

        try
            if not <| spawn.Start() then Error <| sprintf "Failed to start: %s %s" spawn.StartInfo.FileName spawn.StartInfo.Arguments
            else
                spawn.WaitForExit()
                System.IO.File.AppendAllText(ilFile, "\n" + bytesFile + "\n" + expr.Text)
                let mutable error, result = null, null
                let cmd = sprintf """@"%s" """ ilFile
                DkmLanguageExpression.Create(expr.Language, expr.CompilationFlags, cmd, CSharpExpressionMarker())
                    .CompileExpression(addr, ctx, &error, &result)
                if error <> null then Error error
                else 
                    Ok result
        with e -> Error <| "Unexpected error! " + e.ToString()
