
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local function gotoYes ()
	composer.gotoScene( "yes1" )
end

local function gotoR4it ()
	system.openURL ("https://www.twitch.tv/roll4it")
end
local function gotoReddit ()
	system.openURL ("https://www.reddit.com/r/Shadowrun/comments/2cj3e9/so_you_want_to_break_a_maglock_4e_and_5e_flow/")
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
	local textBox = display.newText (sceneGroup, "So You Want To Break a Maglock", display.contentCenterX, display.contentCenterY, native.systemFont, 20)
	textBox:setFillColor(0.82,0.86,1)
	textBox:addEventListener("tap", gotoYes)
	
	local r4it_logo = display.newImageRect ( sceneGroup,"Roll4it_logo.png",64,64 )
	--r4it_logo:translate(sceneGroup,display.contentCenterX, display.contentCenterY/2)
	r4it_logo.x = display.contentCenterX
	r4it_logo.y = display.contentCenterY/2;
	r4it_logo.alpha = 0.35
	
	local r4it = display.newText(sceneGroup, "Inspired by Roll4it",display.contentCenterX, display.contentCenterY/2, native.systemFont, 16)
	r4it:setFillColor(0,1,1)
	r4it_logo:addEventListener("tap",gotoR4it)
	
	local circle = display.newCircle(sceneGroup, display.contentCenterX, display.contentCenterY+64+20,64)
	
	circle:setFillColor(0,1,0)
	circle:addEventListener("tap",gotoYes)
	
	local circle_text = display.newText(sceneGroup, "YES", display.contentCenterX, display.contentCenterY+64+20, native.systemFont,50)
	
	local credits = display.newText(sceneGroup, "Based on Flowchart by /u/Phaye",display.contentCenterX, display.contentHeight-16, native.systemFont,16)
	credits:setFillColor(1,0,1)
	credits:addEventListener ("tap",gotoReddit)
end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
