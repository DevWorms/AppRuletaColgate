local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local myData = require( "mydata" )
local socket = require("socket")
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

    local centerX = _W/2
    local centerY = _H/2
    local labelNombre
    local img_verde = "Image/verde.png"
    local img_blanca = "Image/espacio_texto.png"
    local img_roja = "Image/rojo.png"

-- Called when the scene's view does not exist:
function scene:create( event )
  
  local group = self.view

  -- DECLARAR VARIABLES
  local background = display.newRect(0, 0, _W, _H)
        background.x = display.contentWidth / 2
        background.y = display.contentHeight / 2
        background:setFillColor( .24)
        group:insert(background)
      
  local lineaRoja = display.newImage(group,"Image/lineaR.png")
        lineaRoja:translate( centerX,centerY/15 )
        group:insert(lineaRoja)
        labelNombre = display.newText(group, myData.nombre, centerX, centerY/15, font, 30)
        labelNombre:setTextColor(255, 255, 255)
        group:insert(labelNombre)
    
  local lineaNegra = display.newImage(group,"Image/lineaN.png")
        lineaNegra:translate( centerX, centerY/6)
        lineaNegra:scale(1,.6)
        group:insert(lineaNegra)

  local moneda = display.newImage(group,"Image/moneda.png")
        moneda:translate( centerX/6, centerY/6)
        moneda:scale(.5,.5)
        group:insert(moneda)

  local labelmoneda = display.newText(group, myData.puntos, (centerX/6)*1.8, centerY/6, font, 22)
        labelmoneda:setTextColor(255, 255, 255)
        group:insert(labelNombre)
    

  -- MOSTRAR CORAZONES   
  if myData.corazones == 3 then

      local corazon1 = display.newImage(group,"Image/corazon.png")
            corazon1:translate( (_W/6)*4.5, centerY/6)
            corazon1:scale(.5,.5)
            group:insert(corazon1)

      local corazon2 = display.newImage(group,"Image/corazon.png")
            corazon2:translate( (_W/6)*5, centerY/6)
            corazon2:scale(.5,.5)
            group:insert(corazon2)

      local corazon3 = display.newImage(group,"Image/corazon.png")
            corazon3:translate( (_W/6)*5.5, centerY/6)
            corazon3:scale(.5,.5)
            group:insert(corazon3)


    elseif myData.corazones == 2 then

        local corazon2 = display.newImage(group,"Image/corazon.png")
              corazon2:translate( (_W/6)*5, centerY/6)
              corazon2:scale(.5,.5)
              group:insert(corazon2)

        local corazon3 = display.newImage(group,"Image/corazon.png")
              corazon3:translate( (_W/6)*5.5, centerY/6)
              corazon3:scale(.5,.5)
              group:insert(corazon3)


    elseif myData.corazones == 1 then

      local corazon3 = display.newImage(group,"Image/corazon.png")
            corazon3:translate( (_W/6)*5.5, centerY/6)
            corazon3:scale(.5,.5)
            group:insert(corazon3)

  end


  local labelCategoria = display.newText(group, "Categoria " .. myData.nombreCate, (centerX), (centerY/6)*2 , font, 30)
        labelCategoria:setTextColor(255, 255, 255)
        group:insert(labelCategoria)
  
  local labelPreguntas = display.newText(group, "",  (centerX), (centerY/6)*4,(centerX)*1.5, 200, font, 30 )
        labelPreguntas.text = myData.pregunta
        labelPreguntas:setTextColor(255, 255, 255)
        group:insert(labelPreguntas)


  -- SELECCIONAR PRIMER BOTÓN CON COLOR  
  if myData.elegida == 1 then

      local btnPrimera = widget.newButton ({
                                            id = "Primera",
                                            label = myData.respuesta_1,
                                            emboss = false,
                                            defaultFile = img_roja,
                                            overFile = img_roja,
                                            fontSize=20,
                                            labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } }
                                          })
            btnPrimera.x = display.contentCenterX
            btnPrimera.y = (_H/8)*3          
            group:insert(btnPrimera)


    elseif myData.correcta == 1 then

      local btnPrimera = widget.newButton ({
                                          id = "Primera",
                                          label = myData.respuesta_1,
                                          emboss = false,
                                          defaultFile = img_verde,
                                          overFile = img_verde,
                                          fontSize=20,
                                          labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } }
                                        })
          btnPrimera.x = display.contentCenterX
          btnPrimera.y = (_H/8)*3          
          group:insert(btnPrimera)


    else

      local btnPrimera = widget.newButton ({
                                            id = "Primera",
                                            label = myData.respuesta_1,
                                            emboss = false,
                                            defaultFile = img_blanca,
                                            overFile = img_blanca,
                                            fontSize=20,
                                            labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } }
                                          })
            btnPrimera.x = display.contentCenterX
            btnPrimera.y = (_H/8)*3          
            group:insert(btnPrimera)

  end


  -- SELECCIONAR SEGUNDO BOTÓN CON COLOR  
  if myData.elegida == 2 then

      local btnSegunda = widget.newButton ({
                                            id = "Segunda",
                                            label = myData.respuesta_2,
                                            emboss = false,
                                            defaultFile = img_roja,
                                            overFile = img_roja,
                                            fontSize=20,
                                            labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } }
                                          })
            btnSegunda.x = display.contentCenterX
            btnSegunda.y = (_H/8)*4          
            group:insert(btnSegunda)


    elseif myData.correcta == 2 then

      local btnSegunda = widget.newButton ({
                                          id = "Segunda",
                                          label = myData.respuesta_2,
                                          emboss = false,
                                          defaultFile = img_verde,
                                          overFile = img_verde,
                                          fontSize=20,
                                          labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } }
                                        })
          btnSegunda.x = display.contentCenterX
          btnSegunda.y = (_H/8)*4          
          group:insert(btnSegunda)


    else

      local btnSegunda = widget.newButton ({
                                            id = "Segunda",
                                            label = myData.respuesta_2,
                                            emboss = false,
                                            defaultFile = img_blanca,
                                            overFile = img_blanca,
                                            fontSize=20,
                                            labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } }
                                          })
            btnSegunda.x = display.contentCenterX
            btnSegunda.y = (_H/8)*4          
            group:insert(btnSegunda)

  end


    -- SELECCIONAR SEGUNDO BOTÓN CON COLOR  
  if myData.elegida == 3 then

      local btnTercera = widget.newButton ({
                                            id = "Tercera",
                                            label = myData.respuesta_3,
                                            emboss = false,
                                            defaultFile = img_roja,
                                            overFile = img_roja,
                                            fontSize=20,
                                            labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } }
                                          })
            btnTercera.x = display.contentCenterX
            btnTercera.y = (_H/8)*5         
            group:insert(btnTercera)


    elseif myData.correcta == 3 then

      local btnTercera = widget.newButton ({
                                          id = "Tercera",
                                          label = myData.respuesta_3,
                                          emboss = false,
                                          defaultFile = img_verde,
                                          overFile = img_verde,
                                          fontSize=20,
                                          labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } }
                                        })
          btnTercera.x = display.contentCenterX
          btnTercera.y = (_H/8)*5         
          group:insert(btnTercera)


    else

      local btnTercera = widget.newButton ({
                                            id = "Tercera",
                                            label = myData.respuesta_3,
                                            emboss = false,
                                            defaultFile = img_blanca,
                                            overFile = img_blanca,
                                            fontSize=20,
                                            labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0, 0.5 } }
                                          })
            btnTercera.x = display.contentCenterX
            btnTercera.y = (_H/8)*5        
            group:insert(btnTercera)

  end





  local imageDiente = display.newImage(group,"Image/diente.png")
                      imageDiente:translate( centerX, centerY+((centerY/5)*3.7) )
                      imageDiente:scale( .4, .4 )
                      group:insert(imageDiente)


  timer.performWithDelay( 3000, cerrar )

end


function imagen(respuesta)

end


function cerrar()  
  composer.gotoScene( "preguntaIncorrecta", "slideRight", 500 ) 
end


function scene:show( event )
  
  --  CONTENT
  
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