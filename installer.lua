os.pullEvent = os.pullEventRaw

print("Installing SertexOS...")

if fs.exists(".sertexos/check") then
	fs.delete(".sertexos/check")
end
	check = fs.open(".sertexos/check", "w")
	check.write("false")
	check.close
	
function clear()
  term.clear()
  term.setCursorPos(1,1)
end

--installer!
function gt(url, fileName)
	f = fs.open(fileName, "w")
	f.write(http.get(url).readAll())
	f.close()
	print("Installed "..fileName)
end --end installer

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

print("\nDone!")
sleep(1)
Reset()
print("SertexOS Downloaded Successfully!")
print("\nPress Any Key")
os.pullEvent("key")
sleep(0,1)
term.clear()
term.setCursorPos(1,1)
os.reboot()
