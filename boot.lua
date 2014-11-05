os.pullEvent = os.pullEventRaw
os.loadAPI(".sertexos/apis/sertexos")
sertexos.loadWithSHA()
sertexos.start()

function load()
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
end

term.setTextColor( title )
sertextext.center(2, "SertexOS")
term.setTextColor( text )
sertextext.slowCenterDisplay("Loading...")
sleep(1.8)

recentVersion = fs.open(".sertexos/recentVersion", "w")
recentVersion.write(http.get("").readLine())
recentVersion.close()

if fs.exists(".sertexos/setup") then
	shell.run(".sertexos/setup")
end

load()