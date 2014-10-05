os.pullEvent = os.pullEventRaw
os.loadAPI(".sertexos/sha256")
os.loadAPI(".sertexos/apis/sertexapi")

if not http then
  error("You need HTTP API enabled!")
end

term.clear()
term.setCursorPos(2,2)
term.setTextColor(colors.red)
print("  # ")
print(" #  ")
print(" ###")
term.setCursorPos(2,2)
sertexapi.center(2, "SertexOS")
term.setTextColor(colors.yellow)
centerDisplay("Loading...")
sleep(1.8)

while true do
if fs.exists(".sertexos/setup") then
	shell.run(".sertexos/setup")
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
		local crypt = sha256.sha256(pass)
		if crypt == f.readLine() then
			f.close()
			shell.run(".sertexos/home")
		else
			print("Wrong Password!")
			sleep(2)
		end
	else
		shell.run(".sertexos/home")
	end
end
end
