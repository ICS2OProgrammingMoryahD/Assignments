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
local numIncorrect = 0
local points = 0
local pointsText
local quesObject
local randomOp
local userAns
local winObject

-----------------------------------------------------------------------------------------

local clockText
local countDownTimer

-----------------------------------------------------------------------------------------

local correctSound = audio.loadSound("Sounds/correct.mp3")
local correctSoundChannel

local winnerSound = audio.loadSound("Sounds/won.mp3")
local winnerSoundChannel

local incorrectSound = audio.loadSound("Sounds/incorrect.mp3")
local incorrectSoundChannel

local lostSound = audio.loadSound("Sounds/lose.mp3")
local lostSoundChannel

-----------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------

TOTALSECONDS = 10
secondsLeft = 10

-----------------------------------------------------------------------------------------
-- creating hearts
local heart = display.newImage("Images/heart.png", 950, 66)
	
	heart.width = 100
	heart.height = 100

local heart2 = display.newImage("Images/heart.png", 830, 66)

	heart2.width = 100
	heart2.height = 100

local heart3 = display.newImage("Images/heart.png", 710, 66)
	
	heart3.width = 100
	heart3.height = 100

-----------------------------------------------------------------------------------------
-- LOCAL FUNTIONS
-----------------------------------------------------------------------------------------

local function AskQuestion()

	-- chose a random operators
	randomOp = math.random(1,5)
	
	-- chose a random operators
	if(randomOp == 1) then

		-- generate 2 random number between 1 & 20
		num1 = math.random(1, 20)
		num2 = math.random(1, 20)

		-- the correct ans
		correctAns = num1 + num2

		-- create question in text object
		quesObject.text = num1 .. " + " .. num2 .. " ="

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

	elseif(randomOp == 5) then

		-- generate 2 numbers from 1 to 100
		num1 = math.random(1, 20)
		num2 = math.random(1, 5)
			
		-- the correct ans
		correctAns = num1 ^ num2

		-- create question in text object
		quesObject.text = num1 .. " ^ " .. num2 .. " = "
	end

	local function roundToNthDecimal(correctAns, n)
		local mult = 10^(n or 0)
		return math.floor(correctAns * mult + 0.5) / mult
	end
end


-- function that calls the timer
function UpdateTime()
	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1
	--timer.performWithDelay(1000)

	-- display the number of seconds seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then

		-- everytime user gets answer wrong take away 1 life
		lives = lives - 1

		-- taking away hearts
		if (lives == 2) then

			-- heart isn't visible
			heart3.isVisible = false

		elseif (lives == 1) then 

			-- hearts aren't visible
			heart3.isVisible = false
			heart2.isVisible = false
					
		elseif (lives == 0) then 

			-- hearts aren't visible
			heart3.isVisible = false
			heart2.isVisible = false
			heart.isVisible = false

			timer.cancel(countDownTimer)
		end

		-- reset the number of seconds left
		secondsLeft = TOTALSECONDS
	end
end

-- function that calls the timer
function StartTimer(event)

	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
	countDownTimer.isVisible = true

	-- coordinates
	countDownTimer.x = 20
	countDownTimer.y = 20
end

local function Hide()

	correctObject.isVisible = false
	countDownTimer.isVisible = true
	incorrectObject.isVisible = false
	loseObject.isVisible = false
	pointsText.isVisible = true
	winObject.isVisible = false
	quesObject.isVisible = true
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
		if(userAns == correctAns) then

			correctSoundChannel = audio.play(correctSound)

			-- show correct object
			correctObject.isVisible = true

			-- give a point if user gets the correct answer
			points = points + 1

			-- update it in the display object
			pointsText.text = "points = " .. points

			-- add timer
			timer.performWithDelay(1000, Hide)

			-- show "you win!" after 5 points		
			if (points == 5) then

				winnerSoundChannel = audio.play(winnerSound)

				-- this object isn't visible
				correctObject.isVisible = false

				-- win object is Visible
				winObject.isVisible = true

				-- add timer
				timer.performWithDelay(3000, Hide)
			end

		else -- if user ans is wrong

			incorrectSoundChannel = audio.play(incorrectSound)

			incorrectObject.isVisible = true

			-- create incorrect text object
			incorrectObject.text = "Inncorect! The correct answer was " .. correctAns .. " .DK "

			-- everytime user gets answer wrong add 1 to numIncorrect
			numIncorrect = numIncorrect + 1

			-- everytime user gets answer wrong take away 1 life
			lives = lives - 1

			-- add timer
			timer.performWithDelay(1000, Hide)

			-- taking away hearts
			if (lives == 2) then

				-- heart isn't visible
				heart3.isVisible = false

			elseif (lives == 1) then 

				-- hearts aren't visible
				heart3.isVisible = false
				heart2.isVisible = false

			elseif (lives == 0) then 

				lostSoundChannel = audio.play(lostSound)

				-- this isn't visible
				incorrectObject.isVisible = false

				-- this is visible
				loseObject.isVisible = true
				
				-- added timer
				timer.performWithDelay(3000, Hide)	

				-- hearts aren't visible
				heart3.isVisible = false
				heart2.isVisible = false
				heart.isVisible = false

				timer.cancel(countDownTimer)
			end

			-- display game over after 3 wrong answers
			if (numIncorrect == 3) then

				lostSoundChannel = audio.play(lostSound)

				-- this isn't visible
				incorrectObject.isVisible = false

				-- this is visible
				loseObject.isVisible = true
				
				-- added timer
				timer.performWithDelay(3000, Hide)

				-- hearts aren't visible
				heart3.isVisible = false
				heart2.isVisible = false
				heart.isVisible = false
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
quesObject = display.newText( "", display.contentWidth/3.1, display.contentHeight/2,
	 nil, 50 )
	quesObject:setTextColor(1, 1, 1)

-- create the correct text object object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, 
	display.contentHeight
	*2/3, nil, 40 )
	correctObject:setTextColor(155/255, 42/255, 198/255)
	correctObject.isVisible = false


-- create the incorrect text object object and make it invisible
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, 
	display.contentHeight
	*2/3, nil, 40 )
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

clockText = display.newText("" .. secondsLeft, 55, 55, nil, 110)

-----------------------------------------------------------------------------------------
-- FUNTION CALLS
-----------------------------------------------------------------------------------------

--call the function to ask the question
AskQuestion()
StartTimer()