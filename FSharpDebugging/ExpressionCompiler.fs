namespace FSharpDebugging

open System
open Microsoft.VisualStudio.Debugger.ComponentInterfaces
open System.Runtime.InteropServices
open Microsoft.VisualStudio.Debugger
open Microsoft.VisualStudio.Debugger.Evaluation
open Translator

type ExpressionCompiler() = 
    interface IDkmClrExpressionCompiler with
        member this.CompileExpression(expr, addr, ctx, error, result) = 
            if expr.Text = "x" then
                error <- "Hello world from F# v0.1."
            elif expr.GetDataItem<CSharpExpressionMarker>() |> box <> null then
                // if CSharpExpressionMarker is attached then the expression has already been rewritten: evaluate in C#
                expr.CompileExpression(addr, ctx, &error, &result)
            else
                match Translator.translateCSharp expr addr ctx with
                | Error e -> error <- e
                | Ok r -> result <- r
        member this.CompileAssignment(expr, addr, ctx, error, result) =
            expr.CompileAssignment(addr, ctx, &error, &result)
        member this.GetClrLocalVariableQuery(expr, addr, argsOnly) = 
            expr.GetClrLocalVariableQuery(addr, argsOnly)
