--SertexAPI by Ale2610
--1.0

function right(y, text )
        w, h = term.getSize()
        term.setCursorPos(w - #text, y)
        write(text)
end

function left(y, text)
	h, w = term.getCursorPos()
	term.setCursorPos(1, y)
	write( text )
	term.setCursorPos(h, w)
end

function center(y, text )
        local w, h = term.getSize()
        term.setCursorPos((w - #text) / 2, y)
        write(text)
end

function centerDisplay( text )
        local x, y = term.getSize()
        term.setCursorPos(( x - string.len(text)) / 2, y / 2)
        write( text )
end

right(5, "example")
left(3, "example")
center(7, "example")
centerDisplay("example")