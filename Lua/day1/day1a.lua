do	--generate inputData from input text by line
	io.input ('input')

	local data

	inputData = {}

	repeat
		data = io.read ('*line')
		table.insert (inputData, data)
	until
		data == nil
end

-- 24000
sampleData = {
	'1000',
	'2000',
	'3000',
	'',
	'4000',
	'',
	'5000',
	'6000',
	'',
	'7000',
	'8000',
	'9000',
	'',
	'10000',
	'',
}


--local runData = sampleData
local runData = inputData

local elves = {}

local currentCalories = 0

for _, line in ipairs (runData) do
	local calories = tonumber (line)
	if (calories == nil) then
		table.insert (elves, currentCalories)
		currentCalories = 0
	else
		currentCalories = currentCalories + calories
	end
end

local maxCal = 0

for elf, calories in pairs (elves) do
	if (calories > maxCal) then
		maxCal = calories
	end
end

print (tostring (maxCal)) -- 69528
