
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local function gotoMain ()
	composer.gotoScene( "intro" )
end


local function gotoOpening()
	composer.gotoScene ("opening")
end
local function gotoSequencer()
	composer.gotoScene ("sequencer")
end

local function blank ()
end

local function tbox (Text, Y, gotoFunction, T)
	--local sceneGroup = self.view
	print( Text)
	local box = display.newText(sceneGroup, Text, display.contentCenterX, Y, display.contentWidth, 0, native.systemFont, 18)
	box:setFillColor(0.80,0.80,1)
	box:addEventListener("tap", gotoFunction)
	
	if(T ~= 'None') then
	local around = display.newRoundedRect (sceneGroup,0, Y,box.width,box.height,5)
	if(T == 'Good') then
	around:setFillColor(0,0.3,0)
	elseif (T== 'Bad') then
	around:setFillColor(0.3,0,0)
	else
	around:setFillColor(0,0,0.3)
	end
	around:toBack();
	end
	return Y+35
end
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
	local textBox = display.newText (sceneGroup, "Is it a Key pad?", display.contentCenterX, 40,display.contentWidth, 0,  native.systemFont, 20)
	textBox:setFillColor(0.82,0.86,1)
	
	Y = 100;
	
	Y = tbox("Yes", Y, gotoSequencer, "Bad")
	Y = tbox("No", Y, gotoOpening, "Good")
	Y = tbox("Start over", Y, gotoMain)
	
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
