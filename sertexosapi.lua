function load()
	os.loadAPI(".sertexos/apis/sertexapi")
end

function loadWSHA()
	os.loadAPI(".sertexos/apis/sertexapi")
	os.loadAPI(".sertexos/apis/sha256")
end

function start()
	if term.isColor() then
		title = colors.red
		text = colors.green
		dir = colors.green
		app = colors.blue
		bg = colors.white
              logo = colors.red
	else
		title = colors.white
		text = colors.white
		dir = colors.white
		app = colors.white
		bg = colors.black
              logo = colors.white
	end
	term.setBackgroundColor( bg )
	term.clear()
end

function header()
version = fs.open(".sertexos/ver", "r")
term.clear()
term.setTextColor( title )
sertexapi.center(2, "SertexOS")
sertexapi.right(2, "[ V: " .. version.readLine() .. " ]")
term.setCursorPos(2,2)
print("ID: " .. os.getComputerID())
if os.getComputerLabel() then
	print(" Name: " .. os.getComputerLabel())
end
term.setCursorPos(1,5)
term.setTextColor( app )
end

function headerSub( text )
version = fs.open(".sertexos/ver", "r")
term.clear()
term.setTextColor(title)
sertexapi.center(2, "SertexOS")
sertexapi.right(2, "[ V: " .. version.readLine() .. " ]")
sertexapi.center(5, text )
term.setCursorPos(2,2)
print("ID: " .. os.getComputerID())
if os.getComputerLabel() then
	print(" Name: " .. os.getComputerLabel())
end
term.setTextColor(app)
term.setCursorPos(1,7)
end
