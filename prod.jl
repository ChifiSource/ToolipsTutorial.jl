using Pkg; Pkg.activate(".")
using Toolips
using ToolipsModifier

IP = "127.0.0.1"
PORT = 8000
extensions = Dict(:logger => Logger(), :public => Files("public"))
using ToolipsTutorial
ToolipsTutorialServer = ToolipsTutorial.start(IP, PORT, extensions)
