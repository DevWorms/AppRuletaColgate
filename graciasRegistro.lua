local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

local image, text1, text2, text3, memTimer

-- Touch event listener for background image



-- Called when the scene's view does not exist:
function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newRect(0, 0, _W, _H)
    background.x = display.contentWidth / 2
    background.y = display.contentHeight / 2
    background:setFillColor( 0 )
    background:setStrokeColor( 255, 255, 255 )
    
	
	sceneGroup:insert( background )

	local imageDiente= display.newImage("Image/diente.png")
	imageDiente.x= display.contentWidth / 2
	imageDiente.y=display.contentWidth/4
	imageDiente:scale( .5, 0.5 )
	sceneGroup:insert( imageDiente )
	local btnPresslog = function( event )
	  composer.gotoScene( "ruletaColgate", "crossFade", 10 )  

	end
	local btnLogin = widget.newButton({
        width = 200,
        height = 200,
        defaultFile = "Image/btnComenzar.png",
        overFile = "Image/btnComenzar.png",
        onPress = btnPresslog     
        })
    btnLogin.x = display.contentCenterX 
    btnLogin.y = display.contentCenterY + 100

    sceneGroup:insert( btnLogin )

	local imageLogo= display.newImage("Image/logoColgate.png")
	imageLogo.x=display.contentCenterX
	imageLogo.y=_H -100
	imageLogo:scale( .5, 0.5 )
	sceneGroup:insert( imageLogo )


	
end

function scene:show( event )
	
	
	
end

function scene:hide( event )
	
	
	
end

function scene:destroy( event )
	print( "((destroying scene 1's view))" )
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene