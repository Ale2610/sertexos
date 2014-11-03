os.pullEvent = os.pullEventRaw

os.loadAPI(".sertexos/apis/sertexos")
sertexos.loadWithSHA()
sertexos.start()

function header()
term.clear()
term.setTextColor( red )
sertextext.center(2, "SertexOS")
sertextext.right(2, "[ SETUP ]")
term.setCursorPos(2,2)
print("ID: " .. os.getComputerID())
end

function setStartup()
	header()
	term.setTextColor( red )
	print""
	print(" SertexOS Setup")
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
			
			print("\n Press any key")
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
			print("\n Press any key")
			os.pullEvent("key")
			shell.run(".sertexos/boot")
		end
			
				
					
	end
end

function pass()

	header()
       if fs.exists(".sertexos/.data/pass") then
         setStartup()
       end
	print""
	print(" SertexOS Setup")
	print""
	print(" Do you want use password?")
	print(" Y/N")

	while true do
		local id,key = os.pullEvent("key")

		if key == 21 then
			sleep(0.1)
			term.clear()
			term.setCursorPos(2,2)
			term.setTextColor( red )
			print("SertexOS Setup")
			print""
			term.setTextColor( blue )
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
				term.setTextColor( green )
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

header()
pass()