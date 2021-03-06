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
	
	-- DECLARAR VARIABLES
  local background = display.newRect(0, 0, _W, _H)
        background.x = display.contentWidth / 2
        background.y = display.contentHeight / 2
        background:setFillColor( .93)
        group:insert(background)
      
  local lineaRoja = display.newImage(group,"Image/lineaR.png")
        lineaRoja:translate( _W - 33, centerY )
        group:insert(lineaRoja)
        lineaRoja.rotation = 90

  local labelNombre = display.newText(group, myData.nombre, _W - 33, centerY , font, 30)
        labelNombre:setTextColor(255, 255, 255)
        group:insert(labelNombre)
        labelNombre.rotation = 90
    
  local lineaNegra = display.newImage(group,"Image/lineaN.png")
        lineaNegra:translate( _W - 33, centerY )
        lineaNegra:scale(1,.6)
        group:insert(lineaNegra)
        lineaNegra.rotation = 90

  local moneda = display.newImage(group,"Image/moneda.png")
        moneda:translate( _W - 33, centerY/6)
        moneda:scale(.5,.5)
        group:insert(moneda)
        moneda.rotation = 90

  local labelmoneda = display.newText(group, myData.puntos, _W - 33, centerY/6 + 50, font, 22)
        labelmoneda:setTextColor(255, 255, 255)
        group:insert(labelNombre)
        labelmoneda.rotation = 90
    

  -- MOSTRAR CORAZONES   

    if myData.corazones == 3 then
      local corazon1= display.newImage(group,"Image/corazon.png")
      corazon1:translate( _W - 33, _H - 60)
      corazon1:scale(.5,.5)
      group:insert(corazon1)
      corazon1.rotation = 90

      local corazon2= display.newImage(group,"Image/corazon.png")
      corazon2:translate( _W - 33, _H - 120)
      corazon2:scale(.5,.5)
      group:insert(corazon2)
      corazon2.rotation = 90

      local corazon3= display.newImage(group,"Image/corazon.png")
      corazon3:translate( _W - 33, _H - 180)
      corazon3:scale(.5,.5)
      group:insert(corazon3)
      corazon3.rotation = 90

    elseif myData.corazones == 2 then

      local corazon2= display.newImage(group,"Image/corazon.png")
      corazon2:translate( _W - 33, _H - 120)
      corazon2:scale(.5,.5)
      group:insert(corazon2)
      corazon2.rotation = 90

      local corazon3= display.newImage(group,"Image/corazon.png")
      corazon3:translate( _W - 33, _H - 180)
      corazon3:scale(.5,.5)
      group:insert(corazon3)
      corazon3.rotation = 90

    elseif myData.corazones == 1 then

      local corazon3= display.newImage(group,"Image/corazon.png")
      corazon3:translate( _W - 33, _H - 180)
      corazon3:scale(.5,.5)
      group:insert(corazon3)
      corazon3.rotation = 90

    end


	local imageDiente= display.newImage("Image/dienteMal.png")
    imageDiente:translate( 150, centerY+((centerY/5)*3.7) )
  imageDiente:scale( .4, 0.4 )
  group:insert(imageDiente)
  imageDiente.rotation = 90

    local labelRespuesta = display.newText(group, "Fallaste", _W - 150,centerY, font, 40)
    labelRespuesta:setTextColor(0, 0, 0) 
    group:insert(labelRespuesta)
    labelRespuesta.rotation = 90

    local labelTexto = display.newText(group, myData.tip, (centerX),(_H/6)*2.8,(centerX)*1.5, 150, font, 30 )
    labelTexto:setTextColor(0, 0, 0) 
    group:insert(labelTexto)
    labelTexto.rotation = 90


    local btnPresslog = function( event )

    if myData.corazones == 0 then
      composer.gotoScene( "no_vidas_Land", "slideRight", 500 )
    else
	     composer.gotoScene( "ruletaColgate_Land", "slideRight", 500 )  
    end
	end
	

	local btnLogin = widget.newButton({
        width = 200,
        height = 200,
        defaultFile = "Image/btnConti.png",
        overFile = "Image/btnConti.png",
        onPress = btnPresslog     
        })
    btnLogin.x = 150
    btnLogin.y = centerY

    group:insert( btnLogin )
    btnLogin.rotation = 90
    btnLogin:scale(.9,.8)
	


	
end

function scene:show( event )
	
	
	
end

function scene:hide( event )
	
	 composer.removeScene( composer.getSceneName( "current" ) )
	
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