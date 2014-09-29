os.pullEvent = os.pullEventRaw
os.loadAPI(".sertexos/sha256")

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

function clearT()
term.clear()
term.setTextColor(colors.red)
printTCenter("SertexOS")
printTRight("[ V: " .. version.readLine() .. " ]")
printTTCenter("Options")
term.setCursorPos(2,2)
print("ID: " .. os.getComputerID())
if os.getComputerLabel() then
	print(" Name: " .. os.getComputerLabel())
end
end
 
 --Interface
 if not http then
print("You need HTTP API enabled!")
else

clearT()
term.setTextColor(colors.yellow)
term.setCursorPos(2,7)
print("[1] Set Computer's Name\n [2] Clear Computer's Name\n [3] Update\n [4] Reset Password\n [5] Back")

while true do
  local id,key = os.pullEvent("key")
 
    if key == 2 then  --1
		sleep(0.1)
		term.clear()
		term.setCursorPos(2,2)
		term.setTextColor(colors.green)
		write("Set Computer's Name: ")
		local label = read()
		os.setComputerLabel(label)
		sleep(1)
		term.setTextColor(colors.lime)
		print""
		print(" Computer's Name: " .. os.getComputerLabel())
		sleep(1)
		shell.run(".sertexos/options")
    end
	
	if key == 3 then --2
		sleep(0.1)
		term.clear()
		clearT()
		term.setCursorPos(2,6)
		term.setTextColor(colors.lime)
		os.setComputerLabel()
		print("Computer's Name Cleared!")
		sleep(1)
		shell.run(".sertexos/options")
	end
	
	if key == 4 then  --3
	  term.clear()
      term.setCursorPos(2,2)
      term.setTextColor(colors.red)
      shell.run("pastebin", "run", "31AUQX7g") --update
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
				pass = http.get("https://raw.githubusercontent.com/Ale2610/sertexos/master/pass")
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
			pass = http.get("https://raw.githubusercontent.com/Ale2610/sertexos/master/pass")
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
end