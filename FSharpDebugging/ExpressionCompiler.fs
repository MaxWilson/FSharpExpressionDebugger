namespace FSharpDebugging

open System
open Microsoft.VisualStudio.Debugger.ComponentInterfaces
open System.Runtime.InteropServices
open Microsoft.VisualStudio.Debugger
open Microsoft.VisualStudio.Debugger.Evaluation

// used to track whether this expression is a synthetic expression intended to go to C#
type Tracker() =
    inherit DkmDataItem()

type ExpressionCompiler() = 
    interface IDkmClrExpressionCompiler with
        member this.CompileExpression(expr, addr, ctx, error, result) = 
            if expr.Text = "x" then
                error <- "Hello world from F# v0.1."
            elif expr.Text = "y" && expr.GetDataItem<Tracker>() |> box = null then
                // evaluate "42" in C#
                let e = DkmLanguageExpression.Create(expr.Language, expr.CompilationFlags, "42*42", Tracker())
                e.CompileExpression(addr, ctx, &error, &result)
            else
                // fall through
                expr.CompileExpression(addr, ctx, &error, &result)
        member this.CompileAssignment(expr, addr, ctx, error, result) =
            expr.CompileAssignment(addr, ctx, &error, &result)
        member this.GetClrLocalVariableQuery(expr, addr, argsOnly) = 
            expr.GetClrLocalVariableQuery(addr, argsOnly)
