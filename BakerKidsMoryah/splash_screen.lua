-----------------------------------------------------------------------------------------
--
-- Created by: Moryah
-- Date: Nov. 05, 2019
-- Description: This is the splash screen of the game. It displays the 
-- company logo that will
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )
-----------------------------------------------------------------------------------------

-- Name the Scene
sceneName = "splash_screen"
-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
 
-- The local variables for this scene
local logo
local scrollXSpeed = 10
local scrollYSpeed = -4

--------------------------------------------------------------------------------------------
-- SOUNDS
--------------------------------------------------------------------------------------------

local metroidSounds = audio.loadSound("Sounds/metroid.mp3")
local metroidSoundsChannel

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

-- The function that will go to the main menu 
local function gotoMainMenu()
    composer.gotoScene( "main_menu" )
end

-- Creating Transition Function to Credits Page
local function mainMenuTransition( )       
    composer.gotoScene( "main_menu", {effect = "zoomInOutFade", time = 500})
end 

-----------------------------------------------------------------------------------------

local function FadeLogo(event)
    -- change the transparency of the logo so that the logo fades zoomInOutFade
    logo.alpha = logo.alpha - 0.01
end

function scale( event )
    logo:scale( 1.001, 0.93 )
end
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- set the background to be black
    display.setDefault("background", 233/255, 233/255, 255/255)

    -- Insert the logo image
    logo = display.newImageRect("Images/CompanyLogoMoryah@2x.png", 444, 444)

    -- set the initial x and y position of the logo
    logo.x = 512
    logo.y = 384

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( logo )

end -- function scene:create( event )

--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    -----------------------------------------------------------------------------------------
    local phase = event.phase
    -----------------------------------------------------------------------------------------
    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------
    elseif ( phase == "did" ) then
        -- set the image to be transparent
        logo.alpha = 1

        -- start the splash screen music
        metroidSoundsChannel = audio.play( metroidSounds )

        -- Go to the main menu screen after the given time.
        timer.performWithDelay ( 3000, gotoMainMenu)   

        Runtime:addEventListener("enterFrame", FadeLogo)
        Runtime:addEventListener("enterFrame", scale)       
    end

end --function scene:show( event )


-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------
    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  
    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
        
        -- stop the metroid sounds channel for this screen
        audio.stop(metroidSoundsChannel)
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