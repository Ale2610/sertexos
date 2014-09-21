os.pullEvent = os.pullEventRaw

os.loadAPI(".sertexos/sha256")

function setStartup()
	term.clear()
	term.setCursorPos(2,2)
	term.setTextColor(colors.red)
	print("SertexOS Setup")
	print""
	print(" Do you want to run SertexOS on startup?")
	print(" Y/N")
	
	while true do
		local id, key = os.pullEvent("key")
		
		if key == 21 then
			sleep(0.1)
			if fs.exists("startup") then
				
				fs.delete("startup")
				fs.copy(".sertexos/start", "startup")
			
			else
				fs.copy(".sertexos/start", "startup")
			end
			fs.delete(".sertexos/setup")
			
			print(" Press any key")
			os.pullEvent("key")
			shell.run(".sertexos/boot")
		
		end
		
		if key == 49 then
			
			if fs.exists("sertexos") then
				fs.delete("sertexos")
			end
			
			fs.copy(".sertexos/start", "sertexos")
			
			fs.delete(".sertexos/setup")
			
			print(" You can run SertexOS by typing sertexos")
			print(" Press any key")
			os.pullEvent("key")
			shell.run(".sertexos/boot")
		end
			
				
					
	end
end

function pass()
	print""
	print(" Do you want use password?")
	print(" Y/N")

	while true do
		local id,key = os.pullEvent("key")

		if key == 21 then
			sleep(0.1)
			term.clear()
			term.setCursorPos(2,2)
			term.setTextColor(colors.red)
			print("SertexOS Setup")
			print""
			term.setTextColor(colors.yellow)
			write(" Password: ")
			local pass = read("*")
			write(" Confirm Password: ")
			local confPass = read("*")
	
			if pass == confPass then
				local f =  fs.open(".sertexos/.data/pass", "w")
				local crypt = sha256.sha256(confPass)
				f.write(crypt)
				f.close()
				term.clear()
				term.setCursorPos(2,2)
				term.setTextColor(colors.lime)
				print(" Done!")
				sleep(2)
				fs.delete(".sertexos/setup")
				setStartup()
			else
				print""
				print(" Wrong Password!")
				sleep(2)
				shell.run(".sertexos/setup")
			end
		end

		if key == 49 then
			if fs.exists(".sertexos/.data/pass") then
				fs.delete(".sertexos/.data/pass")
				setStartup()
			else
				setStartup()
			end
		end


	end
end

term.clear()
term.setCursorPos(2,2)
term.setTextColor(colors.red)
print("SertexOS Setup")
pass()