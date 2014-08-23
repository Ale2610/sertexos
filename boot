os.pullEvent = os.pullEventRaw

--Data

 local version = "1.4"

--Function

function textutils.slowprintC( text )
		local w, h = term.getSize()
		term.setCursorPos((w - #text) / 2, 2)
		write( text )
end

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
        write( text )
end

function printC( text )
        local x, y = term.getSize()
        term.setCursorPos(( x - string.len(text)) / 2, y / 2)
        write( text )
end

if not http then
  print("You need HTTP API enabled!")
end

term.clear()
term.setCursorPos(2,2)
term.setTextColor(colors.red)
print("  # ")
print(" #  ")
print(" ###")
term.setCursorPos(2,2)
printTCenter("SertexOS")
term.setTextColor(colors.yellow)
printC("Loading...")
sleep(1.8)
	
if fs.exists(".sertexos/pass") then
	shell.run(".sertexos/pass")
else
	if fs.exists(".sertexos/.data/pass") then
		term.clear()
		term.setCursorPos(2,2)
		term.setTextColor(colors.red)
		print("SertexOS")
		print""
		write("Insert Password: ")
		local pass = read("*")
		local f = fs.open(".sertexos/.data/pass", "r")
		if pass == f.readLine() then
			f.close()
			shell.run(".sertexos/home")
		else
			print("Wrong Password!")
			sleep(2)
			os.reboot()
		end
	end
end
