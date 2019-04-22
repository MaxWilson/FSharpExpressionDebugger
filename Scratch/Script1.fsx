#I "bin\\Debug"
#r "FSharp.Compiler.Service.dll"

open System
open System.IO
open FSharp.Compiler.SourceCodeServices

// Create an interactive checker instance 
let checker = FSharpChecker.Create()

let parseAndTypeCheckSingleFile (file, input) = 
    // Get context representing a stand-alone (script) file
    let projOptions, errors = 
        checker.GetProjectOptionsFromScript(file, input)
        |> Async.RunSynchronously

    let parseFileResults, checkFileResults = 
        checker.ParseAndCheckFileInProject(file, 0, input, projOptions) 
        |> Async.RunSynchronously

    // Wait until type checking succeeds (or 100 attempts)
    match checkFileResults with
    | FSharpCheckFileAnswer.Succeeded(res) -> parseFileResults, res
    | res -> failwithf "Parsing did not finish... (%A)" res

//let file = """C:\code\FSharpDebugging\Scratch\Script1.fsx"""

//let result = (file, file |> System.IO.File.ReadAllText) |> parseAndTypeCheckSingleFile
//snd result

let input2 = 
    """
[<System.CLSCompliant(true)>]
let foo(x, y) = 
  let msg = String.Concat("Hello"," ","world")
  if true then 
      printfn "x = %d, y = %d" x y 
      printfn "%s" msg

type C() = 
  member x.P = 1
    """
let file = "/home/user/Test.fsx"
let parseFileResults, checkFileResults = 
  parseAndTypeCheckSingleFile(file, input2)

let partialAssemblySignature = checkFileResults.PartialAssemblySignature

partialAssemblySignature.Entities.Count = 1  // one entity

let moduleEntity = partialAssemblySignature.Entities.[0]

let amap f = Array.ofSeq >> Array.map f
moduleEntity.DisplayName = "Test"
partialAssemblySignature.Entities |> amap (fun x -> x.DisplayName)
partialAssemblySignature.Entities |> Array.ofSeq |> Array.map (fun e -> e.DisplayName)
moduleEntity.NestedEntities |> amap (fun x -> x.DisplayName)
moduleEntity.MembersFunctionsAndValues |> amap (fun x -> x.DisplayName)