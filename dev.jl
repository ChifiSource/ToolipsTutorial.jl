#==
dev.jl is an environment file. This file loads and starts servers, and
defines environmental variables, setting the scope a lexical step higher
with modularity.
==#
using Pkg; Pkg.activate(".")
using Toolips
using Revise
using ToolipsModifier

IP = "127.0.0.1"
PORT = 8000
#==
Extension description
:logger -> Logs messages into both a file folder and the terminal.
:public -> Routes the files from the public directory.
:mod -> ToolipsModifier; allows us to make Servables reactive. See ?(on)
==#
extensions = Dict(:logger => Logger(), :public => Files("public"),
:mod => Modifier())
using ToolipsTutorial
ToolipsTutorialServer = ToolipsTutorial.start(IP, PORT, extensions)
