
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local function gotoDNA ()
	composer.gotoScene( "dna" )
end

local function gotoFace ()
	composer.gotoScene( "face" )
end

local function gotoVoice ()
	composer.gotoScene( "voice" )
end

local function gotoPScaner ()
	composer.gotoScene( "pscaner" )
end

local function gotoCReader ()
	composer.gotoScene( "creader" )
end

local function gotoKeyPads ()
	composer.gotoScene( "keypads" )
end


local function tbox (Text, Y, gotoFunction, T)
	--local sceneGroup = self.view
	print( Text)
	local box = display.newText(sceneGroup, Text, display.contentCenterX, Y, display.contentWidth, 0, native.systemFont, 18)
	box:setFillColor(0.80,0.80,1)
	box:addEventListener("tap", gotoFunction)
	
	local around = display.newRoundedRect (sceneGroup,0, Y,box.width,box.height,5)
	if(T == 'Good') then
	around:setFillColor(0,0.3,0)
	elseif (T== 'Bad') then
	around:setFillColor(0.3,0,0)
	else
	around:setFillColor(0,0,0.3)
	end
	around:toBack();
	return Y+35
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
	local textBox = display.newText (sceneGroup, "What kind of Lock is it?", display.contentCenterX, 40,display.contentWidth, 0,  native.systemFont, 20)
	textBox:setFillColor(0.82,0.86,1)
	
	Y = 85;
	
	Y = tbox("DNA Scaner", Y, gotoDNA)
	Y = tbox("Face recognition", Y, gotoFace)
	Y = tbox("Voice recognition", Y, gotoVoice)
	Y = tbox("Print Scaners", Y, gotoPScaner)
	Y = tbox("KeyPads", Y, gotoKeyPads)
	Y = tbox("CardReader", Y, gotoCReader)
	--Y = tbox("Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas sit amet dapibus nulla. Suspendisse ut risus nulla. Maecenas varius elit non faucibus fermentum. Fusce rhoncus, nisl et varius tristique, enim felis egestas purus, et feugiat lorem urna a augue. Maecenas non pulvinar tortor. Aenean condimentum nibh id eros fringilla viverra. Fusce condimentum urna ut volutpat porttitor. Nunc tincidunt congue ligula.", Y, gotoCReader)
	-- Y = tbox("DNA Scaner", Y, gotoDNA)
	
	-- local dnabox = display.newText(sceneGroup, "DNA Scaner", display.contentCenterX,65,native.systemFont, 18)
	-- dnabox:setFillColor(0.80,0.80,1)
	-- dnabox:addEventListener("tap", gotoDNA)
	
	-- local facebox = display.newText(sceneGroup, "Face recognition", display.contentCenterX,85,native.systemFont, 18)
	-- facebox:setFillColor(0.80,0.80,1)
	-- facebox:addEventListener("tap", gotoFace)
	
	-- local printbox = display.newText(sceneGroup, "Print Scaners", display.contentCenterX,105,native.systemFont, 18)
	-- printbox:setFillColor(0.80,0.80,1)
	-- printbox:addEventListener("tap", gotoPScaner)	
	
	-- local kpbox = display.newText(sceneGroup, "KeyPads", display.contentCenterX,125,native.systemFont, 18)
	-- kpbox:setFillColor(0.80,0.80,1)
	-- kpbox:addEventListener("tap", gotoPScaner)	
	
	-- local cardbox = display.newText(sceneGroup, "CardReader", display.contentCenterX,145,native.systemFont, 18)
	-- cardbox:setFillColor(0.80,0.80,1)
	-- cardbox:addEventListener("tap", gotoPScaner)
	
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
