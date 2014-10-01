os.pullEvent = os.pullEventRaw

term.clear()
term.setCursorPos(1,1)
term.setTextColor(colors.red)
print""
print(" SertexOS GPS")
print""
local x, y, z = gps.locate(5)
if not x then
	term.setTextColor(colors.red)
	textutils.slowPrint(" Failed to get your position!")
	print(" Reason: No modem or no GPS Tower!")
	print""
	term.setTextColor(colors.yellow)
	print(" Press Any Key!")
	os.pullEvent("key")
	term.clear()
	shell.run("exit")
else
	term.setTextColor(colors.yellow)
	textutils.slowPrint(" Position:")
	print""
	term.setTextColor(colors.lime)
	textutils.slowPrint(" x: " .. x)
	textutils.slowPrint(" y: " .. y)
	textutils.slowPrint(" z: " .. z)
	print""
	term.setTextColor(colors.yellow)
	print(" Press Any Key!")
        os.pullEvent("key")
        term.clear()
	shell.run("exit")
end