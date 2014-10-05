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
print(" [2] Ice-Browser\n [3] SertexGPS\n [4] Back")



while true do
  local id,key = os.pullEvent("key")
	
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
      shell.run(".sertexos/home")
    end
	
end
end