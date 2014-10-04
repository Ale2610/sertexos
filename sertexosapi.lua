function header()
os.loadAPI(".sertexos/apis/sertexapi")
 local version = fs.open(".sertexos/ver", "r")
term.clear()
term.setTextColor(colors.red)
sertexapi.centerTitle("SertexOS")
sertexapi.rightTitle("[ V: " .. version.readLine() .. " ]")
term.setCursorPos(2,2)
print("ID: " .. os.getComputerID())
if os.getComputerLabel() then
	print(" Name: " .. os.getComputerLabel())
end
term.setTextColor(colors.yellow)
end

function headerSub( text )
os.loadAPI(".sertexos/apis/sertexapi")
local version = fs.open(".sertexos/ver", "r")
term.clear()
term.setTextColor(colors.red)
sertexapi.centerTitle("SertexOS")
sertexapi.rightTitle("[ V: " .. version.readLine() .. " ]")
sertexapi.centerTitle4( text )
term.setCursorPos(2,2)
print("ID: " .. os.getComputerID())
if os.getComputerLabel() then
	print(" Name: " .. os.getComputerLabel())
end
term.setTextColor(colors.yellow)
term.setCursorPos(2,7)
end
