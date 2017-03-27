fs.delete("startup")
if fs.exists(".sertexos/startup") then
	fs.move(".sertexos/startup", "startup")
end
shell.run(".sertexos/boot")