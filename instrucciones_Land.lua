local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local myData = require( "mydata" )
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

local image, text1, text2, text3, memTimer
  local centerX= _W/2
  local centerY= _H/2
-- Touch event listener for background image



-- Called when the scene's view does not exist:
function scene:create( event )
	local group = self.view
	
	local background = display.newRect(0, 0, _W, _H)
    background.x = display.contentWidth / 2
    background.y = display.contentHeight / 2
    background:setFillColor( .93)
	group:insert( background )
	

    local labelRespuesta = display.newText(group, "INSTRUCCIONES", _W - 100,centerY, font, 50)
    labelRespuesta:setTextColor(255,0,0) 
    group:insert(labelRespuesta)
    labelRespuesta.rotation = 90

    local labelTexto = display.newText(group, "\n\nContesta correctamente las preguntas \nque tenemos preparadas para ti. \n\nCada pregunta te sumará un punto. \n\nLlega a 50 puntos, compártelo en \nredes sociales y gana premios.", centerX + 50,(_H/6)*3, font, 30)
    labelTexto:setTextColor(128, 128, 128) 
    group:insert(labelTexto)
    labelTexto.rotation = 90


    local btnPresslog = function( event )
	  composer.gotoScene( "ruletaColgate_Land", "crossFade", 500 )  

	end
	

	local btnConti = widget.newButton({
        width = 200,
        height = 200,
        defaultFile = "Image/btnConti.png",
        overFile = "Image/btnConti.png",
        onPress = btnPresslog     
        })
    btnConti.x = 150
    btnConti.y = centerY

    group:insert( btnConti )
    btnConti.rotation = 90

	


	
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