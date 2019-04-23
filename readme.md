While debugging in Visual Studio, would you rather write this:

```
Microsoft.Fharp.Collections.List.Map<int>(
    Microsoft.FSharp.Core.FuncConvert.ToFSharpFunc<int, int>(
        x => f.Invoke(x)), myList)
```

or this?

```
myList |> List.map f
```

This project aims to make it possible to write Watch and QuickWatch expressions
in F# instead of C#.

VisualStudio APIs provide debugging support by giving you an expression which 
the user has typed, and some context about which variables are currently in 
scope and what their types are, and expecting you to give back some some IL
which it will execute to produce a value. It then gives you the opportunity
to format that value in language-specific ways. So to get F# expression 
debugging, all that is needed is to use FSharp.Compiler.Service to parse the
text into a partially-typed AST, add context-specific information from the 
debugging to transform that into a fully-typed AST, and use 
FSharp.Compiler.Service to turn that typed AST into IL for the debugger.

This is a work in progress.
