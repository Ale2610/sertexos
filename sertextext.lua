--SertexAPI by Ale2610 and MultMine
--1.1

function right(y, text )
        local w, h = term.getSize()
        term.setCursorPos(w - #text, y)
        write(text)
end

function left(y, text)
	term.setCursorPos(1, y)
	write( text )
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
