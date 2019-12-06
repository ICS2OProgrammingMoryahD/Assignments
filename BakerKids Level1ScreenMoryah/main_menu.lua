-----------------------------------------------------------------------------------------
--
-- main_menu.lua
-- Created by: Moryah
-- Date: nov. 21, 2019
-- Description: This is the main menu, displaying the credits, instructions & play buttons.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Naming Scene
mainMenu = "main_menu"

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( mainMenu )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg_image
local playButton
local creditsButton
local instructionsButton
local muteButton
local unmuteButton

-----------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------

SOUNDON = true
-----------------------------------------------------------------------------------------
muteButton = display.newImageRect("Images/muteButton.png", 150, 150)
muteButton.x = display.contentWidth*1.5/10
muteButton.y = display.contentHeight*1.3/10
muteButton.isVisible = true
-----------------------------------------------------------------------------------------
unmuteButton = display.newImageRect("Images/unmuteButton.png", 150, 150)
unmuteButton.x = display.contentWidth*1.5/10
unmuteButton.y = display.contentHeight*1.3/10
unmuteButton.isVisible = false
-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function Mute(touch)
    if (touch.phase == "ended") then
        --pause the sound
        audio.pause(bkgMusic)
        -- set the boolean varible to be false (sound is now muted)
        SOUNDON = false
        -- hide the mute button 
        muteButton.isVisible = false
        -- make the unmute button visible
        unmuteButton.isVisible = true
    end
end

-- Creating Transition Function to Credits Page
local function CreditsTransition( )       
    composer.gotoScene( "credits_screen", {effect = "crossFade", time = 500})
end 

-----------------------------------------------------------------------------------------

-- Creating Transition to Level1 Screen
local function Level1ScreenTransition( )
    composer.gotoScene( "level1_screen", {effect = "crossFade", time = 1000})
end   

-----------------------------------------------------------------------------------------

-- INSERT LOCAL FUNCTION DEFINITION THAT GOES TO INSTRUCTIONS SCREEN 
local function InstructionsTransition( )
    composer.gotoScene("instructions", {effect = "crossFade", time = 500})
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/MainMenuMoryah.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight


    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Play Button
    playButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*4/8,
            y = display.contentHeight*9/10,

            -- Setting Dimensions
            width = 150,
            height = 70,

            -- Insert the images here
            defaultFile = "Images/PlayButtonUnPressedNicR.png", 170, 120,
            overFile = "Images/PlayButtonPressedNicR.png", 170, 120,

            -- When the button is released, call the Level1 screen transition function
            onRelease = Level1ScreenTransition          
        } )

    -----------------------------------------------------------------------------------------

    -- Creating Credits Button
    creditsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*7/8,
            y = display.contentHeight*9/10,

            -- Setting Dimensions
            width = 150,
            height = 70,

            -- Insert the images here
            defaultFile = "Images/CreditsButtonUnpressedMoryah.png", 170, 120,
            overFile = "Images/CreditsButtonPressedMoryah.png", 170, 120,

            -- When the button is released, call the Credits transition function
            onRelease = CreditsTransition
        } ) 

    -----------------------------------------------------------------------------------------

    -- ADD INSTRUCTIONS BUTTON WIDGET
    instructionsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*1/8,
            y = display.contentHeight*9/10,

            -- Setting Dimensions
            width = 150,
            height = 70,

            -- Insert the images here
            defaultFile = "Images/InstructionsButtonUnpressedMoryah.png", 170, 120,
            overFile = "Images/InstructionsButtonPressedMoryah.png", 170, 120,

            -- When the button is released, call the Credits transition function
            onRelease = InstructionsTransition
        } ) 

    -----------------------------------------------------------------------------------------

    -- Associating button widgets with this scene
    sceneGroup:insert( playButton )
    sceneGroup:insert( creditsButton )
    sceneGroup:insert( instructionsButton )
    

end -- function scene:create( event )   

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then

        -- The function that will go to the main menu 

    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen.
    elseif ( phase == "did" ) then

    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    bkgMusicChannel = audio.play(bkgMusic, {loops = -1})   
    muteButton:addEventListener("touch", Mute)
    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        audio.stop(bkgMusicChannel)

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        muteButton:removeEventListener("touch", Mute)
    end

end -- function scene:hide( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
