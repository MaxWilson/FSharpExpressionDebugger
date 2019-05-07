namespace FSharpDebugging

open System
open Microsoft.VisualStudio.Debugger.ComponentInterfaces
open System.Runtime.InteropServices
open Microsoft.VisualStudio.Debugger
open Microsoft.VisualStudio.Debugger.Evaluation
open Translator
open Microsoft.VisualStudio.Debugger.Evaluation.ClrCompilation

/// NOTE that there is a FSharpExpressionCompiler.vsdconfigxml which for technical reasons
// is not included in the .fsproj but still is packaged with the VSIX and affects
// when/how this extension runs in VisualStudio.
type ExpressionCompiler() = 
    interface IDkmClrExpressionCompiler with
        member this.CompileExpression(expr, addr, ctx, error, result) =
            match FSharp.translate expr addr ctx with
            | Ok resp ->
                result <- resp
            | Error fsErrs ->
                match CSharp.translate expr addr ctx with
                | Ok r -> result <- r // if it's a valid C# expression, then okay
                | Error csErr ->
                    error <- sprintf "%s\n\n%s" fsErrs.[0] csErr
        member this.CompileAssignment(expr, addr, ctx, error, result) =
            expr.CompileAssignment(addr, ctx, &error, &result)
        member this.GetClrLocalVariableQuery(expr, addr, argsOnly) = 
            expr.GetClrLocalVariableQuery(addr, argsOnly)
