-- Startup Version: 1.1 --

if fs.exists(".sertexos") then
	shell.run(".sertexos/boot")
else
	term.clear()
	term.setCursorPos(1,1)
	printError("Error on booting SertexOS!")
       print("Press any key to install SertexOS")
       os.pullEvent("key")
       shell.run("pastebin", "run", "31AUQX7g")
end