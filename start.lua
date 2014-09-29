-- Startup Version: 1.1 --

if fs.exists(".sertexos") then
	shell.run(".sertexos/boot")
else
	term.clear()
	term.setCursorPos(1,1)
	shell.run("shell")
end