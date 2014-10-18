os.pullEvent = os.pullEventRaw

 --Data
os.loadAPI(".sertexos/apis/sertexosapi")
sertexosapi.load()
sertexosapi.start()

--Interface

if not http then
	error("You need HTTP API enabled!")
end
 
sertexosapi.headerSub("Applications")
term.setTextColor(colors.green)
print(" [1] Games")
term.setTextColor(colors.blue)
print(" [2] Ice-Browser\n [3] SertexGPS\n [4] LuaIDE\n [5] Firewolf\n [6] Back")

while true do
       id, key = os.pullEvent("key")
	
	if key == 2 then
	  shell.run(".sertexos/games")
	end
	
	if key == 3 then
		shell.run("fg", ".sertexos/iceBrowser")
	end
	
	if key == 4 then
		shell.run("fg", ".sertexos/sertexgps")
	end
	
	if key == 5 then
		shell.run("fg", ".sertexos/luaide")
	end
	
	if key == 6 then
		shell.run("fg", ".sertexos/firewolf")
	end
   
    if key == 7 then
      shell.run(".sertexos/home")
    end
	
end