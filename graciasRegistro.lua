local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local myData = require( "mydata" )
local socket = require("socket")
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

local image, text1, text2, text3, memTimer, variableRegistro

-- Touch event listener for background image 
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

--  LLAMADA A WEB SERVICE

    local json = require( "json" )
    local function handleResponse( event )
        if not event.isError then
            local response = json.decode( event.response )
            print("Registro " .. event.response)
            variableRegistro = response
        else
            print( "Error" )
        end
        return
    end


-- Called when the scene's view does not exist:
function scene:create( event )
	local sceneGroup = self.view
	    ------------  SE DEBEN INICIAR LOS VALORES PARA CREAR LA VARIABLE "REGISTRO"  --------------------------------------      
    
    local params = {}

    local headers = {}
    headers["authorization"] = "Basic QU1Cc2JHMko4MGZONlMxYVVaaExjYW1PUzdxOUFEdFdsMW5Yemt3bjplSVFxcjNGRUVKS0VHa09TWkJVQkJWaElqZFB2OFZyYlFQQjlEVlloWXFXS1djSHVxNTBPZWVuYVh4YmZNUTQ3MFZFZXR6WlJhMXZpZTZNVnNxRDFuZVBFQlpiOTZWYVZnWmpLVXhibnNka0EwaFJvc1RHbGNMMXB5Q0xnWjZPcg=="
    headers["Content-Type"] = "application/x-www-form-urlencoded"
    local body = "grant_type=password&username=0&password=0"

    params.headers = headers
    params.body = body

    url = "https://colgate.herokuapp.com/o/token/"

    network.request( url, "POST", handleResponse, params )


    ----------
	
	local background = display.newRect(0, 0, _W, _H)
    background.x = display.contentWidth / 2
    background.y = display.contentHeight / 2
	background:setFillColor( .93)
    
	
	sceneGroup:insert( background )

	local imageDiente= display.newImage("Image/diente.png")
	imageDiente.x= display.contentWidth / 2
	imageDiente.y= (display.contentWidth/4) + 30
	imageDiente:scale( .55, 0.55 )
	sceneGroup:insert( imageDiente )

	local imageTexto= display.newImage("Image/textGracias.png")
	imageTexto.x= display.contentWidth / 2
	imageTexto.y= display.contentCenterY/2 +100
	imageTexto:scale( .7, 0.7 )
	sceneGroup:insert( imageTexto )

	local btnPresslog = function( event )
	  --composer.gotoScene( "ruletaColgate", "slideLeft", 500 )  
            local test = socket.tcp()
                test:settimeout(1000)                   -- Set timeout to 1 second
                            
                local testResult = test:connect("www.google.com", 80)        -- Note that the test does not work if we put http:// in front
                 
                if not(testResult == nil) then
                    local params = {}
        
                local headers = {}
                headers["authorization"] = "Basic QU1Cc2JHMko4MGZONlMxYVVaaExjYW1PUzdxOUFEdFdsMW5Yemt3bjplSVFxcjNGRUVKS0VHa09TWkJVQkJWaElqZFB2OFZyYlFQQjlEVlloWXFXS1djSHVxNTBPZWVuYVh4YmZNUTQ3MFZFZXR6WlJhMXZpZTZNVnNxRDFuZVBFQlpiOTZWYVZnWmpLVXhibnNka0EwaFJvc1RHbGNMMXB5Q0xnWjZPcg=="
                headers["Content-Type"] = "application/x-www-form-urlencoded"
                local body = "grant_type=password&username=" .. myData.registro_mail .. "&password=" .. myData.registro_pass

                params.headers = headers
                params.body = body

                url = "https://colgate.herokuapp.com/o/token/"

                network.request( url, "POST", handleResponse, params )
                timer.performWithDelay( 2000, function()  network.request( url, "POST", handleResponse, params )  
               -- print(variableRegistro["access_token"]) 
                     myData.token = variableRegistro["access_token"]
                     saveTable(myData.token,"login")
                     composer.gotoScene( "ruletaColgate", "crossFade", 500 )  
                end )

                else
                    local alert = native.showAlert( "Error de validación", "Revisa tu conexión de internet", { "OK" } )
                end
                            
                test:close()
                test = nil

         --  INICIAR VARIABLES PARA CONVERTIR EL STRING EN JSON

        
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

    sceneGroup:insert( btnLogin )

	local imageLogo= display.newImage("Image/logoColgate.png")
	imageLogo.x=display.contentCenterX
	imageLogo.y=_H -100
	imageLogo:scale( .5, 0.5 )
	sceneGroup:insert( imageLogo )


	
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