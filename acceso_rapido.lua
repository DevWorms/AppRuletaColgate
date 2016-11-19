local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local myData = require( "mydata" )
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

local image, text1, text2, text3, memTimer, variableRegistro

-- Touch event listener for background image 


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
    local body = "grant_type=password&username=0&password=0"

    params.headers = headers
    params.body = body

    url = "https://colgate.herokuapp.com/o/token/"

    network.request( url, "POST", handleResponse, params )


    ----------

	local btnPresslog = function( event )
	  --composer.gotoScene( "ruletaColgate", "slideLeft", 500 )  


         --  INICIAR VARIABLES PARA CONVERTIR EL STRING EN JSON

        local params = {}
        
        local headers = {}
        headers["authorization"] = "Basic QU1Cc2JHMko4MGZONlMxYVVaaExjYW1PUzdxOUFEdFdsMW5Yemt3bjplSVFxcjNGRUVKS0VHa09TWkJVQkJWaElqZFB2OFZyYlFQQjlEVlloWXFXS1djSHVxNTBPZWVuYVh4YmZNUTQ3MFZFZXR6WlJhMXZpZTZNVnNxRDFuZVBFQlpiOTZWYVZnWmpLVXhibnNka0EwaFJvc1RHbGNMMXB5Q0xnWjZPcg=="
        local body = "grant_type=password&username=1@2.com&password=q"

        params.headers = headers
        params.body = body

        url = "https://colgate.herokuapp.com/o/token/"

        network.request( url, "POST", handleResponse, params )
        timer.performWithDelay( 500, function()  network.request( url, "POST", handleResponse, params )  
       -- print(variableRegistro["access_token"]) 
             myData.token = variableRegistro["access_token"]
             composer.gotoScene( "ruletaColgate", "crossFade", 500 )  
        end )

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