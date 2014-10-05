function load()
	os.loadAPI(".sertexos/apis/sertexapi")
end

function loadWSHA()
	os.loadAPI(".sertexos/apis/sertexapi")
	os.loadAPI(".sertexos/apis/sha256")
end

function start()
	term.setBackgroundColor(colors.white)
	term.clear()
end

function header()
os.loadAPI(".sertexos/apis/sertexapi")
 local version = fs.open(".sertexos/ver", "r")
term.clear()
term.setTextColor(colors.red)
sertexapi.center(2, "SertexOS")
sertexapi.right(2, "[ V: " .. version.readLine() .. " ]")
term.setCursorPos(2,2)
print("ID: " .. os.getComputerID())
if os.getComputerLabel() then
	print(" Name: " .. os.getComputerLabel())
end
term.setCursorPos(2,5)
term.setTextColor(colors.blue)
end

function headerSub( text )
os.loadAPI(".sertexos/apis/sertexapi")
local version = fs.open(".sertexos/ver", "r")
term.clear()
term.setTextColor(colors.red)
sertexapi.center(2, "SertexOS")
sertexapi.right(2, "[ V: " .. version.readLine() .. " ]")
sertexapi.center(5, text )
term.setCursorPos(2,2)
print("ID: " .. os.getComputerID())
if os.getComputerLabel() then
	print(" Name: " .. os.getComputerLabel())
end
term.setTextColor(colors.blue)
term.setCursorPos(2,7)
end
