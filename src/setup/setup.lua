os.pullEvent = os.pullEventRaw

if term.isColor() then
		title = colors.red
		text = colors.green
		dir = colors.green
		app = colors.blue
		bg = colors.white
    logo = colors.red
		
		white = colors.white
		orange = colors.orange
		magenta = colors.magenta
		lightBlue = colors.lightBlue
		yellow = colors.yellow
		lime = colors.lime
		pink = colors.pink
		gray = colors.gray
		lightGray = colors.lightGray
		cyan = colors.cyan
		purple = colors.purple
		blue = colors.blue
		brown = colors.brown
		green = colors.green
		red = colors.red
		black = colors.black
	else
		title = colors.white
		text = colors.white
		dir = colors.white
		app = colors.white
		bg = colors.black
    logo = colors.white
		
		white = colors.white
		orange = colors.white
		magenta = colors.white
		lightBlue = colors.white
		yellow = colors.white
		lime = colors.white
		pink = colors.white
		gray = colors.white
		lightGray = colors.white
		cyan = colors.white
		purple = colors.white
		blue = colors.white
		brown = colors.white
		green = colors.white
		red = colors.white
		black = colors.black
	end

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
			shell.run(".sertexos/SertexOS")
		
		end
		
		if key == 49 then
			
			if fs.exists("sertexos") then
				fs.delete("sertexos")
			end
			
			local runSertexOS = fs.open("sertexos", "w")
			runSertexOS.write("shell.run(\".sertexos/SertexOS\")")
			runSertexOS.close()
			fs.delete(".sertexos/setup")
			
			print(" You can run SertexOS by typing sertexos")
			print("\n Press any key")
			os.pullEvent("key")
			shell.run(".sertexos/SertexOS")
		end
			
				
					
	end
end

function pass()
	print""
	print(" SertexOS Setup")
	print""
	print(" Do you want use password?")
	print(" Y/N")

	while true do
		local id,key = os.pullEvent("key")

		if key == 21 then
			while true do
				sleep(0.1)
				term.clear()
				term.setCursorPos(2,2)
				term.setTextColor( red )
				print("SertexOS Setup")
				print""
				term.setTextColor( blue )
				write("Username: ")
				local username = read()
				write(" Password: ")
				local pass = read("*")
				write(" Confirm Password: ")
				local confPass = read("*")
	
				if pass == confPass then
					local f = fs.open(".sertexos/udb/"..username.."/.password", "w")
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
		end

		if key == 49 then
				setStartup()
		end


	end
end

term.clear()
term.setCursorPos(1,1)
pass()