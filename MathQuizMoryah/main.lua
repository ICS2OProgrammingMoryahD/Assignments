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

local correctAns = 0
local correctObject
local incorrectObject
local lives = 3
local loseObject
local num1
local num2
local numericField
local numIncorrect
local points = 5
local pointsText
local quesObject
local quesObjecetText
local randomOp
local userAns
local winObject

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
		quesObjecetText = num1 .. " + " .. num2 .. " = "

	elseif(randomOp == 2) then

		-- generate 2 random number between 1 & 20
		num1 = math.random(1, 20)
		num2 = math.random(1, 20)

		if(num1 < num2) then

			-- the correct ans
			correctAns = num2 - num1
			
			-- create question in text object
			quesObjecetText = num2 .. " - " .. num1 .. " = "
		else

			-- the correct ans
			correctAns = num1 - num2
			
			-- create question in text object
			quesObjecetText = num1 .. " - " .. num2 .. " = "
		end

	elseif(randomOp == 3) then

		-- generate 2 random numbers between  1 & 10
		num1 = math.random(1, 10)
		num2 = math.random(1, 10)

		-- the correct ans
		correctAns = num1 * num2

		-- create question in text object
		quesObjecetText = num1 .. " * " .. num2 .. " = "

	elseif(randomOp == 4) then

		-- generate 2 numbers from 1 to 100
		num1 = math.random(1, 100)
		num2 = math.random(1, 100)
			
		-- the correct ans
		correctAns = num1 / num2

		-- create question in text object
		quesObjecetText = num1 .. " / " .. num2 .. " = "
	end
	quesObjecetText.isVisible = true
end

local function Hide()
	correctAns.isVisible = false
	lives.isVisible = true
	loseObject.isVisible = false
	points.isVisible = true
	pointsText = false
	winObject.isVisible = false
	AskQuestion()
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

			-- give a point if user gets the correct answer
			points = points + 1

			-- update it in the display object
			pointsText.text = "points = " .. points

			-- add timer
			timer.performWithDelay(2000, HideCorrect)

			-- show "you win!" after 5 points		
			if (points == 5) then

				-- this object isn't visible
				correctObject.isVisible = false

				-- win object is Visible
				winObject.isVisible = true

				-- add timer
				timer.performWithDelay(2000, HideWin)
			end

		else -- if user ans is wrong

			-- create incorrect text object
			incorrectObject.text = ("Inncorect! The correct answer was " .. correctAns .. " .DK ")

			-- everytime user gets answer wrong add 1 to numIncorrect
			numIncorrect = numIncorrect + 1

			-- add timer
			timer.performWithDelay(2000, HideCorrect)

			-- display game over after 3 wrong answers
			if (numIncorrect == 3) then

				-- this isn't visible
				incorrectObject.isVisible = false

				-- this is visible
				loseObject.isVisible = true
				
				-- added timer
				timer.performWithDelay(2000, HideLose)
			end
		end

		-- clear text field
		event.target.text = ""		
	end
end

-----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------

-- displays a question and sets the colour
quesObject = display.newText( "", display.contentWidth/3, display.contentHeight/2,
	 nil, 50 )
	quesObject:setTextColor(1, 1, 1)

-- create the correct text object object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, 
	display.contentHeight
	*2/3, nil, 50 )
	correctObject:setTextColor(155/255, 42/255, 198/255)
	correctObject.isVisible = false


-- create the incorrect text object object and make it invisible
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, 
	display.contentHeight
	*2/3, nil, 50 )
	incorrectObject:setTextColor(155/255, 42/255, 198/255)
	incorrectObject.isVisible = false


-- create the win text object object and make it invisible
winObject = display.newImageRect("Images/win.png", 800, 501)
	winObject.x = display.contentWidth/2
	winObject.y = display.contentWidth/2.6
	winObject.isVisible = false

-- create the lose text object object and make it invisible
loseObject = display.newImageRect("Images/lose.png", 800, 501)
	loseObject.x = display.contentWidth/2
	loseObject.y = display.contentWidth/2.6
	loseObject.isVisible = false


-- Create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 
	150,
	 80 )
	numericField.inputType = "number"

-- add the event listen for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)

-- display the amount of points as a text object
pointsText = display.newText("point = " .. points, display.contentWidth/3, display.
	contentHeight/3, nil, 50)
-----------------------------------------------------------------------------------------
-- FUNTION CALLS
-----------------------------------------------------------------------------------------

--call the function to ask the question
AskQuestion()