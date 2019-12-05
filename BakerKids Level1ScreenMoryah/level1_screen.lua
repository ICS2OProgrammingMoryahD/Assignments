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
local wordsText
local lives = 3

-----------------------------------------------------------------------------------------
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
local sprinkles
local sprinklesObject
local sugar
local sugarObject
local vanilla
local vanillaObject

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
    --timer.performWithDelay(1000)

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

local function Words()
    -- first make the random Words
    
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
    wordsText.isVisible = true
    bakingPowderObject.isVisible = true
    bakingSodaObject.isVisible = true
    butterObject.isVisible = true
    chocolateObject.isVisible = true
    eggObject.isVisible = true
    flourObject.isVisible = true
    foodColouringObject.isVisible = true
    icingObject.isVisible = true
    milkObject.isVisible = true
    sprinklesObject.isVisible = true
    sugarObject.isVisible = true
    vanillaObject.isVisible = true
end

local function Words()
    -- first make the random Words 
end

-- Creating Transitioning Function back to main menu
local function BackTransition()
    composer.gotoScene( "main_menu", {effect = "crossFade", time = 500})
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------
-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

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

    -----------------------------------------------------------------------------------------
    -- OBJECT CREATION
    -----------------------------------------------------------------------------------------
    -- display thw word texts

    bakingPowderObject = display.newText( "Baking Powder", 205, 100, nil, 44 )
    bakingPowderObject:setTextColor(1, 1, 1)

    bakingSodaObject = display.newText( "Baking Soda", 177, 200, nil, 44 )
    bakingSodaObject:setTextColor(1, 1, 1)

    butterObject = display.newText( "Butter", 146, 150, nil, 44 )
    butterObject:setTextColor(1, 1, 1)

    chocolateObject = display.newText( "Chocolate", 500, 200, nil, 44 )
    chocolateObject:setTextColor(1, 1, 1)

    eggObject = display.newText( "Egg", 500, 100, nil, 44 )
    eggObject:setTextColor(1, 1, 1)

    flourObject = display.newText( "Flour", 700, 100, nil, 44 )
    flourObject:setTextColor(1, 1, 1)

    foodColouringObject = display.newText( "Food Colouring", 460, 150, nil, 44 )
    foodColouringObject:setTextColor(1, 1, 1)

    icingObject = display.newText( "Icing", 700, 150, nil, 44 )
    icingObject:setTextColor(1, 1, 1)

    milkObject = display.newText( "Milk", 700, 200, nil, 44 )
    milkObject:setTextColor(1, 1, 1)

    sprinklesObject = display.newText( "Sprinkles", 900, 100, nil, 44 )
    sprinklesObject:setTextColor(1, 1, 1)

    sugarObject = display.newText( "Sugar", 900, 150, nil, 44 )
    sugarObject:setTextColor(1, 1, 1)

    vanillaObject = display.newText( "Vanilla", 900, 200, nil, 44 )
    vanillaObject:setTextColor(1, 1, 1)

    -- display the amount of words as a text object
    wordsText = display.newText("point = " .. words, 512, 573, nil, 44)
    wordsText:setTextColor(0, 0, 0)

    clockText = display.newText("" .. secondsLeft, 77, 40, nil, 66)
    clockText:setTextColor(1, 0, 0)

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

-------------------------------------------------------------------------------------
-- Insert images into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image ) 
    sceneGroup:insert( backButton )
    sceneGroup:insert( heart )
    sceneGroup:insert( heart2 )
    sceneGroup:insert( heart3 )
    sceneGroup:insert( wordsText )
    sceneGroup:insert( bakingPowderObject )
    sceneGroup:insert( bakingSodaObject )
    sceneGroup:insert( butterObject )
    sceneGroup:insert( chocolateObject )
    sceneGroup:insert( eggObject )
    sceneGroup:insert( flourObject )
    sceneGroup:insert( foodColouringObject )
    sceneGroup:insert( icingObject )
    sceneGroup:insert( milkObject )
    sceneGroup:insert( sprinklesObject )
    sceneGroup:insert( sugarObject )
    sceneGroup:insert( vanillaObject )
    sceneGroup:insert( clockText )

end --function scene:create( event )

-----------------------------------------------------------------------------------------
-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        -----------------------------------------------------------------------------------------
        -- FUNTION CALLS
        -----------------------------------------------------------------------------------------
        --call the functions
        StartTimer()
        Visible()

    end

end --function scene:show( event )
-----------------------------------------------------------------------------------------
-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------
-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

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
