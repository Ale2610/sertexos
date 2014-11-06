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
shell.run(".sertexos/home")