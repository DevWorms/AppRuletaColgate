local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local myData = require( "mydata" )
local facebook = require( "plugin.facebook.v4" )
local twitter = require("plugin.twitter")

twitter.init("wECpX20X4EMfY59UPW8tyiTwQ", "n6DlH2OXzWRLWQ8JXNW5TOzDwDZTmwcGxq5xdeCagOldjjbxjY")
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

    local lineaRoja= display.newImage(group,"Image/lineaR.png")
    lineaRoja:translate( centerX,centerY/15 )
    group:insert(lineaRoja)
    local labelNombre = display.newText(group, "Hola " .. myData.nombre, centerX, centerY/15, font, 30)
    labelNombre:setTextColor(255, 255, 255)
    group:insert(labelNombre)


    
    local lineaNegra= display.newImage(group,"Image/lineaN.png")
    lineaNegra:translate( centerX, centerY/6)
    lineaNegra:scale(1,.6)
    group:insert(lineaNegra)

    local moneda= display.newImage(group,"Image/moneda.png")
    moneda:translate( centerX/6, centerY/6)
    moneda:scale(.5,.5)
    group:insert(moneda)

    local labelmoneda = display.newText(group, myData.puntos, (centerX/6)*1.8, centerY/6, font, 22)
    labelmoneda:setTextColor(255, 255, 255)
    group:insert(labelNombre)
    
    
    if myData.corazones == 3 then
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

    elseif myData.corazones == 2 then

      local corazon2= display.newImage(group,"Image/corazon.png")
      corazon2:translate( (_W/6)*5, centerY/6)
      corazon2:scale(.5,.5)
      group:insert(corazon2)

      local corazon3= display.newImage(group,"Image/corazon.png")
      corazon3:translate( (_W/6)*5.5, centerY/6)
      corazon3:scale(.5,.5)
      group:insert(corazon3)

    elseif myData.corazones == 1 then

      local corazon3= display.newImage(group,"Image/corazon.png")
      corazon3:translate( (_W/6)*5.5, centerY/6)
      corazon3:scale(.5,.5)
      group:insert(corazon3)


    end


	local imageDiente= display.newImage("Image/dienteBien.png")
	imageDiente.x= display.contentWidth / 2
	imageDiente.y=(_H/6)*1.5
	imageDiente:scale( .5, 0.5 )
	group:insert( imageDiente )

	local labelRespuesta = display.newText(group, "Has llegado a 50 puntos", (centerX),(_H/6)*2.8, font, 30)
    labelRespuesta:setTextColor(236, 124, 38) 
    group:insert(labelRespuesta)

    local labelRespuesta = display.newText(group, "!Felicidades¡", (centerX),(_H/6)*2.2, font, 40)
    labelRespuesta:setTextColor(236, 124, 38) 
    group:insert(labelRespuesta)

	

	local btnFace = function( event )
      --composer.gotoScene( "puntosPregunta", "crossFade", 10 )  
      facebook.request( "me/feed", "POST", { message="Hello Facebook" } )
    end
    local btnTwi = function( event )
      --composer.gotoScene( "puntosPregunta", "crossFade", 10 )  
        local function tweetCallback(response)
            print("TWEET TEXT: " .. response.text)
            print("TWEET ID: " .. response.id)
        end

        twitter.tweet("I love the Twitter plugin for #CoronaSDK!", "image/diente.png", tweetCallback)
    end

    local btnFace = widget.newButton({
    width = 400,
    height = 100,
    defaultFile = "Image/btnFace.png",
    overFile = "Image/btnFace.png",
    onPress = btnFace   
    })
    btnFace.x = display.contentCenterX 
    btnFace.y = (_H/6)*3.5
    group:insert( btnFace )

    local btnTwi = widget.newButton({
    width = 400,
    height = 100,
    defaultFile = "Image/btnTwi.png",
    overFile = "Image/btnTwi.png",
    onPress = btnTwi     
    })
    btnTwi.x = display.contentCenterX 
    btnTwi.y = (_H/6)*4
    group:insert( btnTwi )

	local btnPresslog = function( event )
	  composer.gotoScene( "ruletaColgate", "fade", 500 )  

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