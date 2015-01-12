os.pullEvent = os.pullEventRaw

print("Installing SertexOS...")

if fs.exists(".sertexos/check") then
	fs.delete(".sertexos/check")
end
	check = fs.open(".sertexos/check", "w")
	check.write("false")
	check.close

	
function gt(url, fileName)
	f = fs.open(fileName, "w")
	f.write(http.get(url).readAll())
	f.close()
	print("Installed "..fileName)
end

if not http then
	print("You need to enable HTTP")
	return
end

fs.makeDir(".sertexos")
fs.makeDir(".sertexos/udb")
fs.makeDir(".sertexos/apis")
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

f = nil

print("SertexOS was installed!")
print("Press Any Key")
os.pullEvent("key")
os.reboot()