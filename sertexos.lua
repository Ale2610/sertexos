function load()
	os.loadAPI("/.sertexos/apis/sertextext")
end

function loadWithSHA()
	os.loadAPI("/.sertexos/apis/sertextext")
	os.loadAPI("/.sertexos/apis/sha256")
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
sertextext.center(2, "SertexOS")
sertextext.right(2, "[ V: " .. version.readLine() .. " ]")
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
sertextext.center(2, "SertexOS")
sertextext.right(2, "[ V: " .. version.readLine() .. " ]")
sertextext.center(5, text )
term.setCursorPos(2,2)
print("ID: " .. os.getComputerID())
if os.getComputerLabel() then
	print(" Name: " .. os.getComputerLabel())
end
term.setTextColor(app)
term.setCursorPos(1,7)
end

function unload()
  os.unloadAPI("/.sertexos/apis/sertextext")
end

function unloadWithSHA()
  os.unloadAPI("/.sertexos/apis/sertextext")
  os.unloadAPI("/.sertexos/apis/sha256")
end
