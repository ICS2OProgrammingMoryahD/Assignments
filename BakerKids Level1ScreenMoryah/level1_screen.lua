-- Creating Scene Object
-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
-- Created by: Moryah
-- Date: nov. 21, 2019
-- Description: This is the level 1 screen of the game.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------
-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

-----------------------------------------------------------------------------------------
-- Naming Scene
sceneName = "level1_screen"

-----------------------------------------------------------------------------------------
-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
-- The local variables for this scene
local bkg_image
local countDownTimer
local clockText
local words = 0
local pointText
local lives = 3

-- the words
local bakingPowder
local bakingPowderObject
local bakingSoda
local bakingSodaObject
local butter
local butterObject
local chocolate
local chocolateObject
local egg
local eggObject
local flour
local flourObject
local foodColouring
local foodColouringObject
local icing
local icingObject
local milk
local milkObject
local Sprinkle
local SprinkleObject
local sugar
local sugarObject
local vanilla
local vanillaObject

local textField

local numIncorrect = 0

local userAnswer
local correctAnswer

local correctSound = audio.loadSound("Sounds/correct.mp3")
local correctSoundChannel

local wonSound = audio.loadSound("Sounds/won.mp3")
local wonSoundChannel

local incorrectSound = audio.loadSound("Sounds/incorrect.mp3")
local incorrectSoundChannel

local lostSound = audio.loadSound("Sounds/lose.mp3")
local lostSoundChannel

-----------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------
TOTALSECONDS = 120
secondsLeft = 120

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
-- function that calls the timer
local function UpdateTime()
    -- decrement the number of seconds
    secondsLeft = secondsLeft - 1
    timer.performWithDelay(1000)

    -- display the number of seconds seconds left in the clock object
    clockText.text = secondsLeft .. ""

    if (secondsLeft == 0 ) then

        -- everytime user gets answer wrong take away 1 life
        lives = 0

        timer.cancel(countDownTimer)

        -- reset the number of seconds left
        secondsLeft = TOTALSECONDS
        timer.performWithDelay(1000, Visible)
    end
end

-- function that calls the timer
local function StartTimer(event)

    -- create a countdown timer that loops infinitely
    countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
    countDownTimer.isVisible = true

    -- coordinates
    countDownTimer.x = 1000
    countDownTimer.y = 50
end

-- Creating Transitioning Function back to main menu
local function BackTransition( )
    composer.gotoScene( "main_menu", {effect = "crossFade", time = 500})
end

local function Visible()

    heart3.isVisible = true
    heart2.isVisible = true
    heart.isVisible = true
    countDownTimer.isVisible = true
    pointText.isVisible = true
    correctObject.isVisible = false
    incorrectObject.isVisible = false
end

-- Creating Transitioning Function back to main menu
local function BackTransition()
    composer.gotoScene( "main_menu", {effect = "crossFade", time = 500})
end

local function AskQuestion()

    local word = math.random(1,5)

    if (word == 1) then
        icingObject = display.newText( "Icin_", 512, 148, nil, 99 )
        icingObject:setTextColor(0.25, 0.25, 0.25)

        correctAnswer = "g"

    elseif (word == 2) then
        milkObject = display.newText( "Mil_", 512, 148, nil, 99 )
        milkObject:setTextColor(0.25, 0.25, 0.25)

        correctAnswer = "k"

    
    elseif (word == 3) then
        SprinkleObject = display.newText( "Sprinkl_", 512, 148, nil, 99 )
        SprinkleObject:setTextColor(0.25, 0.25, 0.25)

        correctAnswer = "e"


    elseif (word == 4) then
        sugarObject = display.newText( "Suga_", 512, 148, nil, 99 )
        sugarObject:setTextColor(0.25, 0.25, 0.25)

        correctAnswer = "r"

    elseif (word == 5) then
        vanillaObject = display.newText( "Vanill_", 512, 148, nil, 99 )
        vanillaObject:setTextColor(0.25, 0.25, 0.25)

        correctAnswer = "a"

    end
end

local function TextField()

    if (event.phase == "began") then

    elseif (event.phase == "submitted") then

        -- if user enters the correct letter
        if (userAnswer == correctAnswer) then

            -- plays correct sound
            correctSoundChannel = audio.play(correctSound)

            -- show correct object
            correctObject.isVisible = true

            -- adds a point
            points = points + 1

            -- update the points in the display object
            pointsText.text = "points = " .. points

            -- add timer
            timer.performWithDelay(1000, Hide)

            -- you win! after 5 points       
            if (points == 5) then

                wonSoundChannel = audio.play(wonSound)

                -- this object isn't visible
                correctObject.isVisible = false

                -- win object is Visible
                --winObject.isVisible = true

                -- add timer
                timer.performWithDelay(3000, Hide)
            end

        else -- if user ans is wrong

            -- play sound for the wrong answer
            incorrectSoundChannel = audio.play(incorrectSound)

            -- show incorrect
            incorrectObject.isVisible = true

            -- create incorrect text object
            incorrectObject.text = "Inncorect! The correct answer was " .. correctAnswer .. " .DK "

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
                --loseObject.isVisible = true
                
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
    end
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------
-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -------------------------------------------------------------------------------------

    -- Insert the background image
    bkg_image = display.newImage("Images/Level1ScreenMoryah.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    heart = display.newImage("Images/heart.png", 810, 35)
    heart.width = 66
    heart.height = 66

    heart2 = display.newImage("Images/heart.png", 880, 35)
    heart2.width = 66
    heart2.height = 66

    heart3 = display.newImage("Images/heart.png", 950, 35)
    heart3.width = 66
    heart3.height = 66

    -------------------------------------------------------------------------------------
    -- OBJECT CREATION
    -------------------------------------------------------------------------------------
    -- display the amount of words as a text object
    pointText = display.newText("point = " .. words, 512, 573, nil, 44)
    pointText:setTextColor(0, 0, 0)

    clockText = display.newText("" .. secondsLeft, 77, 40, nil, 66)
    clockText:setTextColor(1, 0, 0)

    -- create the correct text object object and make it invisible
    correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight
    *2/3, nil, 40 )
    correctObject:setTextColor(155/255, 42/255, 198/255)

    -- create the incorrect text object object and make it invisible
    incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, 
    display.contentHeight*2/3, nil, 40 )
    incorrectObject:setTextColor(155/255, 42/255, 198/255)

    textField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 
        150, 80)
    textField.inputType = "default"

    -- Creating Back Button
    backButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*1/8,
        y = display.contentHeight*9/10,

        -- Setting Dimensions

        width = 150,
        height = 70,

        -- Setting Visual Properties
        defaultFile = "Images/BackButtonUnpressedMoryah.png",
        overFile = "Images/BackButtonPressedMoryah.png",

        -- Setting Functional Properties
        onRelease = BackTransition
     } )

-----------------------------------------------------------------------------------------
-- Insert images into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image ) 
    sceneGroup:insert( backButton )
    sceneGroup:insert( heart )
    sceneGroup:insert( heart2 )
    sceneGroup:insert( heart3 )
    sceneGroup:insert( pointText )

end --function scene:create( event )

-----------------------------------------------------------------------------------------
-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).
    -------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        ---------------------------------------------------------------------------------
        -- FUNTION CALLS
        ---------------------------------------------------------------------------------
        --call the functions
        StartTimer()
        Visible()
        AskQuestion()

    end

end --function scene:show( event )
-----------------------------------------------------------------------------------------
-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------
-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -------------------------------------------------------------------------------------

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------
-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene