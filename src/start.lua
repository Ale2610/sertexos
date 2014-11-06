-- Startup Version: 1.1 --

if fs.exists(".sertexos") then
	shell.run(".sertexos/boot")
else
	print("Error on loading SertexOS")
end