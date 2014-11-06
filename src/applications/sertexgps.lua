os.pullEvent = os.pullEventRaw
os.loadAPI(".sertexos/apis/sertexos")
sertexos.load()
sertexos.start()

term.clear()
term.setCursorPos(1,1)
term.setTextColor( red )
sertextext.slowCenter(2, "SertexOS GPS")
sertextext.slowCenter(4,"Looking For GPS Tower...")
local x, y, z = gps.locate(5)
if not x then
	term.setTextColor( red )
	textutils.slowPrint(" Failed to get your position!")
	print(" Reason: No modem or no GPS Tower!")
	print""
	term.setTextColor( blue )
	print(" Press Any Key!")
	os.pullEvent("key")
	term.clear()
	shell.run("exit")
else
	term.setTextColor( blue )
	textutils.slowPrint(" Position:")
	print""
	term.setTextColor( green )
	textutils.slowPrint(" x: " .. x)
	textutils.slowPrint(" y: " .. y)
	textutils.slowPrint(" z: " .. z)
	print""
	term.setTextColor( blue )
	print(" Press Any Key!")
        os.pullEvent("key")
        term.clear()
	shell.exit()
end