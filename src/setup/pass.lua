os.pullEvent = os.pullEventRaw

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

os.loadAPI(".sertexos/apis/sertexos")
sertexos.loadWSHA()
sertexos.start()

term.clear()
term.setCursorPos(2,2)
term.setTextColor(red)
print(" SertexOS Password Setup")
print""
print(" Do you want use password?")
print(" Y/N")

while true do
local id,key = os.pullEvent("key")

if key == 21 then
  sleep(0.1)
  term.clear()
  term.setCursorPos(2,2)
  term.setTextColor(red)
  print(" SertexOS Password Setup")
  print""
  term.setTextColor(blue)
  write(" Password: ")
  local pass = read("*")
  write(" Confirm Password: ")
  local confPass = read("*")
  
  if pass == confPass then
    local f =  fs.open(".sertexos/.data/pass", "w")
    local crypt = sha256.sha256(confPass)
    f.write(crypt)
    f.close()
    term.clear()
    term.setCursorPos(2,2)
    term.setTextColor(green)
    print(" Done!")
    sleep(2)
    fs.delete(".sertexos/pass")
    shell.run(".sertexos/boot")
  else
    print""
	term.setTextColor( red )
    print(" Wrong Password!")
    sleep(2)
    shell.run(".sertexos/pass")
  end
end

if key == 49 then
  if fs.exists(".sertexos/.data/pass") then
    fs.delete(".sertexos/.data/pass")
    fs.delete(".sertexos/pass")
    shell.run(".sertexos/boot")
  else
    fs.delete(".sertexos/.data/pass")
    fs.delete(".sertexos/pass")
    shell.run(".sertexos/boot")
  end
end


end