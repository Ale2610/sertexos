function load()
	os.loadAPI("/.sertexos/apis/sertextext")
	version = fs.open(".sertexos/ver", "r")
end

function loadWithSHA()
	os.loadAPI("/.sertexos/apis/sertextext")
	os.loadAPI("/.sertexos/apis/sha256")
	version = fs.open(".sertexos/ver", "r")
end

function start()
	if term.isColor() then
		title = colors.red
		text = colors.green
		dir = colors.green
		app = colors.blue
		bg = colors.white
        logo = colors.red
		
		white = colors.white
		orange = colors.orange
		magenta = colors.magenta
		lightBlue = colors.lightBlue
		yellow = colors.yellow
		lime = colors.lime
		pink = colors.pink
		gray = colors.gray
		lightGray = colors.lightGray
		cyan = colors.cyan
		purple = colors.purple
		blue = colors.blue
		brown = colors.brown
		green = colors.green
		red = colors.red
		black = colors.black
	else
		title = colors.white
		text = colors.white
		dir = colors.white
		app = colors.white
		bg = colors.black
        logo = colors.white
		
		white = colors.white
		orange = colors.white
		magenta = colors.white
		lightBlue = colors.white
		yellow = colors.white
		lime = colors.white
		pink = colors.white
		gray = colors.white
		lightGray = colors.white
		cyan = colors.white
		purple = colors.white
		blue = colors.white
		brown = colors.white
		green = colors.white
		red = colors.white
		black = colors.black
	end
	term.setBackgroundColor( bg )
	term.clear()
end

function header()
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

function password(program) --don't use (wip)
  password = read("*")
  p = fs.open(".sertexos/.data/pass", "r")
  if sha256.sha256(password) == p.readLine() then
    shell.run(program)
  else
    term.setTextColor(red)
    print("Wrong Password")
  end
end
  

function unload()
  version.close()
  os.unloadAPI("/.sertexos/apis/sertextext")
end

function unloadWithSHA()
  os.unloadAPI("/.sertexos/apis/sertextext")
  os.unloadAPI("/.sertexos/apis/sha256")
  version.close()
end
