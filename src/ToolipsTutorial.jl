module ToolipsTutorial
using Toolips
using ToolipsModifier

function home(c::Connection)
    redclass = Style("redtxt", color = "red")
    blueclass = Style("bluetxt", color = "lightblue")
    heading = h("cupkakes", 1, text = "Cupcakes")
    write!(c, p("clicktod",
    text = "click to make the heading change color; double click to send to red."))
    write!(c, components(redclass, blueclass))
    on(c, heading, "click") do cm::ComponentModifier
        style!(cm, heading, blueclass)
    end
    on(c, heading, "dblclick") do cm::ComponentModifier
        style!(cm, heading, redclass)
    end
    write!(c, heading)
end

fourofour = route("404") do c
    write!(c, p("404message", text = "404, not found!"))
end

"""
start()
"""
function start(IP::String = "127.0.0.1", PORT::Integer = 8000,
    extensions::Dict = Dict(:logger => Logger()))
    rs = routes(route(home, "/"), fourofour)
    server = ServerTemplate(IP, PORT, rs, extensions = extensions)
    server.start()
end

end # - module
