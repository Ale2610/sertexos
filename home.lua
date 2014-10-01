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

function printC( text )
        local x, y = term.getSize()
        term.setCursorPos(( x - string.len(text)) / 2, y / 2)
        write( text )
end

function clear()
term.clear()
term.setTextColor(colors.red)
printTCenter("SertexOS")
printTRight("[ V: " .. version.readLine() .. " ]")
term.setCursorPos(2,2)
print("ID: " .. os.getComputerID())
if os.getComputerLabel() then
	print(" Name: " .. os.getComputerLabel())
end
term.setTextColor(colors.yellow)
 
term.setCursorPos(2,5)
print("[1] Applications\n [2] Options\n [3] Shell\n [4] Lock\n [5] Info/Help\n [6] Reboot\n [7] Shutdown")
end

--Main Function

function applications()
	shell.run(".sertexos/apps")
end

function options()
	shell.run("options")
end

function shell()
	sleep(0.1)
	shell.run("fg", "shell")
end

function lock()
	if fs.exists(".sertexos/.data/pass") then
			sleep(0.1)
			shell.run(".sertexos/boot")
		else
			print("Set a password!")
		end
end

function info()
	shell.run(".sertexos/info")
end

function reboot()
	term.clear()
      term.setCursorPos(2,2)
	  term.setTextColor(colors.yellow)
      printC("Rebooting...")
      sleep(0.5)
      os.reboot()
end

function shutdown()
	term.clear()
    term.setCursorPos(2,2)
	term.setTextColor(colors.yellow)
    printC("Shutting Down...")
	sleep(0.5)
    os.shutdown()
end
 
 --Interface
 if not http then
error("You need HTTP API enabled!")
end


verD = http.get("https://dl.dropboxusercontent.com/u/135761538/computercraft/sertexos/ver")

verF = fs.open(".sertexos/version","w")
verF.write(verD.readAll())
verF.close()

local ver = fs.open(".sertexos/version", "r")

--if version == ver.readLine() then
	clear()
--else
--	term.clear()
--	term.setCursorPos(1,1)
--	textutils.slowPrint("New update Found!")
--	os.pullEvent("key")
--	clear()
--end


while true do
  local id,key = os.pullEvent("key")
	
    if key == 2 then  --1
	   shell.run(".sertexos/apps")
    end  
   
    if key == 3 then  --2
	  shell.run(".sertexos/options") --options
    end
	
	if key == 4 then --3
		shell()
    end
	
	if key == 5 then --4
		lock()
	end
	
	if key == 6 then -- 5
		shell.run(".sertexos/info")
	end
	
    if key == 7 then  --6
	  reboot()
    end
   
    if key == 8 then  --7
	  	shutdown()
    end
end