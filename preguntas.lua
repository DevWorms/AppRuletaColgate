local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local myData = require( "mydata" )
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------


  local centerX= _W/2
  local centerY= _H/2
   local labelNombre
   local arrayrespuesta= {}
   local labelPreguntas
   local btnPrimera
   local contrespuesta=1
   local contcorrect=1
   local respuesta1
   local respuesta2
   local respuesta3
   local correcta1
   local correcta2
   local correcta3
-- Touch event listener for background image



-- Called when the scene's view does not exist:
function scene:create( event )

    --  WEB SERVICE PARA LANZAR LA PREGUNTA ALEATORIA

        local json = require( "json" )
        local function handleResponse( event )
            if not event.isError then
                local response = json.encode( event.response ,{ indent = true })
                local decoded = json.decode( event.response )
                 --arrayrespuesta = decoded
               for k,v in pairs (decoded) do
                    print (k,v)
                   if k== "question" then
                      labelPreguntas.text=v
                   end 
                   if k == "answer_set" then

                    local parte1= json.encode( v )
                    print("extraer answer_set : " .. parte1)
                    local partes= json.decode( parte1)
                                           
                      for i,j in pairs (partes) do
                          print(i,j)
                          for n,m in pairs (j) do
                            print(n,m)
                           
                            
                            if n=="answer" then
                              if contrespuesta==1 then
                                respuesta1=m
                                contrespuesta=2
                                print("entro resp1")
                              elseif contrespuesta==2 then
                                respuesta2=m
                                contrespuesta=3
                                print("entro resp2")
                              elseif contrespuesta==3 then
                                respuesta3=m
                                contrespuesta=1
                                print("entro resp3")
                              end
                            end
                          end
                          
                      end
                  end
                  
               end
                
               -- print( "event.response: ".. arrayrespuesta[1] )
                --print( "event.response: ".. decoded.answer_set[0] )
            else
                print( "Error" )
            end
            return
        end


        local headers = {}
        headers["authorization"] = "bearer " .. myData.token

        local params = {}
        params.headers = headers


	local group = self.view
	
	local background = display.newRect(0, 0, _W, _H)
      background.x = display.contentWidth / 2
      background.y = display.contentHeight / 2
      background:setFillColor( .24)
      group:insert(background)
      
    local lineaRoja= display.newImage(group,"Image/lineaR.png")
    lineaRoja:translate( centerX,centerY/15 )
    group:insert(lineaRoja)
    labelNombre = display.newText(group, myData.nombre, centerX, centerY/15, font, 30)
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

	local labelCategoria = display.newText(group, "Categoria " .. myData.categoria, (centerX/6)*2, (centerY/6)*2 , font, 35)
    labelCategoria:setTextColor(255, 255, 255)
    group:insert(labelCategoria)

    labelPreguntas = display.newText(group, "", (centerX), (centerY/6)*3 , font, 30)
    labelPreguntas:setTextColor(255, 255, 255)
    group:insert(labelPreguntas)

	local btnPresslog1 = function( event )
		print("1:"..respuesta1)
	  composer.gotoScene( "preguntaCorrecta", "slideLeft", 500 )  

	end

  local btnPresslog2 = function( event )
    print("2:"..respuesta2)
    composer.gotoScene( "preguntaCorrecta", "slideLeft", 500 )  

  end
  local btnPresslog3 = function( event )
    print("3:"..respuesta3)
    composer.gotoScene( "preguntaCorrecta", "slideLeft", 500 )  

  end
   url = "https://colgate.herokuapp.com/api/v1/categories/" .. myData.categoria .. "/random_question/" 

        network.request( url, "GET", handleResponse, params )

   timer.performWithDelay( 500, function() print("respuesta1: "..respuesta1) print("respuesta2: "..respuesta2) print("respuesta3: "..respuesta3) btnPrimera = widget.newButton({
        id = "Primera",
        label = respuesta1,
        emboss = false,
        defaultFile = "Image/espacio_texto.png",
        overFile = "Image/espacio_texto.png",
        fontSize=30,
        labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } },
        onPress = btnPresslog1     
        })
    btnPrimera.x = display.contentCenterX
    btnPrimera.y = (_H/8)*3
    
    group:insert(btnPrimera)

    local btnSegunda = widget.newButton({
        id = "Segundo",
        label = respuesta2,
        emboss = false,
        defaultFile = "Image/espacio_texto.png",
        overFile = "Image/espacio_texto.png",
        fontSize=30,
        labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } },
       
        onPress = btnPresslog2     
        })
    btnSegunda.x = display.contentCenterX
    btnSegunda.y = (_H/8)*4 
    group:insert(btnSegunda)

    local btnTercera = widget.newButton({
    id = respuesta3,
    label = respuesta3,
    emboss = false,
    defaultFile = "Image/espacio_texto.png",
    overFile = "Image/espacio_texto.png",
  fontSize=30,
    labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } },
   
    onPress = btnPresslog3     
    })
    btnTercera.x = display.contentCenterX
    btnTercera.y = (_H/8)*5
    group:insert(btnTercera) end )
     

    local imageDiente=  display.newImage(group,"Image/diente.png")
    imageDiente:translate( centerX, centerY+((centerY/5)*3.7) )
	imageDiente:scale( .4, .4 )
	group:insert(imageDiente)

  

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