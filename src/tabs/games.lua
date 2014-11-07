os.pullEvent = os.pullEventRaw
os.loadAPI(".sertexos/apis/sertexos")
sertexos.load()
sertexos.start()
sertexos.headerSub("Games")

print(" [1] Worm\n [2] Redirection\n [3] Adventure\n [4] Back")

while true do
  local id, key = os.pullEvent("key")

  if key == 2 then
    shell.run("fg /rom/programs/fun/worm")
  end

  if key == 3 then
    shell.run("fg /rom/programs/fun/advanced/redirection")
  end

  if key == 4 then
    shell.run("fg /rom/programs/fun/adventure")
  end

  if key == 5 then
    shell.run(".sertexos/tabs/applications")
  end
  sleep(0)
end