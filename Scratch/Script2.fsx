#I "bin\\Debug"
#r "FSharp.Compiler.Service.dll"
open System.IO
open FSharp.Compiler.SourceCodeServices

// Create an interactive checker instance 
let checker = FSharpChecker.Create()

let fn = Path.GetTempFileName()
let fn2 = Path.ChangeExtension(fn, ".fsx")
let fn3 = Path.ChangeExtension(fn, ".dll")

File.WriteAllText(fn2, """
module M

type C() = 
   member x.P = 1

let x = 3 + 4
""")

let errors1, exitCode1 = 
    checker.Compile([| "fsc.exe"; "-o"; fn3; "-a"; fn2 |]) 
    |> Async.RunSynchronously

File.WriteAllText(fn2, """
module M

let x = 1.0 + "" // a type error
""")

let errors1b, exitCode1b = 
    checker.Compile([| "fsc.exe"; "-o"; fn3; "-a"; fn2 |])
    |> Async.RunSynchronously

let errors2, exitCode2, dynAssembly2 = 
    checker.CompileToDynamicAssembly([| "-o"; fn3; "-a"; fn2 |], execute=None)
     |> Async.RunSynchronously

(*
Passing 'Some' for the 'execute' parameter executes  the initiatlization code for the assembly.
*)
let errors3, exitCode3, dynAssembly3 = 
    checker.CompileToDynamicAssembly([| "-o"; fn3; "-a"; fn2 |], Some(stdout,stderr))
     |> Async.RunSynchronously
