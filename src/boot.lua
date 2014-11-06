os.pullEvent = os.pullEventRaw
os.loadAPI(".sertexos/apis/sertexos")
sertexos.loadWithSHA()
sertexos.start()

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