local composer = require( "composer" )
local scene = composer.newScene()
local myData = require( "mydata" )
local categoriasData = require("Categorias")
local socket = require("socket")
local facebook = require( "plugin.facebook.v4" )
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
    local variableRegistro
    local labelNombre
    local completa
    local vidas
    local labelmoneda
    local idCategoria;


  --  LLAMADA A WEB SERVICE
function loadTable(filename)

    local path = system.pathForFile( filename, system.DocumentsDirectory)
    local file = io.open( path, "r" )

    if file then
         -- read all contents of file into a string
         local contents = file:read( "*a" )
         local myTable = contents
         io.close( file )
         print(" -- load success."..myTable)
         return myTable 
    end

    print(" -- load fail, no pre-existing file.")
    return nil
end
  local json = require( "json" )

  local function handleResponse( event )
      if not event.isError then
          local response = json.decode( event.response )
          local completa = json.encode( event.response )
          variableRegistro = response
          
          labelNombre.text=variableRegistro["first_name"]
          myData.nombre= variableRegistro["first_name"]
          myData.corazones= variableRegistro["lifes"]
          myData.puntos= variableRegistro["points"]
          myData.id_categoria =variableRegistro["id"]
          labelmoneda.text =  myData.puntos
          print ("Respuesta:".. myData.corazones)
          print("aber "..myData.id_categoria)
      else
          print( "Error" )
      end
      return
  end
  local function handleResponse2( event )
      if not event.isError then
           contador = 0
           response1 = json.decode( event.response )
           completa = json.encode( event.response )
           print("hala")
          variableRegistro = response1
          --variableRegistro2 = json.decode(variableRegistro["results"])
          print("busqueda")
          print(json.encode(variableRegistro["results"]))
          for dato,count in pairs (response1) do
              print("es el dato")
              print(dato)
              print("es el count")
              print(count)
              if dato== "results" then
                  local parte1= json.encode( count )
                    local partes= json.decode( parte1)
                    print("esta es parte1")
                    print(parte1)
                    print ("esta es partes")
                    print(partes)
                    for i,j in pairs (partes) do
                        for n,m in pairs (j) do
                              if n == "id" then
                                  print(contador)
                                  if contador == 0 then
                                      categoriasData.id_categoria1=m
                                      contador = 1
                                      print("aqui estan los momos")
                                            print(categoriasData.id_categoria1)
                                      else if contador == 1 then 
                                          categoriasData.id_categoria2=m
                                            contador = 2
                                            print("aqui estan los momos")
                                            print(categoriasData.id_categoria2)
                                          else if contador == 2 then
                                              categoriasData.id_categoria3=m
                                                    contador = 3
                                                    print("aqui estan los momos")
                                            print(categoriasData.id_categoria3)
                                              else if contador == 3 then 
                                                  categoriasData.id_categoria4=m
                                                    contador = 4
                                                    print("aqui estan los momos")
                                            print(categoriasData.id_categoria4)
                                                  else if contador == 4 then 
                                                      categoriasData.id_categoria5=m
                                                      contador = 0
                                                      print("aqui estan los momos")
                                            print(categoriasData.id_categoria5)
                                                      
                                                  end
                                              end
                                          end
                                      end
                                  end
                                  --categoriasData.id_categoria1= 
                                  
                              
                        end
                    end
                  
                  
                end
              end
              
          end
         
          
          
         
      else 
          print("error de momos")
      
      end
      return
  end


    
local function btnTapJugar(event)
    --esto es para quitar el bloqueo 
print("era aqui men")
    if myData.corazones == 0 and myData.corazones == nil then

      saveTable("no","login")
      composer.gotoScene( "login", "crossFade", 500 )     
      if tokenFacebook == "No" then
      else
        facebook.logout()

      end

    else  
      local test = socket.tcp()
      test:settimeout(1000)                   -- Set timeout to 1 second
                  
      local testResult = test:connect("www.google.com", 80)        -- Note that the test does not work if we put http:// in front
       
      if not(testResult == nil) then
          print("Internet access is available")
          composer.showOverlay( "bloqueo" ,{ isModal = true } )
          pres=true
          aleatorio=math.random(1, 5) --Escoge el objeto aleatorio que caera en la ruleta
          enciende()
      else
          local alert = native.showAlert( "Error de validación", "Revisa tu conexión de internet", { "OK" } )
      end
                  
      test:close()
      test = nil

    end
   --contadordevueltas=0
   --velocidad=5
   --posanterior= ruleta.rotation
   --para=0
   --paravelo=0
   
   
    
end

function saveTable(t, filename)
--    print(" -- saving table ", filename)
    local path = system.pathForFile( filename, system.DocumentsDirectory)
    local file = io.open(path, "w")

    if file then
        local contents = t
        file:write( contents )
        io.close( file )
--        print(" -- save success.")
        return true
    else
        print(" -- save failed.")
        return false
    end
end
local function btnTapIntruc( event )
  print("intru")
  composer.gotoScene( "instrucciones" ,"zoomOutIn", 300  )
 
end

local function btnCerrarSE( event )
  if tokenFacebook == "No" then

  else
     facebook.logout()

  end
  saveTable("no","login")
  composer.gotoScene( "login", "crossFade", 500 )     
  
 
end


function enciende( ... )

  -- body1

   myData.categoria = aleatorio
  if pres==true then
      
      for i= 0,2 do -- Resta la posicion anterior del objeto que cayo para que estos concuerden
            luzPrendidaAma.isVisible=true
            timer.performWithDelay( 200, function() luzPrendidaAma.isVisible=false luzPrendidaVer.isVisible=true sound_no_repeat(i,1) end )

            timer.performWithDelay( 400, function() luzPrendidaVer.isVisible=false luzPrendidaAzu.isVisible=true sound_no_repeat(i,2) end )
            
            timer.performWithDelay( 600, function() luzPrendidaAzu.isVisible=false luzPrendidaMora.isVisible=true sound_no_repeat(i,3) end )

            timer.performWithDelay( 800, function() luzPrendidaMora.isVisible=false luzPrendidaRosa.isVisible=true sound_no_repeat(i,4) end )

            timer.performWithDelay( 1000, function() luzPrendidaRosa.isVisible=false luzPrendidaAma.isVisible=true sound_no_repeat(i,5) end )
            
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
                
                  timer.performWithDelay( 4000, function() composer.removeScene( "bloqueo" ) sound(2) timer.performWithDelay( 2000, function() composer.gotoScene( "preguntas", "slideDown", 500 )end)   end )
                  myData.id_categoria = categoriasData.id_categoria1
                  myData.categoria = 1
                  myData.nombreCate = "Genéricos"
                  print("categoria:" .. myData.categoria )
                elseif aleatorio == 2 then
                  timer.performWithDelay( 3000, function() luzPrendidaAma.isVisible=false luzPrendidaVer.isVisible=true sound(1) end )
                  timer.performWithDelay( 3500, function() composer.removeScene( "bloqueo" ) sound(2) timer.performWithDelay( 2000, function() composer.gotoScene( "preguntas", "slideDown", 500 )end) end )
                  myData.id_categoria = categoriasData.id_categoria2
                  myData.categoria = 2
                  myData.nombreCate = "Enjuagues dentales"
                   print("categoria:" .. myData.categoria )
                elseif aleatorio == 3 then
                  timer.performWithDelay( 3000, function() luzPrendidaAma.isVisible=false luzPrendidaVer.isVisible=true sound(1) end )
                  timer.performWithDelay( 3500, function() luzPrendidaVer.isVisible=false luzPrendidaAzu.isVisible=true sound(1) end )
                  timer.performWithDelay( 4000, function() composer.removeScene( "bloqueo" ) sound(2) timer.performWithDelay( 2000, function() composer.gotoScene( "preguntas", "slideDown", 500 )end) end )
                  myData.id_categoria = categoriasData.id_categoria3
                  myData.categoria = 3
                  myData.nombreCate = "Cremas Dentales"
                   print("categoria:" .. myData.categoria )
                elseif aleatorio == 4 then
                  timer.performWithDelay( 3000, function() luzPrendidaAma.isVisible=false luzPrendidaVer.isVisible=true sound(1) end )
                  timer.performWithDelay( 3500, function() luzPrendidaVer.isVisible=false luzPrendidaAzu.isVisible=true sound(1) end )
                  timer.performWithDelay( 4000, function() luzPrendidaAzu.isVisible=false luzPrendidaMora.isVisible=true sound(1) end )
                  timer.performWithDelay( 4500, function() composer.removeScene( "bloqueo" ) sound(2) timer.performWithDelay( 2000, function() composer.gotoScene( "preguntas", "slideDown", 500 )end) end )
                  myData.id_categoria = categoriasData.id_categoria4
                  myData.categoria = 4
                  myData.nombreCate = "Cepillos Dentales"
                   print("categoria:" .. myData.categoria )
                elseif aleatorio == 5 then
                  timer.performWithDelay( 3000, function() luzPrendidaAma.isVisible=false luzPrendidaVer.isVisible=true sound(1) end )
                  timer.performWithDelay( 3500, function() luzPrendidaVer.isVisible=false luzPrendidaAzu.isVisible=true sound(1) end )
                  timer.performWithDelay( 4000, function() luzPrendidaAzu.isVisible=false luzPrendidaMora.isVisible=true sound(1) end )
                  timer.performWithDelay( 4500, function() luzPrendidaMora.isVisible=false luzPrendidaRosa.isVisible=true sound(1) end )
                  timer.performWithDelay( 5000, function() composer.removeScene( "bloqueo" ) sound(2)  timer.performWithDelay( 2000, function() composer.gotoScene( "preguntas", "slideDown", 500 )end) end )
                  myData.id_categoria = categoriasData.id_categoria5
                  myData.categoria = 5
                  myData.nombreCate = "Salud Bucal"
                   print("categoria:" .. myData.categoria )
                end
            end
        end
    
            
            
                
            
            
  end
  
end

  --  FUNCIONES DE SONIDO

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


function sound_no_repeat(counter, color)
  -- body

  --  SELECCIONAR SONIDO DE LA RULETA
  local ruleta_Sound = audio.loadSound( "Sound/Tablero.mp3" )

  
    if color == 1 then
      myData.sonido_ama = myData.sonido_ama + counter
        if  myData.sonido_ama == 3 then
          audio.play( ruleta_Sound )
        end

    elseif color == 2 then 
      myData.sonido_ver = myData.sonido_ver + counter
        if  myData.sonido_ver == 3 then
          audio.play( ruleta_Sound )
        end

    elseif color == 3 then 
      myData.sonido_azu = myData.sonido_azu + counter
        if  myData.sonido_azu == 3 then
          audio.play( ruleta_Sound )
        end

    elseif color == 4 then 
      myData.sonido_mora = myData.sonido_mora + counter
        if  myData.sonido_mora == 3 then
          audio.play( ruleta_Sound )
        end

    elseif color == 5 then 
      myData.sonido_rosa = myData.sonido_rosa + counter
        if  myData.sonido_rosa == 3 then
          audio.play( ruleta_Sound )
        end

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
    
      local params = {}
      local categoria = {}

      local headers = {}

      if myData.token== 0 then
        myData.token= loadTable("login")
      end

     headers["authorization"] = "Bearer " .. myData.token
     headers["Content-Type"] = "application/x-www-form-urlencoded"
     params.headers = headers

      url = "https://colgate.herokuapp.com/api/v1/categories/"

      network.request( url, "GET", handleResponse2, params )
      print("este es el json")
      print(categoriasData.id_categoria1)
      print(categoriasData.nombre_categoria1)
      print(categoriasData.id_categoria2)
      print(categoriasData.nombre_categoria2)
      print(categoriasData.id_categoria3)
      print(categoriasData.nombre_categoria3)
      
     


      
     local group = self.view
     local background = display.newRect(0, 0, _W, _H)
      background.x = display.contentWidth / 2
      background.y = display.contentHeight / 2
      background:setFillColor( .93)

      group:insert(background)

    local lineaRoja= display.newImage(group,"Image/lineaR.png")
    lineaRoja:translate( centerX,centerY/15 )
    group:insert(lineaRoja)
    print("oncreate myData:"..myData.nombre)
    labelNombre = display.newText(group, myData.nombre, centerX/5, centerY/15, font, 30)
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

    labelmoneda = display.newText(group, myData.puntos, (centerX/6)*1.8, centerY/6, font, 22)
    labelmoneda:setTextColor(255, 255, 255)
    group:insert(labelmoneda)
    
    
     url = "https://colgate.herokuapp.com/api/v1/users/me/"

      
      timer.performWithDelay( 1000, function()  print("vidas:" .. myData.corazones)  
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


    end end)  
   

    luzAma= display.newImage(group,"Image/btnGrisAm.png")
    luzAma:translate( (_W/4)*1.2, (_H/9)*2 )
    luzAma:scale(.55,.55)
    group:insert(luzAma)

    luzPrendidaAma= display.newImage("Image/btnAma.png")
    luzPrendidaAma:translate( (_W/4)*1.2, (_H/9)*2 )
    luzPrendidaAma:scale(1.3,1.3)
    luzPrendidaAma.isVisible=false
    group:insert(luzPrendidaAma)

    luzVer= display.newImage(group,"Image/btnGrisVe.png")
    luzVer:translate( (_W/4)*2.8, (_H/9)*2 )
    luzVer:scale(.55,.55)
    group:insert(luzVer)

    luzPrendidaVer= display.newImage(group,"Image/btnVer.png")
    luzPrendidaVer:translate( (_W/4)*2.8, (_H/9)*2 )
    luzPrendidaVer:scale(1.3,1.3)
    luzPrendidaVer.isVisible=false
    group:insert(luzPrendidaVer)

    luzAzu= display.newImage(group,"Image/btnGrisAz.png")
    luzAzu:translate( (_W/4)*1.2, (_H/9)*4 )
    luzAzu:scale(.55,.55)
    group:insert(luzAzu)

    luzPrendidaAzu= display.newImage(group,"Image/btnAzu.png")
    luzPrendidaAzu:translate( (_W/4)*1.2, (_H/9)*4 )
    luzPrendidaAzu.isVisible=false
    luzPrendidaAzu:scale(1.3,1.3)
    group:insert(luzPrendidaAzu)

    luzMora= display.newImage(group,"Image/btnGrisMo.png")
    luzMora:translate( (_W/4)*2.8, (_H/9)*4 )
    luzMora:scale(.55,.55)
    group:insert(luzMora)

    luzPrendidaMora= display.newImage(group,"Image/btnMora.png")
    luzPrendidaMora:translate( (_W/4)*2.8, (_H/9)*4 )
    luzPrendidaMora.isVisible=false
    luzPrendidaMora:scale(1.3,1.3)
    group:insert(luzPrendidaMora)

    luzRosa= display.newImage(group,"Image/btnGrisRo.png")
    luzRosa:translate( (_W/4)*1.2, (_H/9)*6 )
    luzRosa:scale(.55,.55)
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

    btnInfo=display.newImage(group,"Image/InfoBoton.png")
    btnInfo:translate( (_W/8), (_H/9)*8.5 )
    btnInfo: addEventListener("tap", btnTapIntruc)
    btnInfo:scale(.6,.6)
    group:insert(btnInfo)
    
    local btnCerrar = display.newText(group, "Cerrar Sesión", display.contentCenterX, (_H/9)*8.5, font, 30)

        btnCerrar.anchorX=1
        btnCerrar.anchorX=0
        btnCerrar:setTextColor(0, 0, 0)
        btnCerrar.x=display.contentCenterX- btnCerrar.width/2
        btnCerrar:addEventListener("tap", btnCerrarSE)
        
        group:insert(btnCerrar)

    cepillo= display.newImage(group,"Image/cepillo.png")
    cepillo:translate( (_W/4)*3.7, (_H/9)*6.5 )
    cepillo:scale(.9,.9)
    group:insert(cepillo)
    
   -- local imageDiente=  display.newImage(group,"Image/diente.png")
    --imageDiente:translate( centerX, centerY+((centerY/5)*3.7) )
   
   -- imageDiente:scale( .4, .4 )

     url = "https://colgate.herokuapp.com/api/v1/users/me/"

      network.request( url, "GET", handleResponse, params )
     composer.removeScene( "bloqueo" )
    introIsPlaying=true
    
     --Runtime:addEventListener("enterFrame", enciende )
end



function scene:show( event )
	local group = self.view 
        
end
function scene:hide( event )
	local group = self.view
	 composer.removeScene( composer.getSceneName( "current" ) )
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
		
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
        
         
	
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