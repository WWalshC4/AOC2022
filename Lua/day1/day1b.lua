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

-- 45000
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

table.sort (elves)

print (tostring (elves [#elves] + elves [#elves - 1] + elves [#elves - 2]))
