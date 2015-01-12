function start()
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
end

function boot()
start()
os.pullEvent = os.pullEventRaw

if fs.exists(".sertexos/check") then
	check = fs.open(".sertexos/check", "r")
	if check.readLine() == "true" then
		check.close()
		sleep(0.5)
		term.clear()
		term.setCursorPos(1,1)
		check = fs.open(".sertexos/check", "w")
		check.write("false")
		check.close()
		print("SertexOS is updating...")
		shell.run("pastebin run 31AUQX7g")
	end
	check.close()
else
	check = fs.open(".sertexos/check", "w")
	check.write("false")
	check.close()
end

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

if not currentVersion.readLine() == http.get("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/ver.txt").readLine() then
  term.clear()
  sertextext.center(2, "New version found! If your current version is recent please ignore")
  sertextext.center(4, "Press Any Key")
  os.pullEvent("key")
end
while true do
	term.clear()
	term.setCursorPos(1,1)
	term.setTextColor( red )
	sertextext.center(2, "SertexOS")
	sertextext.left(4, "Username: ")
	username = read()
	if fs.exists(".sertexos/udb/"..username.."/.password") then
		sertextext.left(5, "Password: ")
		password = read("*")
		upw = fs.open(".sertexos/udb/"..username.."/.password", "w")
		userpw = upw.readLine()
		upw.close()
		if userpw == sha256.sha256(userpw) then
			userLogged = username
			home()
		else
			sertextext.left(6, "Wrong Password!")
			sleep(2)
		end
	else
		userLogged = username
		home()
	end
end

end

function home()
os.loadAPI(".sertexos/apis/sertexos")

sertexos.load()
sertexos.start()
sertexos.header()

print(" [1] Applications")
print(" [2] Options")
print(" [3] Shell")
print(" [4] Info/Help")
print(" [5] Lock")
print(" [6] Reboot")
print(" [7] Shutdown")

while true do

  local id, key = os.pullEvent("key")

  if key == 2 then
    applications()
  end
  
  if key == 3 then
    options()
  end

  if key == 4 then
    sleep(0.1)
    shell.run("fg .sertexos/applications/shell")
  end

  if key == 5 then
    info()
  end

  if key == 6 then
    if fs.exists(".sertexos/udb/"..userLogged.."/.password") then
      boot()
    else
		term.setTextColor( red )
      print(" Set A Password")
    end
  end

  if key == 7 then
    term.clear()
    term.setCursorPos(1,1)
    sertextext.slowCenterDisplay("Rebooting...")
    sleep(2)
    os.reboot()
  end
  
  if key == 8 then
    term.clear()
    term.setCursorPos(1,1)
    sertextext.slowCenterDisplay("Shutting Down...")
    sleep(2)
    os.shutdown()
  end

  sleep(0)

end
end

function options()
os.pullEvent = os.pullEventRaw
os.loadAPI(".sertexos/apis/sertexos")

sertexos.loadWithSHA()
sertexos.start()

function setLabel()
    sleep(0.1)
	term.clear()
	term.setCursorPos(2,2)
	term.setTextColor(text)
	write("Set Computer Name: ")
	local label = read()
	os.setComputerLabel(label)
	sleep(1)
	term.setTextColor(green)
	print""
	print(" Computer Name: " .. os.getComputerLabel())
	sleep(1)
	options()
end

function clearLabel()
	sleep(0.1)
	term.setTextColor(text)
	os.setComputerLabel(nil)
	print""
	print(" Computer Name Cleared!")
end

function update()
    sertexos.unloadWithSHA()
    check = fs.open(".sertexos/check", "w")
    check.write("true")
    check.close()
		term.clear()
    sleep(1)
    sertextext.slowCenterDisplay("Rebooting...")
    sleep(1)
    os.reboot()
end

 --Interface
 if not http then
print("You need HTTP API enabled!")
end

sertexos.headerSub("Options")
print(" [1] Set Computer Name\n [2] Clear Computer Name\n [3] Update\n [4] Reset Password\n [5] Back")

while true do
  local id,key = os.pullEvent("key")
 
    if key == 2 then  --1
		setLabel()
    end
	
	if key == 3 then --2
		clearLabel()
	end
	
	if key == 4 then  --3
	  update()
    end
	
	if key == 5 then --4
		if fs.exists(".sertexos/udb/"..userLogged.."/.password") then
			sleep(0.1)
			print("Change Password For "..userLogged)
			write(" Insert password: ")
			local oldPass = read("*")
			local crypt = sha256.sha256(oldPass)
			local f = fs.open(".sertexos/udb/"..userLogged.."/.password", "r")
			if crypt == f.readLine() then
				textutils.slowPrint(" Loading...")
				f.close()
				pass = http.get("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/setup/pass.lua")
				f = fs.open(".sertexos/pass", "w")
				f.write(pass.readAll())
				f.close()
				sleep(0.3)
				shell.run(".sertexos/pass")
			else
				print(" Wrong Password!")
				sleep(2)
				options()
			end
		else
			pass = http.get("https://raw.githubusercontent.com/Sertex-Team/sertexos/master/src/setup/pass.lua")
			f = fs.open(".sertexos/pass", "w")
			f.write(pass.readAll())
			f.close()
			sleep(0.3)
			shell.run(".sertexos/pass")
		end
	end
	
	if key == 6 then --5
		home()
	end
end
end

function info()
os.pullEvent = os.pullEventRaw

os.loadAPI(".sertexos/apis/sertexos")
sertexos.load()
sertexos.start()

local ver = fs.open(".sertexos/ver", "r")

term.clear()
term.setCursorPos(1,1)
term.setTextColor(blue)
print""
print(" SertexOS V: "..ver.readLine())
print(" Created by Ale2610 (_Ale2610_ In-Game)")
print""
print(" Logged As "..userLogged)
print""
print(" Shell:")
print(" How to exit from Shell")
print(" Write 'exit'")
print""
print(" SertexGPS")
print(" If you lost your house, you can use SertexGPS")
print""
term.setTextColor(green)
print(" Press Any Key")
os.pullEvent("key")
home()
end

function games()
os.loadAPI(".sertexos/apis/sertexos")
sertexos.load()
sertexos.start()
sertexos.headerSub("Games")

print(" [1] Worm\n [2] Redirection\n [3] Adventure\n [4] Back")

while true do
  local id, key = os.pullEvent("key")

  if key == 2 then
    shell.run("fg /rom/programs/fun/worm")
  end

  if key == 3 then
    shell.run("fg /rom/programs/fun/advanced/redirection")
  end

  if key == 4 then
    shell.run("fg /rom/programs/fun/adventure")
  end

  if key == 5 then
    applications()
  end
  sleep(0)
end
end

function applications()

	term.setBackgroundColor( bg )
	term.clear()


 --Data
os.loadAPI(".sertexos/apis/sertexos")
sertexos.load()
sertexos.start()

function monitor()
	while true do
		term.clear()
		sertexos.headerSub("Monitor")
		sertextext.displayCenter("Monitor Name: ")
		local monitorName = read()
		if not peripheral.isPresent(monitorName) then
			print("No monitor found")
			sleep(2)
			monitor()
		end
		term.clear()
		sertexos.headerSub("Monitor")
		sertextext.centerDisplay("Program: ")
		local monitorProgram = read()
		term.clear()
		sertexos.headerSub("Monitor")
		sertextext.centerDisplay("Argument: ")
		local monitorArgument = read()
		if monitorArgument > 0 then
			shell.run("fg monitor "..monitorName.." "..monitorProgram.." "..monitorArgument)
			break
		else
			shell.run("fg monitor "..monitorName.." "..monitorProgram)
			break
	end
end

--Interface

sertexos.headerSub("Applications")
term.setTextColor(dir)
print(" [1] Games")
term.setTextColor(blue)
print(" [2] Ice-Browser\n [3] SertexGPS\n [4] LuaIDE\n [5] Firewolf\n [6] Monitor\n [7] Back")

while true do
       id, key = os.pullEvent("key")
	
	if key == 2 then
	  games()
	end
	
	if key == 3 then
		shell.run("fg", ".sertexos/applications/iceBrowser")
	end
	
	if key == 4 then
		shell.run("fg", ".sertexos/applications/sertexgps")
	end
	
	if key == 5 then
		shell.run("fg", ".sertexos/applications/luaide")
	end
	
	if key == 6 then
		shell.run("fg", ".sertexos/applications/firewolf")
	end
	
	if key == 7 then
		monitor()
	end
		
    if key == 8 then
      home()
    end
	
end
end
end

start()
home()
