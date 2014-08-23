-- !!!!DON'T USE THIS PROGRAM!!!! --




-- A very basic 'hello, steve' program.
 
local sFile, sName = ".sertexos/.data/account", "SertexOS" -- Our data file's name, and our user's name.
-- We won't worry about finding the right directory to save our data in; we'll just use /
 
if fs.exists(sFile) then -- Open the file if it exists, and get the user's name from it.
        local hRead = assert(fs.open(sFile, "r")) -- assert will error for us if we can't open the file.
        -- the 'h' in the varaible name stands for 'handle', and 'read' is to remind me that I can only read from that handle.
        sName = hRead.readLine() -- Read a line of data from the handle
        hRead.close() -- Close the handle! This is extremely important, as not doing so can cause errors when writin/opening the file.
end
 
if sName == "" then -- If the user's name doesn't exist, ask them for it.
        print("Hello there, what's your name?")
        local sInput = read()
        if sInput ~= "" then
                print("Hi, " .. sInput .. "!")
                sName = sInput
                -- Now, let's save the name.
                hWrite = fs.open(sFile, "w") -- w for write! Note that this will also clear the file.
                -- Note that if the above errors, you'll get an error message somewhere else. Use the example below to catch the error.
                hWrite.write(sName) -- Write the user's name
                hWrite.close() -- Close it; still very important.
 
                print("I'm currently calculating Pi to 1" .. string.rep("0", 20) .. "digits.") -- Banter. :)
                print("I'll see you again soon, " .. sName .. "!")
                return
        else
                print("I'm sorry, I'm not allowed to speak to strangers, stranger.")
                return -- exit :D
        end
end
-- We don't need to use an else here, since we're exiting in both branches of the above if statement.
print("Hi again, " .. sName .. "!\nHow are you doing today?") -- \n is a newline.
read() -- Discard the input, this is just an example, after all :)
print("Damnit! You made me garbagecollect all that work on my Pi digits!")