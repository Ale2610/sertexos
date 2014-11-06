os.pullEvent = os.pullEventRaw

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