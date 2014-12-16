os.pullEvent = os.pullEventRaw

if fs.exists(".sertexos/check") then
	fs.delete(".sertexos/check")
end
	check = fs.open(".sertexos/check", "w")
	check.write("false")
	check.close

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

function clear()
		term.setBackgroundColor(bg)
        term.clear()
        term.setCursorPos(1,1)
end
 
function Reset()
        clear()
 term.setTextColor(red)
        textutils.slowWrite("SertexOS")
 term.setTextColor(red)
        printTR("By Sertex-Team")
 term.setTextColor(green)
        printTM("- Installer -")
        w, h = term.getSize()
        print(string.rep("-", w)) write("\n")
end
 
function printTR( text )
        w, h = term.getSize()
        term.setCursorPos(w - #text, 1)
        write(text)
end
 
function printTM( text )
        local w, h = term.getSize()
        term.setCursorPos((w - #text) / 2, 1)
        write(text)
end
 
function printC( text )
        local x, y = term.getSize()
        term.setCursorPos(( x - string.len(text)) / 2, y / 2)
        write( text )
end


--installer!
function gt(url, fileName)
	f = fs.open(fileName, "w")
	f.write(http.get(url).readAll())
	f.close()
	print("Installed "..fileName)
end --end installer
 
-- Interface --
--if not term.isColor() then
  --print("ERROR!")
  --print("Use Advanced Computer!")
  --shell.run("shell")
--end

--if pocket then
  --print("This OS is for Advanced Computers!")
  --shell.run("shell")
--end

if not http then
	print("You need to enable HTTP")
	shell.run("shell")
end

if fs.exists(".sertexos") and not fs.exists(".sertexos/.data/pass") then
	fs.delete(".sertexos")
	fs.makeDir(".sertexos")
	fs.makeDir(".sertexos/.data")
elseif fs.exists(".sertexos") and fs.exists(".sertexos/.data/pass") then
	fs.move(".sertexos/.data/pass", "cache/pass")
	fs.delete(".sertexos")
	fs.makeDir(".sertexos")
	fs.makeDir(".sertexos/.data")
	fs.move("cache/pass", ".sertexos/.data/pass")
end

Reset()
term.setTextColor(blue)
print("This operating system is compatible with Classic Computers and optmized for Advanced Computers\n")
print("Loading...")
sleep(0.5)
fs.makeDir(".sertexos")
fs.makeDir(".sertexos/.data")
fs.makeDir(".sertexos/apis")
fs.makeDir(".sertexos/tabs")
fs.makeDir(".sertexos/applications")
fs.makeDir(".sertexos/useless")
print("Downloading Files...")

if fs.exists("startup") then
	fs.move("startup", ".sertexos/startup")
end

gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/setup/startup.lua", "startup")
gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/setup/pass.lua", ".sertexos/pass")
gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/setup/setup.lua", ".sertexos/setup")

gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/LICENSE", ".sertexos/LICENSE")
gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/ver.txt", ".sertexos/ver")

gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/boot.lua", ".sertexos/boot")
gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/start.lua", ".sertexos/start")
gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/SertexOS.lua", ".sertexos/SertexOS")

gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/applications/firewolf.lua", ".sertexos/applications/firewolf")
gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/applications/luaide.lua", ".sertexos/applications/luaide")
gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/applications/sertexgps.lua", ".sertexos/applications/sertexgps")
gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/applications/iceBrowser.lua", ".sertexos/applications/iceBrowser")
gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/applications/shell.lua", ".sertexos/applications/shell")

gt("https://raw.githubusercontent.com/Sertex-Team/SertexText/master/src/lastest/sertextext.lua", ".sertexos/apis/sertextext")
gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/apis/sertexos.lua", ".sertexos/apis/sertexos")
gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/apis/sha256.lua", ".sertexos/apis/sha256")

term.setTextColor(green)
print("\nDone!")
sleep(1)
Reset()
print("SertexOS Downloaded Successfully!")
term.setTextColor(red)
print("\nPress Any Key")
term.setTextColor(white)
os.pullEvent("key")
sleep(0,1)
term.clear()
term.setCursorPos(1,1)
os.reboot()
