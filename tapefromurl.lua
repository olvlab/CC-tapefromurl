-- made by olv

local arg = {...}
 
local tape
if arg[2] then
 tape = peripheral.wrap(arg[2])
end
 
if not tape then
 if arg[2] then
  error("Tape drive with ID "..arg[2].." not found")
 end
 tape = peripheral.find('tape_drive')
end
 
print("Connecting to "..arg[1])
 
local site = http.get(arg[1],nil,true)
local contents = site.readAll()
site:close()
 
tape.seek(-tape.getSize())
tape.write(contents)
tape.seek(-tape.getSize())
 
print("Wrote "..#contents.." bytes to tape")
