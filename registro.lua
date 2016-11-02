local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
----------------------------------------------------------------------------------
-- 
--  NOTE:
--  
--  Code outside of listener functions (below) will only be executed once,
--  unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------
local background = display.newRect(0, 0, _W, _H)
    background.x = display.contentWidth / 2
    background.y = display.contentHeight / 2
    background:setFillColor( 0.2 )
    background:setStrokeColor( 4, 3, 9 )
    local RegistroScreen = display.newGroup()
    RegistroScreen:insert(background)

    local labelUsername = display.newText(RegistroScreen, "REGISTRO", 0, 0, font, 25)

    labelUsername:setTextColor(180, 180, 180)
    labelUsername.anchorX=1
    labelUsername.anchorX=0
    labelUsername.x = _W * 0.5 - 140
    labelUsername.y = 50
    RegistroScreen:insert(labelUsername)

    local frmNombre = native.newTextField(0, 0, _W /2, 40)
    frmNombre.inputType = "default"
    frmNombre.font = native.newFont(font, 18)

    frmNombre.isEditable = true
    frmNombre.isSecure = true
    frmNombre.align = "center"
    frmNombre.anchorX=1
    frmNombre.anchorX=0
    frmNombre.x = _W * 0.5 - 140
    frmNombre.y = (_H/2)
    frmNombre.text = ''

    RegistroScreen:insert(frmNombre)

function frmNombre:userInput(event)
    if(event.phase == "began") then
        -- you could implement tweening of object to get out of the way of the keyboard here
        print("Began Password" .. ' ' .. event.target.text)
        event.target.text = ''
    elseif(event.phase == "editing") then
        -- fired with each new character
        print("Editing Password" .. ' ' .. event.target.text)
    elseif(event.phase == "ended") then
        -- fired when the field looses focus as a result of some other object being interacted with
        print("Ended Password" .. ' ' .. event.target.text)
    elseif(event.phase == "submitted") then
        -- you could implement tweening of objects to their original postion here
        print("Submitted Password" .. ' ' .. event.target.text)        
    end
end
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
    local group = self.view

    -----------------------------------------------------------------------------

    --  CREATE display objects and add them to 'group' here.
    --  Example use-case: Restore 'group' from previously saved state.

    -----------------------------------------------------------------------------

end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    local group = self.view

    print("entered")

    -----------------------------------------------------------------------------

    --  INSERT code here (e.g. start timers, load audio, start listeners, etc.)

    -----------------------------------------------------------------------------

end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
    local group = self.view

    -----------------------------------------------------------------------------

    --  INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)

    -----------------------------------------------------------------------------

end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
    local group = self.view

    -----------------------------------------------------------------------------

    --  INSERT code here (e.g. remove listeners, widgets, save state, etc.)

    -----------------------------------------------------------------------------

end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene