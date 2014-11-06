os.pullEvent = os.pullEventRaw
os.loadAPI(".sertexos/apis/sertexos")
sertexos.loadWithSHA()
sertexos.start()

term.setTextColor( title )
sertextext.center(2, "SertexOS")
term.setTextColor( text )
sertextext.slowCenterDisplay("Loading...")

sleep(0.5)

if fs.exists(".sertexos/setup") then
	shell.run(".sertexos/setup")
end

currentVersion = fs.open(".sertexos/ver", "r")

if not currentVersion.readLine() == http.get("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/ver.txt").readLine() then
  term.clear()
  sertextext.center(2, "New version found! If your current version is recent please ignore")
  sertextext.center(4, "Press Any Key")
  os.pullEvent("key")
end

if fs.exists(".sertexos/.data/pass") then
		password = fs.open(".sertexos/.data/pass", "r")
		
		term.clear()
		
		while true do
			term.setTextColor( red )
			sertextext.slowCenterDisplay("Password: ")
			input = read("*")
			
			if sha256.sha256( input ) == password.readLine() then
				shell.run(".sertexos/home")
			else
				sertextext.slowCenter(4, "Wrong Password!")
			end
		end
	else
		shell.run(".sertexos/home")
	end