os.pullEvent = os.pullEventRaw

 --Data
 
local version = fs.open(".sertexos/ver", "r")
 
 --Function
 
 function printRight( text )
        w, h = term.getSize()
        term.setCursorPos(w - #text, 1)
        write(text)
end

function printTRight( text )
        w, h = term.getSize()
        term.setCursorPos(w - #text, 2)
        write(text)
end

function printCenter( text )
        local w, h = term.getSize()
        term.setCursorPos((w - #text) / 2, 1)
        write(text)
end

function printTCenter( text )
        local w, h = term.getSize()
        term.setCursorPos((w - #text) / 2, 2)
        write(text)
end

function printTTCenter( text )
        local w, h = term.getSize()
        term.setCursorPos((w - #text) / 2, 5)
        write(text)
end

function printC( text )
        local x, y = term.getSize()
        term.setCursorPos(( x - string.len(text)) / 2, y / 2)
        write( text )
end

--Interface

if not http then
print("You need HTTP API enabled!")
else
 
term.clear()
term.setTextColor(colors.red)
printTCenter("SertexOS")
printTRight("[ V: " .. version.readLine() .. " ]")
printTTCenter("Applications")
term.setCursorPos(2,2)
print("ID: " .. os.getComputerID())
if os.getComputerLabel() then
	print(" Name: " .. os.getComputerLabel())
end

term.setCursorPos(2,7)
term.setTextColor(colors.lime)
print("[1] Games")
term.setTextColor(colors.yellow)
print(" [2] File Browser\n [3] LuaIDE\n [4] SertexGPS\n [5] Back")



while true do
  local id,key = os.pullEvent("key")
	
	if key == 2 then --1
	  shell.run(".sertexos/games")
	end
	
	if key == 3 then  --2
	  shell.run("fg", ".sertexos/fileBrowser")
    end
	
	if key == 4 then --3
		shell.run("fg", ".sertexos/luaide")
	end
	
	if key == 5 then --4
		shell.run("fg", ".sertexos/sertexgps")
	end
   
    if key == 6 then  --5
      shell.run(".sertexos/home")
    end
	
end
end