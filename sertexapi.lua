--SertexAPI by Ale2610
--1.0

function right( text )
        w, h = term.getSize()
        term.setCursorPos(w - #text, 1)
        write(text)
end

function rightTitle( text )
		w, h = term.getSize()
        term.setCursorPos(w - #text, 2)
        write(text)
end

function leftTitle( text )
        term.setCursorPos(1, 2)
        write(text)
end

function center( text )
        local w, h = term.getSize()
        term.setCursorPos((w - #text) / 2, 1)
        write(text)
end

function centerTitle( text )
        local w, h = term.getSize()
        term.setCursorPos((w - #text) / 2, 2)
        write(text)
end

function centerTitle2( text )
        local w, h = term.getSize()
        term.setCursorPos((w - #text) / 2, 3)
        write(text)
end

function centerTitle3( text )
        local w, h = term.getSize()
        term.setCursorPos((w - #text) / 2, 4)
        write(text)
end

function centerTitle4( text )
        local w, h = term.getSize()
        term.setCursorPos((w - #text) / 2, 5)
        write(text)
end

function centerTitle5( text )
        local w, h = term.getSize()
        term.setCursorPos((w - #text) / 2, 6)
        write(text)
end

function centerDisplay( text )
        local x, y = term.getSize()
        term.setCursorPos(( x - string.len(text)) / 2, y / 2)
        write( text )
end