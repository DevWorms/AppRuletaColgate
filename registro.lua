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

    local labelTitulo = display.newText(RegistroScreen, "REGISTRO", 0, 0, font, 25)
    labelTitulo:setTextColor(180, 180, 180)
    labelTitulo.anchorX=1
    labelTitulo.anchorX=0
    labelTitulo.x = _W/2 - (labelTitulo.width /2)
    labelTitulo.y = 50
    RegistroScreen:insert(labelTitulo)

    local labelNombre = display.newText(RegistroScreen, "Nombre", 0, 0, font, 25)
    labelNombre:setTextColor(180, 180, 180)
    labelNombre.anchorX=1
    labelNombre.anchorX=0
    labelNombre.x = _W/2 - (labelNombre.width /2)
    labelNombre.y = (_H/8)-50
    RegistroScreen:insert(labelNombre)

    local frmNombre = native.newTextField(0, 0, _W /2, 40)
    frmNombre.inputType = "default"
    frmNombre.font = native.newFont(font, 18)
    frmNombre.isEditable = true
    frmNombre.align = "center"
    frmNombre.anchorX=1
    frmNombre.anchorX=0
    frmNombre.x = _W * 0.5 - (frmNombre.width/2)
    frmNombre.y = (_H/8)
    frmNombre.text = ''
    RegistroScreen:insert(frmNombre)

    local labelApellido = display.newText(RegistroScreen, "Apellido", 0, 0, font, 25)
    labelApellido:setTextColor(180, 180, 180)
    labelApellido.anchorX=1
    labelApellido.anchorX=0
    labelApellido.x = _W/2 - (labelApellido.width /2)
    labelApellido.y = (_H/8)*2-50
    RegistroScreen:insert(labelApellido)

    local frmApellido = native.newTextField(0, 0, _W /2, 40)
    frmApellido.inputType = "default"
    frmApellido.font = native.newFont(font, 18)
    frmApellido.isEditable = true
    frmApellido.align = "center"
    frmApellido.anchorX=1
    frmApellido.anchorX=0
    frmApellido.x = _W * 0.5 - (frmApellido.width/2)
    frmApellido.y = (_H/8)*2
    frmApellido.text = ''
    RegistroScreen:insert(frmApellido)

    local labelCorreo = display.newText(RegistroScreen, "Email", 0, 0, font, 25)
    labelCorreo:setTextColor(180, 180, 180)
    labelCorreo.anchorX=1
    labelCorreo.anchorX=0
    labelCorreo.x = _W/2 - (labelCorreo.width /2)
    labelCorreo.y = (_H/8)*4-50
    RegistroScreen:insert(labelCorreo)

    local frmCorreo = native.newTextField(0, 0, _W /2, 40)
    frmCorreo.inputType = "default"
    frmCorreo.font = native.newFont(font, 18)
    frmCorreo.isEditable = true
    frmCorreo.align = "center"
    frmCorreo.anchorX=1
    frmCorreo.anchorX=0
    frmCorreo.x = _W * 0.5 - (frmCorreo.width/2)
    frmCorreo.y = (_H/8)*4
    frmCorreo.text = ''
    RegistroScreen:insert(frmCorreo)

    local labelContrasena = display.newText(RegistroScreen, "Contraseña", 0, 0, font, 25)
    labelContrasena:setTextColor(180, 180, 180)
    labelContrasena.anchorX=1
    labelContrasena.anchorX=0
    labelContrasena.x = _W/2 - (labelContrasena.width /2)
    labelContrasena.y = (_H/8)*5-50
    RegistroScreen:insert(labelContrasena)

    local frmContrasena = native.newTextField(0, 0, _W /2, 40)
    frmContrasena.inputType = "default"
    frmContrasena.font = native.newFont(font, 18)
    frmContrasena.isEditable = true
    frmContrasena.align = "center"
    frmContrasena.anchorX=1
    frmContrasena.anchorX=0
    frmContrasena.x = _W * 0.5 - (frmContrasena.width/2)
    frmContrasena.y = (_H/8)*5
    frmContrasena.text = ''
    RegistroScreen:insert(frmContrasena)

    local labelContrasenaN = display.newText(RegistroScreen, "Confirma Contraseña", 0, 0, font, 25)
    labelContrasenaN:setTextColor(180, 180, 180)
    labelContrasenaN.anchorX=1
    labelContrasenaN.anchorX=0
    labelContrasenaN.x = _W/2 - (labelContrasenaN.width /2)
    labelContrasenaN.y = (_H/8)*6-50
    RegistroScreen:insert(labelContrasenaN)

    local frmContrasenaN = native.newTextField(0, 0, _W /2, 40)
    frmContrasenaN.inputType = "default"
    frmContrasenaN.font = native.newFont(font, 18)
    frmContrasenaN.isEditable = true
    frmContrasenaN.align = "center"
    frmContrasenaN.anchorX=1
    frmContrasenaN.anchorX=0
    frmContrasenaN.x = _W * 0.5 - (frmContrasenaN.width/2)
    frmContrasenaN.y = (_H/8)*6
    frmContrasenaN.text = ''
    RegistroScreen:insert(frmContrasenaN)

local btnPresslog = function( event )
     print("press")
  
    local currScene = composer.getSceneName( "current" )

    composer.removeScene( currScene )
 if ( "ended" == event.phase ) then

        frmNombre:removeSelf()
        frmApellido:removeSelf()
        frmCorreo:removeSelf()
        frmContrasena:removeSelf()
        frmContrasenaN:removeSelf()
        
       
    end

end

    local btnLogin = widget.newButton({
        id = "registrar button",
        label = "REGISTRAR",
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
    btnLogin.y = (_H/8)*7
-- add button to login screen
RegistroScreen:insert(btnLogin)
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