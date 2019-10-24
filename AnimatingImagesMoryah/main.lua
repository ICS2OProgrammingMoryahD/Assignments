-----------------------------------------------------------------------------------------
-- Title: AnimatingImages
-- Name: Moryah
-- Course: ICS2O/3C
-- This program displays images moving across the screen
-- main.lua
--
-----------------------------------------------------------------------------------------

-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar) 

-----------------------------------------------------------------------------------------
-- TEXT
-----------------------------------------------------------------------------------------

-- write nameText
nameText = display.newText("By Moryah.", 512, 660, nil, 70)

-- set text colour
nameText:setTextColor(123/255, 145/255, 178/255)

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- sets the background 
local background = display.newImageRect("Images/sky.gif", 1100, 850)
local bbird = display.newImageRect("Images/bbird.png", 154, 153)
local car = display.newImageRect("Images/car.png", 202, 202)
local homer2 = display.newImageRect("Images/homer2.gif", 200, 200)
local reverse = 1

-----------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------

-- make  a golbal variable
SCROLLSPEED = 3

-----------------------------------------------------------------------------------------
-- COORDINATES
-----------------------------------------------------------------------------------------


-- adding background coordinates
background.x = 500
background.y = 400

-- adding bbird coordinates
bbird.x = 100
bbird.y = 150

-- adding car coordinates
car.x = 1040
car.y = 530

-- adding homer coordinates
homer2.x = 50
homer2.y = 500

-----------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------

-- Function: MoveCar
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scrool speed to the x-value of the ship

local function MoveCar(event)
	-- add the scroll speed to the x-value of the ship
	car.x = car.x - SCROLLSPEED
end

-- MoveCar will be called over and over again
Runtime:addEventListener("enterFrame", MoveCar)


-- Function: MoveHomer2
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scrool speed to the x-value of the ship

local function MoveHomer2(event)
	-- add the scroll speed to the x-value of the ship
	homer2.x = homer2.x + SCROLLSPEED
end

-- MoveHomer2 will be called over and over again
Runtime:addEventListener("enterFrame", MoveHomer2)

bbird.rotation = 333
print( bbird.rotation )  -- Prints 45 in the terminal

local function rockBbird()
    if ( reverse == 0 ) then
        reverse = 1
        transition.to( bbird, { rotation=-340, time=80, transition=easing.inOutCubic } )
    else
        reverse = 0
        transition.to( bbird, { rotation=340, time=80, transition=easing.inOutCubic } )
    end
end
  
timer.performWithDelay( 777, rockBbird, 0 )  -- Repeat forever

if(car.x < 0) then
	car.x = car.x + 3 xSCROLLSPEED = -xSCROLLSPEED 
end--Left
