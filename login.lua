local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local myData = require( "mydata" )
local json = require( "json" )
local socket = require("socket")
local ltn12 = require("ltn12")
--local settings = require("settings")
--local introIsPlaying
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

local image, text1, text2, text3, memTimer, variableRegistro
local frmUsername, frmPassword

-- Touch event listener for background image
--require the file with the save/load functions

-- saveTable(t,filename) saves the table t to a file in the DocumentsDirectory (named as filename)
--     returns true if success, false on failure
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



local function onUsername( event )
    if ( "began" == event.phase ) then
        -- This is the "keyboard appearing" event.
        -- In some cases you may want to adjust the interface while the keyboard is open.

    elseif ( "submitted" == event.phase ) then
        -- Automatically tab to password field if user clicks "Return" on virtual keyboard.
        native.setKeyboardFocus( frmPassword )
    end
end

local function onPassword( event )
    -- Hide keyboard when the user clicks "Return" in this field
    if ( "submitted" == event.phase ) then
        native.setKeyboardFocus( nil )
    end
end


-- loadTable(filename) loads in a table from filename in the DocumentsDirectory (filename)
--        returns table structure (nil on error)
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
    return "no"
end

   --  LLAMADA A WEB SERVICE

    
    local function handleResponse( event )
        if not event.isError then
            local response = json.decode( event.response )
           -- print("Registro"..response)
            variableRegistro = response
        else
            print( "Error" )
        end
        return
    end
function wait()
    for i=1,100 do
     print("espera"..i)
    end
   
end
function reproducirSonido( sonido, bloqueo, fnCallback )
    print(sonido)
    if bloqueo == 0 then
        composer.showOverlay( "bloqueo" ,{ isModal = true } )
    end
    
    local sound = audio.loadSound( "Sound/"..sonido..".mp3" )
    
    local audioChannel = audio.play( sound, { channel = audioChannel,
        onComplete= function()
            audioChannel = nil
            audio.dispose( audioChannel )
            if bloqueo == 0 or bloqueo == 1 then
                composer.removeScene( "bloqueo" )
            end
            if fnCallback~=nil then
                fnCallback()
            end
    end  } )
    if audioChannel > 0 then 
        --audio.setVolume( 0.07, { channel=laserChannel } )
        --print( "channel new " .. laserChannel )
    end
    
end

-- Called when the scene's view does not exist:
function scene:create( event )
	 local group = self.view

    
     local firts = loadTable("login")
     print("Hay tabla "..firts)
     if firts == "no" then

        local params = {}

        local headers = {}
        headers["authorization"] = "Basic QU1Cc2JHMko4MGZONlMxYVVaaExjYW1PUzdxOUFEdFdsMW5Yemt3bjplSVFxcjNGRUVKS0VHa09TWkJVQkJWaElqZFB2OFZyYlFQQjlEVlloWXFXS1djSHVxNTBPZWVuYVh4YmZNUTQ3MFZFZXR6WlJhMXZpZTZNVnNxRDFuZVBFQlpiOTZWYVZnWmpLVXhibnNka0EwaFJvc1RHbGNMMXB5Q0xnWjZPcg=="
        headers["Content-Type"] = "application/x-www-form-urlencoded"
        local body = "grant_type=password&username=0&password=0"

        params.headers = headers
        params.body = body

        url = "https://colgate.herokuapp.com/o/token/"

        network.request( url, "POST", handleResponse, params )

        --------------------------------------------------------------------------


        local background = display.newRect(0, 0, _W, _H)
        background.x = display.contentWidth / 2
        background.y = display.contentHeight / 2
        background:setFillColor( 255 )
        background:setStrokeColor( 255, 255, 255 )
        group:insert(background)

        local fondoPunteado= display.newImage("Image/fondoCel.png")
        fondoPunteado.x= display.contentWidth / 2
        fondoPunteado.y=display.contentHeight/2
        group:insert( fondoPunteado )


        local labelUsername = display.newText(group, "Correo Electrónico", 0, 0, font, 25)
        local labelPassword = display.newText(group, "Contraseña", 0, 0, font, 25)
        local labelReturnStatus = display.newText(group, "", 0, 0, font, 18)
        local imageLogo= display.newImage("Image/logoColgate.png")

        frmUsername = native.newTextField(0, 0, _W/2, 40)
        frmPassword = native.newTextField(0, 0, _W /2, 40)

        labelUsername:setTextColor(0, 0, 0)
        labelUsername.anchorX=1
        labelUsername.anchorX=0
        labelUsername.x = _W * 0.5 - (labelUsername.width/2)
        labelUsername.y = (_H/2)-220

        labelPassword.anchorX=1
        labelPassword.anchorX=0
        labelPassword:setTextColor(0, 0, 0)
        labelPassword.x = _W * 0.5 - (labelPassword.width/2)
        labelPassword.y = (_H/2)-140

        labelReturnStatus.anchorX=1
        labelReturnStatus.anchorX=0
        labelReturnStatus:setTextColor(0, 0, 0)
        labelReturnStatus.x = _W * 0.5 - 140
        labelReturnStatus.y = (_H/2)-40
        imageLogo.x=display.contentCenterX
        imageLogo.y=_H -100
        imageLogo:scale( .5, 0.5 )

        frmUsername.inputType = "default"
        frmUsername.font = native.newFont(font, 18)      
        frmUsername.isEditable = true
        frmUsername.align = "center"        
        frmUsername.anchorX=1
        frmUsername.anchorX=0
        frmUsername.x = _W * 0.5 - 140
        frmUsername.y = (_H/2)-180
        frmUsername.text = ''

        frmPassword.inputType = "default"
        frmPassword.font = native.newFont(font, 18)
        frmPassword.isEditable = true
        frmPassword.isSecure = true
        frmPassword.align = "center"
        frmPassword.anchorX=1
        frmPassword.anchorX=0
        frmPassword.x = _W * 0.5 - 140
        frmPassword.y = (_H/2)-100
        frmPassword.text = ''

        group:insert(labelUsername)
        group:insert(labelPassword)
        group:insert(labelReturnStatus)
        group:insert(imageLogo)
        
        frmUsername:addEventListener( "userInput", onUsername )
        group:insert(frmUsername)

        frmPassword:addEventListener( "userInput", onPassword )
        group:insert(frmPassword)

        
        -- add login form field to login screen
       local btnPresslog = function( event )

            local userid = frmUsername.text
            local password = frmPassword.text 

             
            -- stop if fields are blank
            if(userid == '' or password == '') then
               local alert = native.showAlert( "Error de validación", "Es necesario que ingrese un Usuario y una Clave de Acceso", { "OK" } )
                return


            else
               -- labelReturnStatus.text = 'Haciendo login.'

                 --  INICIAR VARIABLES PARA CONVERTIR EL STRING EN JSON
                 local test = socket.tcp()
                test:settimeout(1000)                   -- Set timeout to 1 second
                            
                local testResult = test:connect("www.google.com", 80)        -- Note that the test does not work if we put http:// in front
                 
                if not(testResult == nil) then
                    print("Internet access is available")
                     local params = {}
                
                local headers = {}
                
                headers["authorization"] = "Basic QU1Cc2JHMko4MGZONlMxYVVaaExjYW1PUzdxOUFEdFdsMW5Yemt3bjplSVFxcjNGRUVKS0VHa09TWkJVQkJWaElqZFB2OFZyYlFQQjlEVlloWXFXS1djSHVxNTBPZWVuYVh4YmZNUTQ3MFZFZXR6WlJhMXZpZTZNVnNxRDFuZVBFQlpiOTZWYVZnWmpLVXhibnNka0EwaFJvc1RHbGNMMXB5Q0xnWjZPcg=="
                headers["Content-Type"] = "application/x-www-form-urlencoded"
                local body = "grant_type=password&username=" .. userid .. "&password=" .. password

                params.headers = headers
                params.body = body

                url = "https://colgate.herokuapp.com/o/token/"

                network.request( url, "POST", handleResponse, params )
                timer.performWithDelay( 1000, function()  network.request( url, "POST", handleResponse, params )  
               -- print(variableRegistro["access_token"]) 
                if variableRegistro["access_token"] == nil then
                    local alert = native.showAlert( "Error de validación", "Usuario o Contraseña son incorrectos", { "OK" } )
                
                else
                     myData.token = variableRegistro["access_token"]
                     saveTable(myData.token,"login")
                     frmUsername:removeSelf()
                     frmPassword:removeSelf()
                     composer.gotoScene( "instrucciones", "crossFade", 500 )         
                end end )
                   
                else
                    local alert = native.showAlert( "Error de validación", "Revisa tu conexión de internet", { "OK" } )
                end
                            
                test:close()
                test = nil

               
            end  
           

        end
        local function btnRegistrar( event )
            --reproducirSonido("EjemploTablero",0,wait())
               
                local test = socket.tcp()
                test:settimeout(1000)                   -- Set timeout to 1 second
                            
                local testResult = test:connect("www.google.com", 80)        -- Note that the test does not work if we put http:// in front
                 
                if not(testResult == nil) then
                    print("Internet access is available")
                    frmUsername:removeSelf()
                    frmPassword:removeSelf()
                    composer.gotoScene( "registro", "slideRight", 500 )
                else
                    local alert = native.showAlert( "Error de validación", "Revisa tu conexión de internet", { "OK" } )
                end
                            
                test:close()
                test = nil
                
        end
               

            local btnLogin = widget.newButton({
                    width = 200,
                    height = 200,
                    defaultFile = "Image/btnComenzar.png",
                    overFile = "Image/btnComenzar.png",
                    onPress = btnPresslog     
                    })
                btnLogin.x = display.contentCenterX 
                btnLogin.y = display.contentCenterY + 100
            -- add button to login screen
            group:insert(btnLogin)
        

             local btnRegistro = display.newText(group, "Si aun no estas registrado,", display.contentCenterX, display.contentCenterY+ 240, font, 18)

             local btnComenzar = widget.newButton({
                    id = "registrar button",
                    --label = "REGISTRAR",
                    emboss = false,
                    defaultFile = "Image/btnRegistrarme.png",
                    overFile = "Image/btnRegistrarme.png",

                    -- Properties for a rounded rectangle button
                    --shape = "roundedRect",
                    --width = 200,
                    --height = 40,
                    --cornerRadius = 2,
                    --fillColor = { default={1,1,1,1}, over={1,0.1,0.7,0.4} },
                    --strokeColor = { default={2,1,4,1}, over={0.8,0.8,1,1} },
                    --strokeWidth = 4,
                    onPress = btnRegistrar     
            })

            btnComenzar:scale(.75,.75)
            btnComenzar.x = display.contentCenterX
            btnComenzar.y = (_H/8)*6.3
            -- add button to login screen

            btnRegistro.anchorX=1
            btnRegistro.anchorX=0
            btnRegistro:setTextColor(0, 0, 0)
            btnRegistro.x=display.contentCenterX- btnRegistro.width/2
            
            group:insert(btnRegistro)
            group:insert(btnComenzar)
   
     else

        print(platform) 
        print (display.pixelHeight)

        if string.sub( system.getInfo("model"), 1, 4 ) == "iPad" or display.pixelHeight > 2000 then
            composer.gotoScene( "ruletaColgate_Land", "crossFade", 500 ) 
        else            
            composer.gotoScene( "ruletaColgate", "crossFade", 500 ) 
        end

     end   

    ------------  SE DEBEN INICIAR LOS VALORES PARA CREAR LA VARIABLE "REGISTRO"  --------------------------------------      
    
    
	 --Runtime:addEventListener("enterFrame", function() end)
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