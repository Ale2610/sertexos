os.pullEvent = os.pullEventRaw
--Load
os.loadAPI(".sertexos/apis/sertexosapi")

sertexosapi.load()
sertexosapi.start()

--Header and Menu

sertexosapi.header()
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
    shell.run(".sertexos/apps")
  end

end