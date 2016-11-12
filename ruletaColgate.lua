local composer = require( "composer" )
local scene = composer.newScene()
local myData = require( "mydata" )
--local introIsPlaying
 
  local centerX= _W/2
  local centerY= _H/2
    local pres=false
    local contadordevueltas=0
    local velocidad=5
    local objeto
    local para=0
    local paravelo=0
    local posanterior=0
    local objetosSalidos={}
    local numeroDeGiros=0
    local ruleta
    local btnJugar
    local bandera=false
    local luzAma
    local luzAzu
    local luzRosa
    local luzMora
    local luzVer
    local luzPrendidaAma
    local luzPrendidaVer
    local luzPrendidaAzu
    local luzPrendidaMora
    local luzPrendidaRosa

    
local function btnTapJugar(event)
    --esto es para quitar el bloqueo 
    
   composer.showOverlay( "bloqueo" ,{ isModal = true } )
   pres=true
    aleatorio=math.random(1, 5) --Escoge el objeto aleatorio que caera en la ruleta
   enciende()
   myData.myVariable = aleatorio
  
   --contadordevueltas=0
   --velocidad=5
   --posanterior= ruleta.rotation
   --para=0
   --paravelo=0
   
   
    
end


local function btnTapIntruc( event )
  composer.showOverlay( "instrucciones" ,{ isModal = true } )
 
end


function enciende( ... )

  -- body1

  if pres==true then
      
      for i= 0,2 do -- Resta la posicion anterior del objeto que cayo para que estos concuerden
            luzPrendidaAma.isVisible=true
            timer.performWithDelay( 200, function() luzPrendidaAma.isVisible=false luzPrendidaVer.isVisible=true sound(1) end )

            timer.performWithDelay( 400, function() luzPrendidaVer.isVisible=false luzPrendidaAzu.isVisible=true sound(1) end )
            
            timer.performWithDelay( 600, function() luzPrendidaAzu.isVisible=false luzPrendidaMora.isVisible=true sound(1) end )

            timer.performWithDelay( 800, function() luzPrendidaMora.isVisible=false luzPrendidaRosa.isVisible=true sound(1) end )

            timer.performWithDelay( 1000, function() luzPrendidaRosa.isVisible=false luzPrendidaAma.isVisible=true sound(1) end )
            
            if i==1 then
            if aleatorio == 1 then
                timer.performWithDelay( 1500, function() luzPrendidaAma.isVisible=false luzPrendidaVer.isVisible=true sound(1) end )
                
                timer.performWithDelay( 2000, function() luzPrendidaVer.isVisible=false luzPrendidaAzu.isVisible=true sound(1) end )
                
                timer.performWithDelay( 2500, function() luzPrendidaAzu.isVisible=false luzPrendidaMora.isVisible=true sound(1) end )

                timer.performWithDelay( 3000, function() luzPrendidaMora.isVisible=false luzPrendidaRosa.isVisible=true sound(1) end )

                timer.performWithDelay( 3500, function() luzPrendidaRosa.isVisible=false luzPrendidaAma.isVisible=true sound(1) end )
            else
                timer.performWithDelay( 1300, function() luzPrendidaAma.isVisible=false luzPrendidaVer.isVisible=true sound(1) end )
                
                timer.performWithDelay( 1600, function() luzPrendidaVer.isVisible=false luzPrendidaAzu.isVisible=true sound(1) end )
                
                timer.performWithDelay( 1900, function() luzPrendidaAzu.isVisible=false luzPrendidaMora.isVisible=true sound(1) end )

                timer.performWithDelay( 2200, function() luzPrendidaMora.isVisible=false luzPrendidaRosa.isVisible=true sound(1) end )

                timer.performWithDelay( 2500, function() luzPrendidaRosa.isVisible=false luzPrendidaAma.isVisible=true sound(1) end )
            end
            elseif i==2 then
                if aleatorio==1 then
                  timer.performWithDelay( 4000, function() composer.removeScene( "bloqueo" ) sound(2) composer.gotoScene( "preguntas", "slideDown", 500 )   end )
                elseif aleatorio == 2 then
                  timer.performWithDelay( 3000, function() luzPrendidaAma.isVisible=false luzPrendidaVer.isVisible=true sound(1) end )
                  timer.performWithDelay( 3500, function() composer.removeScene( "bloqueo" ) sound(2) composer.gotoScene( "preguntas", "slideDown", 500 ) end )
                elseif aleatorio == 3 then
                  timer.performWithDelay( 3000, function() luzPrendidaAma.isVisible=false luzPrendidaVer.isVisible=true sound(1) end )
                  timer.performWithDelay( 3500, function() luzPrendidaVer.isVisible=false luzPrendidaAzu.isVisible=true sound(1) end )
                  timer.performWithDelay( 4000, function() composer.removeScene( "bloqueo" ) sound(2) composer.gotoScene( "preguntas", "slideDown", 500 ) end )
                elseif aleatorio == 4 then
                  timer.performWithDelay( 3000, function() luzPrendidaAma.isVisible=false luzPrendidaVer.isVisible=true sound(1) end )
                  timer.performWithDelay( 3500, function() luzPrendidaVer.isVisible=false luzPrendidaAzu.isVisible=true sound(1) end )
                  timer.performWithDelay( 4000, function() luzPrendidaAzu.isVisible=false luzPrendidaMora.isVisible=true sound(1) end )
                  timer.performWithDelay( 4500, function() composer.removeScene( "bloqueo" ) sound(2) composer.gotoScene( "preguntas", "slideDown", 500 ) end )
                elseif aleatorio == 5 then
                  timer.performWithDelay( 3000, function() luzPrendidaAma.isVisible=false luzPrendidaVer.isVisible=true sound(1) end )
                  timer.performWithDelay( 3500, function() luzPrendidaVer.isVisible=false luzPrendidaAzu.isVisible=true sound(1) end )
                  timer.performWithDelay( 4000, function() luzPrendidaAzu.isVisible=false luzPrendidaMora.isVisible=true sound(1) end )
                  timer.performWithDelay( 4500, function() luzPrendidaMora.isVisible=false luzPrendidaRosa.isVisible=true sound(1) end )
                  timer.performWithDelay( 5000, function() composer.removeScene( "bloqueo" ) sound(2)  composer.gotoScene( "preguntas", "slideDown", 500 ) end )
                end
            end
        end
    
            
            
                
            
            
  end
  
end


function sound(chosen)
  -- body

  --  SELECCIONAR SONIDO DE LA RULETA
  local ruleta_Sound = audio.loadSound( "Sound/Tablero.mp3" )
  local select_Sound = audio.loadSound( "Sound/Tablero2.mp3" )
  --local laserChannel = audio.play( ruleta_Sound )
  
  if (chosen == 1) then
    audio.play( ruleta_Sound )
  elseif (chosen == 2) then
      audio.play( select_Sound )
  end

end


function scene:successful() 
    --local pronuncia = utils.validarVoz(objeto)
   -- local pronuncia = true
    
    --[[if pronuncia == true then
        local r=math.random(1,2)
       local ruta
        if r==1 then
            ruta="excelente"
        else
            ruta="muybien"
        end
        utils.reproducirSonido("sounds/principales/"..ruta)]]--
        print("presionado")

  
end

function scene:create( event )
     local group = self.view
     local background = display.newRect(0, 0, _W, _H)
      background.x = display.contentWidth / 2
      background.y = display.contentHeight / 2
      background:setFillColor( .24)

      group:insert(background)

    local lineaRoja= display.newImage(group,"Image/lineaR.png")
    lineaRoja:translate( centerX,centerY/15 )
    group:insert(lineaRoja)
    local labelNombre = display.newText(group, "Hola Luna", (centerX/6)*2, centerY/15, font, 30)
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

    local labelmoneda = display.newText(group, "$0", (centerX/6)*1.8, centerY/6, font, 22)
    labelmoneda:setTextColor(255, 255, 255)
    group:insert(labelNombre)
    

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

    luzAma= display.newImage(group,"Image/btnGris.png")
    luzAma:translate( (_W/4)*1.2, (_H/9)*2 )
    luzAma:scale(1.3,1.3)
    group:insert(luzAma)

    luzPrendidaAma= display.newImage("Image/btnAma.png")
    luzPrendidaAma:translate( (_W/4)*1.2, (_H/9)*2 )
    luzPrendidaAma:scale(1.3,1.3)
    luzPrendidaAma.isVisible=false
    group:insert(luzPrendidaAma)

    luzVer= display.newImage(group,"Image/btnGris.png")
    luzVer:translate( (_W/4)*2.8, (_H/9)*2 )
    luzVer:scale(1.3,1.3)
    group:insert(luzVer)

    luzPrendidaVer= display.newImage(group,"Image/btnVer.png")
    luzPrendidaVer:translate( (_W/4)*2.8, (_H/9)*2 )
    luzPrendidaVer:scale(1.3,1.3)
    luzPrendidaVer.isVisible=false
    group:insert(luzPrendidaVer)

    luzAzu= display.newImage(group,"Image/btnGris.png")
    luzAzu:translate( (_W/4)*1.2, (_H/9)*4 )
    luzAzu:scale(1.3,1.3)
    group:insert(luzAzu)

    luzPrendidaAzu= display.newImage(group,"Image/btnAzu.png")
    luzPrendidaAzu:translate( (_W/4)*1.2, (_H/9)*4 )
    luzPrendidaAzu.isVisible=false
    luzPrendidaAzu:scale(1.3,1.3)
    group:insert(luzPrendidaAzu)

    luzMora= display.newImage(group,"Image/btnGris.png")
    luzMora:translate( (_W/4)*2.8, (_H/9)*4 )
    luzMora:scale(1.3,1.3)
    group:insert(luzMora)

    luzPrendidaMora= display.newImage(group,"Image/btnMora.png")
    luzPrendidaMora:translate( (_W/4)*2.8, (_H/9)*4 )
    luzPrendidaMora.isVisible=false
    luzPrendidaMora:scale(1.3,1.3)
    group:insert(luzPrendidaMora)

    luzRosa= display.newImage(group,"Image/btnGris.png")
    luzRosa:translate( (_W/4)*1.2, (_H/9)*6 )
    luzRosa:scale(1.3,1.3)
    group:insert(luzRosa)

    luzPrendidaRosa= display.newImage(group,"Image/btnRosa.png")
    luzPrendidaRosa:translate( (_W/4)*1.2, (_H/9)*6 )
    luzPrendidaRosa.isVisible=false
    luzPrendidaRosa:scale(1.3,1.3)
    group:insert(luzPrendidaRosa)

    btnJugar=display.newImage(group,"Image/btnJugar.png")
    btnJugar:translate( (_W/4)*2.8, (_H/9)*6 )
    btnJugar.rotation=0
    btnJugar: addEventListener("tap", btnTapJugar)
    btnJugar:scale(1.3,1.3)
    group:insert(btnJugar)

    cepillo= display.newImage(group,"Image/cepillo.png")
    cepillo:translate( (_W/4)*3.5, (_H/9)*7.8 )
    cepillo:scale(.4,.4)
    group:insert(cepillo)
    
   -- local imageDiente=  display.newImage(group,"Image/diente.png")
    --imageDiente:translate( centerX, centerY+((centerY/5)*3.7) )
   
   -- imageDiente:scale( .4, .4 )


    
     composer.removeScene( "bloqueo" )
    introIsPlaying=true
    
     --Runtime:addEventListener("enterFrame", enciende )
end



function scene:show( event )
	local group = self.view 
        
end
function scene:hide( event )
	local group = self.view
	
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
		
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
        
         composer.removeScene( composer.getSceneName( "current" ) )
	
end

function scene:destroy( event )

	-- Called prior to the removal of scene's "view" (group)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	local group = self.view
	
	
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene