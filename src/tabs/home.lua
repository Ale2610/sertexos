os.pullEvent = os.pullEventRaw
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
    shell.run(".sertexos/tabs/applications")
  end
  
  if key == 3 then
    shell.run(".sertexos/tabs/options")
  end

  if key == 4 then
    sleep(0.1)
    shell.run("fg rom/programs/dhell")
  end

  if key == 5 then
    shell.run(".sertexos/tabs/info")
  end

  if key == 6 then
    if fs.exists(".sertexos/.data/pass") then
      shell.run(".sertexos/boot")
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