os.pullEvent = os.pullEventRaw
os.loadAPI(".sertexos/apis/sertexos")

sertexos.loadWithSHA()
sertexos.start()

function setLabel()
    sleep(0.1)
	term.clear()
	term.setCursorPos(2,2)
	term.setTextColor(text)
	write("Set Computer Name: ")
	local label = read()
	os.setComputerLabel(label)
	sleep(1)
	term.setTextColor(colors.lime)
	print""
	print(" Computer Name: " .. os.getComputerLabel())
	sleep(1)
	shell.run(".sertexos/options")
end

function clearLabel()
	sleep(0.1)
	term.setTextColor(text)
	os.setComputerLabel()
	print""
	print(" Computer Name Cleared!")
end

function update()
	term.clear()
    term.setCursorPos(2,2)
    term.setTextColor(colors.red)
    shell.run("pastebin", "run", "31AUQX7g")
end

 --Interface
 if not http then
print("You need HTTP API enabled!")
end

sertexos.headerSub("Options")
print(" [1] Set Computer Name\n [2] Clear Computer Name\n [3] Update\n [4] Reset Password\n [5] Back")

while true do
  local id,key = os.pullEvent("key")
 
    if key == 2 then  --1
		setLabel()
    end
	
	if key == 3 then --2
		clearLabel()
	end
	
	if key == 4 then  --3
	  update()
    end
	
	if key == 5 then --4
		if fs.exists(".sertexos/.data/pass") then
			sleep(0.1)
			write(" Insert password: ")
			local oldPass = read("*")
			local crypt = sha256.sha256(oldPass)
			local f = fs.open(".sertexos/.data/pass", "r")
			if crypt == f.readLine() then
				textutils.slowPrint(" Loading...")
				f.close()
				pass = http.get("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/pass.lua")
				f = fs.open(".sertexos/pass", "w")
				f.write(pass.readAll())
				f.close()
				sleep(0.3)
				shell.run(".sertexos/pass")
			else
				print(" Wrong Password!")
				sleep(2)
				shell.run(".sertexos/options")
			end
		else
			pass = http.get("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/pass.lua")
			f = fs.open(".sertexos/pass", "w")
			f.write(pass.readAll())
			f.close()
			sleep(0.3)
			shell.run(".sertexos/pass")
		end
	end
	
	if key == 6 then --5
		shell.run(".sertexos/home")
	end
end
