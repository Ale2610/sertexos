os.pullEvent = os.pullEventRaw

 --Data
os.loadAPI(".sertexos/apis/sertexosapi")
sertexosapi.load()
sertexosapi.start()

--Interface

if not http then
print("You need HTTP API enabled!")
else
 
sertexosapi.headerSub("Applications")
term.setTextColor(colors.green)
print("[1] Games")
term.setTextColor(colors.blue)
print(" [2] Ice-Browser\n [3] LuaIDE\n [4] SertexGPS\n [5] Back")



while true do
  local id,key = os.pullEvent("key")
	
	if key == 2 then --1
	  shell.run(".sertexos/games")
	end
	
	if key == 3 then  --2
	  shell.run("fg", ".sertexos/iceBrowser")
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