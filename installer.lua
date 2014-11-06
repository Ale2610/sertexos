function clear()
		term.setBackgroundColor(colors.black)
        term.clear()
        term.setCursorPos(1,1)
end
 
function Reset()
        clear()
 term.setTextColor(colors.white)
        textutils.slowWrite("SertexOS")
 term.setTextColor(colors.white)
        printTR("By Sertex-Team")
 term.setTextColor(colors.white)
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
	fs.makeDir(Root)
	fs.makeDir(DataRoot)
elseif fs.exists(".sertexos") and fs.exists(".sertexos/.data/pass") then
	fs.move(".sertexos/.data/pass", "cache/pass")
	fs.delete(".sertexos")
	fs.makeDir(Root)
	fs.makeDir(DataRoot)
	fs.move("cache/pass", ".sertexos/.data/pass")
end

Reset()
term.setTextColor(colors.white)
print("This operating system is compatible with Classic Computers and optmized for Advanced Computers\n")
print("Loading...")
sleep(0.5)
fs.makeDir(".sertexos")
fs.makeDir(".sertexos/.data")
fs.makeDir(".sertexos/apis")
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

gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/tabs/home.lua", ".sertexos/home")
gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/tabs/apps.lua", ".sertexos/apps")
gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/tabs/options.lua", ".sertexos/options")
gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/tabs/info.lua", ".sertexos/info")
gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/tabs/games.lua", ".sertexos/games")

gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/applications/firewolf.lua", ".sertexos/firewolf")
gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/applications/luaide.lua", ".sertexos/luaide")
gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/applications/sertexgps.lua", ".sertexos/sertexgps")
gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/iceBrowser.lua", ".sertexos/iceBrowser")

gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/apis/sertextext.lua", ".sertexos/apis/sertextext")
gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/apis/sertexos.lua", ".sertexos/apis/sertexos")
gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/apis/sha256.lua", ".sertexos/apis/sha256")

gt("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/useless/shell.lua", ".sertexos/shell")


term.setTextColor(colors.white)
print("\nDone!")
sleep(1)
Reset()
print("SertexOS Downloaded Successfully!")
term.setTextColor(colors.white)
print("\nPress Any Key")
term.setTextColor(colors.white)
os.pullEvent("key")
sleep(0,1)
term.clear()
term.setCursorPos(1,1)
os.reboot()
