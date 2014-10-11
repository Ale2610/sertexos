function load()
	os.loadAPI(".sertexos/apis/sertexapi")
	
	local title, text, dir, app, bg
	if term.isColor() then
		title = colors.red
		text = colors.green
		dir = colors.green
		app = colors.blue
		bg = colors.white
	else
		title = colors.white
		text = colors.white
		dir = colors.white
		app = colors.white
		bg = colors.black
	end
end

function loadWSHA()
	os.loadAPI(".sertexos/apis/sertexapi")
	os.loadAPI(".sertexos/apis/sha256")
	
	local title, text, dir, app, bg
	if term.isColor() then
		title = colors.red
		text = colors.green
		dir = colors.green
		app = colors.blue
		bg = colors.white
	else
		title = colors.white
		text = colors.white
		dir = colors.white
		app = colors.white
		bg = colors.black
	end
end

function start()
	term.setBackgroundColor(colors.white)
	term.clear()
end

function header()
os.loadAPI(".sertexos/apis/sertexapi")
 local version = fs.open(".sertexos/ver", "r")
term.clear()
term.setTextColor( title )
sertexapi.center(2, "SertexOS")
sertexapi.right(2, "[ V: " .. version.readLine() .. " ]")
term.setCursorPos(2,2)
print("ID: " .. os.getComputerID())
if os.getComputerLabel() then
	print(" Name: " .. os.getComputerLabel())
end
term.setCursorPos(2,5)
term.setTextColor( app )
end

function headerSub( text )
os.loadAPI(".sertexos/apis/sertexapi")
local version = fs.open(".sertexos/ver", "r")
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
term.setCursorPos(2,7)
end
