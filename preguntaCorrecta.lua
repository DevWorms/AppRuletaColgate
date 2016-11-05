local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
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
    background:setFillColor( .24)
	group:insert( background )

	local labelNombre = display.newText(group, "Hola Luna", (centerX/6)*2, centerY/13, font, 30)
    labelNombre:setTextColor(255, 255, 255)
    group:insert(labelNombre)

    local moneda= display.newImage(group,"Image/moneda.png")
    moneda:translate( centerX/6, centerY/6)
    moneda:scale(.5,.5)
	group:insert(moneda)

    local labelmoneda = display.newText(group, "$0", (centerX/6)*1.8, centerY/6, font, 22)
    labelmoneda:setTextColor(255, 255, 255)
    group:insert(labelmoneda)

    local corazon1= display.newImage(group,"Image/corazon.png")

    corazon1:translate( (_W/6)*4.5, centerY/6)
    corazon1:scale(.5,.5)
    group:insert(corazon1)

    local corazon2= display.newImage(group,"Image/corazon.png")

    corazon2:translate( (_W/6)*5, centerY/6)
    corazon2:scale(.5,.5)
    group:insert(corazon2)

    local corazon3= display.newImage(group,"Image/corazon.png")

    corazon3:translate( (_W/6)*5.5, centerY/6)
    corazon3:scale(.5,.5)
    group:insert(corazon3)


	local imageDiente= display.newImage("Image/dienteBien.png")
	imageDiente.x= display.contentWidth / 2
	imageDiente.y=(_H/6)*1.5
	imageDiente:scale( .5, 0.5 )
	group:insert( imageDiente )

    local labelRespuesta = display.newText(group, "Muy Bien", (centerX),(_H/6)*2.2, font, 40)
    labelRespuesta:setTextColor(236, 124, 38) 
    group:insert(labelRespuesta)

    local labelTexto = display.newText(group, "Recuerda que el exceso \nde dulces y golosinas contribuye \na la formación de caries", (centerX),(_H/6)*2.8, font, 30)
    labelTexto:setTextColor(255, 255, 255) 
    group:insert(labelTexto)

	local imagePaleta= display.newImage("Image/paleta.png")
	imagePaleta.x= display.contentWidth / 2
	imagePaleta.y= (_H/6)*3.8
	imagePaleta:scale( 2, 2 )
	group:insert( imagePaleta )


    local btnPresslog = function( event )
	  composer.gotoScene( "puntosPregunta", "crossFade", 10 )  

	end
	

	local btnLogin = widget.newButton({
        width = 200,
        height = 200,
        defaultFile = "Image/btnConti.png",
        overFile = "Image/btnConti.png",
        onPress = btnPresslog     
        })
    btnLogin.x = display.contentCenterX 
    btnLogin.y = (_H/6)*5

    group:insert( btnLogin )

	


	
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