local composer = require( "composer" )
local scene = composer.newScene()
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
    local bandera=false
    
local function btnTapJugar(event)
    --esto es para quitar el bloqueo 
    if introIsPlaying == true then
      local audioChannel = audio.stop() 
      introIsPlaying = false
    end
   composer.showOverlay( "bloqueo" ,{ isModal = true } )
   pres=true
    aleatorio=math.random(1, 5)--Escoge el objeto aleatorio que caera en la ruleta
   contadordevueltas=0
   velocidad=5
   posanterior= ruleta.rotation
   para=0
   paravelo=0
   
   
    
end

function gira()
    
    if pres== true then
        ruleta.rotation=ruleta.rotation +velocidad
        contadordevueltas=contadordevueltas+velocidad
       
        if aleatorio==1 then -- Pone el objeto que cayo asi como su grados de rotacion y su velocidad de parada
            objeto= "clean" -- revisar estas palabras por que son las que estan en la imagen pero no en el word
            para=10
            paravelo=2
        elseif aleatorio==2 then
             objeto= "cookie"
              para=85
              paravelo=2
        elseif aleatorio==3 then
            objeto= "fresbee"
             para=157
             paravelo=2
        elseif aleatorio==4 then
            objeto= "park"
             para=230
             paravelo=2.5
        elseif aleatorio==5 then
            objeto= "plate"
             para=320
             paravelo=2.5
        
            
        end
        for i= 0,posanterior do -- Resta la posicion anterior del objeto que cayo para que estos concuerden
            if para<=0 then
                para=360
            end
            para=para-1
        end
        print("Objeto que cayo "..objeto)
        --print("Valor Para "..para)
        --print("Valor Pos anterior"..posanterior)
    end
    if contadordevueltas>=360 and contadordevueltas<360*2 then--a lenta la ruleta
         velocidad= paravelo
    elseif contadordevueltas>=360*2 + para  then-- Detiene la ruleta
        pres=false

        if pres==false then
          composer.removeScene( "bloqueo" )
        end
       
           
           
      
       if bandera==true then
           bandera=false
          
            
       else
           numeroDeGiros=numeroDeGiros+1
           
       end
       
        contadordevueltas=0
    end
end

local function btnTap(event)
    --esto es para quitar el bloqueo 
    if introIsPlaying == true then
    local audioChannel = audio.stop() 
   introIsPlaying = false
    end
   
   composer.gotoScene ( "ruletaColgate", { effect = "fade"} )
   print(event.target.destination)
   return true
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
      background:setFillColor( 0 )
      background:setStrokeColor( 1, 1, 1 )
      group:insert(background)
    local labelNombre = display.newText(group, "Hola Luna", (centerX/6)*2, centerY/13, font, 30)
    labelNombre:setTextColor(255, 255, 255)

    local moneda= display.newImage(group,"Image/moneda.png")
    moneda:translate( centerX/6, centerY/6)
    moneda:scale(.5,.5)
    local labelmoneda = display.newText(group, "$0", (centerX/6)*1.8, centerY/6, font, 22)
    labelmoneda:setTextColor(255, 255, 255)

    local corazon1= display.newImage(group,"Image/corazon.png")

    corazon1:translate( (_W/6)*4.5, centerY/6)
    corazon1:scale(.5,.5)

    local corazon2= display.newImage(group,"Image/corazon.png")

    corazon2:translate( (_W/6)*5, centerY/6)
    corazon2:scale(.5,.5)

    local corazon3= display.newImage(group,"Image/corazon.png")

    corazon3:translate( (_W/6)*5.5, centerY/6)
    corazon3:scale(.5,.5)

    ruleta=display.newImage(group,"Image/ruleta.png")
    ruleta:translate( centerX, centerY-(centerY/6) )
    ruleta.rotation=0
    ruleta:scale(.6,.6)
    ruleta: addEventListener("tap", btnTapJugar)
    
    
    local imageDiente=  display.newImage(group,"Image/diente.png")
    imageDiente:translate( centerX, centerY+((centerY/5)*3.7) )
   
    imageDiente:scale( .4, .4 )

    local btnInfo=  display.newImage(group,"Image/infoBoton.png")
    btnInfo:translate( centerX/6, centerY+((centerY/5)*4.5) )
   -- btnJugar:addEventListener("tap", btnTapJugar)
    btnInfo:scale( .5, .5 )
    
     composer.removeScene( "bloqueo" )
    introIsPlaying=true
    
     Runtime:addEventListener("enterFrame", gira )
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