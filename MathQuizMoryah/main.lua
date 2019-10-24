-----------------------------------------------------------------------------------------
-- Title: MathQuiz
-- Name: Moryah
-- Course: ICS2O/3C

-- This program creates math problems with random operators
-- division, use numbers in the range (1 - 100). The numbers should divide perfectly 
-- and every number possibility must be allowed.
-- (*,-,+,/)
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 1/255, 1/255, 55/255)

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------


local num1
local num2
local userAns
local randomOp
local correctAns
local correctObject
local incorrectObject
local numericField
local quesObject
local points
local lives

-----------------------------------------------------------------------------------------
-- LOCAL FUNTIONS
-----------------------------------------------------------------------------------------

local function AskQuestion()

	-- chose a random operators
	randomOp = math.random(1,4)

	-- chose a random operators
	if(randomOp == 1) then

		-- generate 2 random number between 1 & 20
		num1 = math.random(1, 20)
		num2 = math.random(1, 20)

		-- the correct ans
		correctAns = num1 + num2

		-- create question in text object
		quesObject.text = num1 .. " + " .. num2 .. " = "

	elseif(randomOp == 2) then

		-- generate 2 random number between 1 & 20
		num1 = math.random(1, 20)
		num2 = math.random(1, 20)

		if(num1 < num2) then

			-- the correct ans
			correctAns = num2 - num1
			
			-- create question in text object
			quesObject.text = num2 .. " - " .. num1 .. " = "
		else

			-- the correct ans
			correctAns = num1 - num2
			
			-- create question in text object
			quesObject.text = num1 .. " - " .. num2 .. " = "
		end

	elseif(randomOp == 3) then

		-- generate 2 random numbers between  1 & 10
		num1 = math.random(1, 10)
		num2 = math.random(1, 10)

		-- the correct ans
		correctAns = num1 * num2

		-- create question in text object
		quesObject.text = num1 .. " * " .. num2 .. " = "

	elseif(randomOp == 4) then

		-- generate 2 numbers from 1 to 100
		num1 = math.random(1, 100)
		num2 = math.random(1, 100)
			
		-- the correct ans
		correctAns = num1 / num2

		-- create question in text object
		quesObject.text = num1 .. " / " .. num2 .. " = "
	end
end

local function Hide()
	correctObject.isVisible = false
	incorrectObject.isVisible = false
end

-- user uses the numeric field
local function NumericFieldListener( event )

	if(event.phase == "began") then

	-- when the answer is submitted (enter key is pressed) set user input to user's
	elseif (event.phase == "submitted") then

		-- change the user's ans into numbers
		userAns = tonumber(event.target.text)

		-- if the user ans is correct
		if(user == correctAns) then

			-- show correct object
			correctObject.isVisible = true

			-- add timer
			timer.performWithDelay(2000, HideCorrect)

		else -- if user ans is wrong

			-- create incorrect text object
			incorrectObject.text = ("Inncorect! The correct answer was " .. correctAns " .DK ")

			-- add timer
			timer.performWithDelay(2000, HideIncorrect)
		end

		-- clear text field
		event.target.text = ""
		
	end
end

