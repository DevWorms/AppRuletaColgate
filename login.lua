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
    background:setFillColor( 0.5 )
    background:setStrokeColor( 1, 0, 0 )
    local loginScreen = display.newGroup()
    loginScreen:insert(background)
    local labelUsername = display.newText(loginScreen, "Email", 0, 0, font, 20)

labelUsername:setTextColor(180, 180, 180)
labelUsername.anchorX=1
labelUsername.anchorX=0
labelUsername.x = _W * 0.5 - 140
labelUsername.y = (_H/2)-220
loginScreen:insert(labelUsername)

local labelPassword = display.newText(loginScreen, "Contraseña", 0, 0, font, 20)

labelPassword.anchorX=1
labelPassword.anchorX=0
labelPassword:setTextColor(180, 180, 180)
labelPassword.x = _W * 0.5 - 140

labelPassword.y = (_H/2)-145
loginScreen:insert(labelPassword)

local labelReturnStatus = display.newText(loginScreen, "", 0, 0, font, 18)

labelReturnStatus.anchorX=1
labelReturnStatus.anchorX=0
labelReturnStatus.x = _W * 0.5 - 140
labelReturnStatus.y = (_H/2)-40
loginScreen:insert(labelReturnStatus)

local frmUsername = native.newTextField(0, 0, _W/2, 40)
    frmUsername.inputType = "default"
    frmUsername.font = native.newFont(font, 18)
  
    frmUsername.isEditable = true
    frmUsername.align = "center"
    
    frmUsername.anchorX=1
    frmUsername.anchorX=0

    frmUsername.x = _W * 0.5 - 140
    frmUsername.y = (_H/2)-180
    frmUsername.text = ''

-- add login form field to login screen
loginScreen:insert(frmUsername)

-- handle field events
function frmUsername:userInput(event)
    if(event.phase == "began") then
        -- you could implement tweening of object to get out of the way of the keyboard here
        print("Began frmUsername" .. ' ' .. event.target.text)
        event.target.text = ''
    elseif(event.phase == "editing") then
        -- fired with each new character
        print("Editing frmUsername" .. ' ' .. event.target.text)
    elseif(event.phase == "ended") then
        -- fired when the field looses focus as a result of some other object being interacted with
        print("Ended frmUsername" .. ' ' .. event.target.text)
    elseif(event.phase == "submitted") then
        -- you could implement tweening of objects to their original postion here
        print("Submitted frmUsername" .. ' ' .. event.target.text)        
    end
end
frmUsername:addEventListener("userInput",frmUsername)

-- ----------------------------------------------------------------------------
-- CREATE PASSWORD TEXT FIELD - ADD TO LOGIN FORM
-- ----------------------------------------------------------------------------
local frmPassword = native.newTextField(0, 0, _W /2, 40)
    frmPassword.inputType = "default"
    frmPassword.font = native.newFont(font, 18)

    frmPassword.isEditable = true
    frmPassword.isSecure = true
    frmPassword.align = "center"
    frmPassword.anchorX=1
    frmPassword.anchorX=0
    frmPassword.x = _W * 0.5 - 140
    frmPassword.y = (_H/2)-100
    frmPassword.text = ''

-- add login form field to login screen
loginScreen:insert(frmPassword)

-- handle field events
function frmPassword:userInput(event)
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
frmPassword:addEventListener("userInput",frmPassword)
local btnPresslog = function( event )
    local userid = frmUsername.text
    local password = frmPassword.text 

    print(userid)
    print(password)
    
    -- stop if fields are blank
    if(userid == '' or password == '') then
        labelReturnStatus.text = 'A username or password is required.'
        return
    else
       

    end   

end
local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        composer.gotoScene( "registro", "crossFade", 100 )
    end
end
local function onRelease(event)    
    
end
-- handle onDrag
local function btnOnDragHandler(event)
    -- do something
end

-- handle onRelease
local function btnOnReleaseHandler(event)
    -- do something
end

-- create button
local btnLogin = widget.newButton({
        id = "Login Button",
        label = "Comenzar a jugar",
        emboss = false,
        -- Properties for a rounded rectangle button
        shape = "roundedRect",
        width = 200,
        height = 40,
        cornerRadius = 2,
        fillColor = { default={1,1,1,1}, over={1,0.1,0.7,0.4} },
        strokeColor = { default={2,1,4,1}, over={0.8,0.8,1,1} },
        strokeWidth = 4,
        onPress = btnPresslog     
        })
    btnLogin.x = display.contentCenterX
    btnLogin.y = display.contentCenterY
-- add button to login screen
loginScreen:insert(btnLogin)

local btnRegistro = widget.newButton({
        id = "Login Registro",
        label = "Si aun no estas registrado, registrate AQUI",
        onEvent = handleButtonEvent,
        emboss = false,
        -- Properties for a rounded rectangle button
        onEvent = handleButtonEvent

        })
    btnRegistro.x = display.contentCenterX
    btnRegistro.y = display.contentCenterY+100
-- add button to login screen
loginScreen:insert(btnRegistro)
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