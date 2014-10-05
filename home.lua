os.pullEvent = os.pullEventRaw

os.loadAPI(".sertexos/apis/sertexosapi")

sertexosapi.load()
sertexosapi.start()

 if not http then
	error("You need HTTP API enabled!")
end

verD = http.get("https://dl.dropboxusercontent.com/u/135761538/computercraft/sertexos/ver")

verW = fs.open(".sertexos/version","w")
verW.write(verD.readAll())
verW.close()

local verC = fs.open(".sertexos/version", "r")

if not version == verC.readLine() then
	term.clear()
	term.setCursorPos(1,1)
	textutils.slowPrint("New update Found!")
	print("Press Any Key")
	os.pullEvent("key")
end
 
sertexosapi.header()
print("[1] Applications\n [2] Options\n [3] Shell\n [4] Lock\n [5] Info/Help\n [6] Reboot\n [7] Shutdown")

while true do
  local id,key = os.pullEvent("key")
	
    if key == 2 then  --1
	   --shell.run(".sertexos/apps")
	   print("Work In Progress")
    end  
   
    if key == 3 then  --2
	  shell.run(".sertexos/options") --options
    end
	
	if key == 4 then --3
		sleep(0.1)
		shell.run("fg", "shell")
    end
	
	if key == 5 then --4
		if fs.exists(".sertexos/.data/pass") then
			sleep(0.1)
			shell.run(".sertexos/boot")
		else
			print("Set a password!")
		end
	end
	
	if key == 6 then -- 5
		shell.run(".sertexos/info")
	end
	
    if key == 7 then  --6
	  term.clear()
      term.setCursorPos(2,2)
	  term.setTextColor(colors.yellow)
      printC("Rebooting...")
      sleep(0.5)
      os.reboot()
    end
   
    if key == 8 then  --7
	  	term.clear()
    term.setCursorPos(2,2)
	term.setTextColor(colors.yellow)
    printC("Shutting Down...")
	sleep(0.5)
    os.shutdown()
    end
end