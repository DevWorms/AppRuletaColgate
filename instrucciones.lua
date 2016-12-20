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
	

    local labelRespuesta = display.newText(group, "INSTRUCCIONES", (centerX),(_H/6)*2, font, 50)
    labelRespuesta:setTextColor(255,0,0)
    group:insert(labelRespuesta)

    local labelTexto = display.newText(group, "\n\nContesta correctamente las preguntas \nque tenemos preparadas para ti. \n\nCada pregunta te sumará un punto. \n\nLlega a 50 puntos, compártelo en \nredes sociales y gana premios.", (centerX) + 20,(_H/6)*2.8, font, 30)
    labelTexto:setTextColor(0, 0, 0) 
    group:insert(labelTexto)


    local btnPresslog = function( event )
	  composer.gotoScene( "ruletaColgate", "crossFade", 500 )  

	end
	

	local btnConti = widget.newButton({
        width = 200,
        height = 200,
        defaultFile = "Image/btnConti.png",
        overFile = "Image/btnConti.png",
        onPress = btnPresslog     
        })
    btnConti.x = display.contentCenterX 
    btnConti.y = (_H/6)*5

    group:insert( btnConti )

	


	
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