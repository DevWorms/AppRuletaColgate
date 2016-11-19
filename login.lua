local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local myData = require( "mydata" )
--local introIsPlaying
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
           -- print("Registro"..response)
            variableRegistro = response
        else
            print( "Error" )
        end
        return
    end


-- Called when the scene's view does not exist:
function scene:create( event )
	 local group = self.view

    
    ------------  SE DEBEN INICIAR LOS VALORES PARA CREAR LA VARIABLE "REGISTRO"  --------------------------------------      
    
    local params = {}

    local headers = {}
    headers["authorization"] = "Basic QU1Cc2JHMko4MGZONlMxYVVaaExjYW1PUzdxOUFEdFdsMW5Yemt3bjplSVFxcjNGRUVKS0VHa09TWkJVQkJWaElqZFB2OFZyYlFQQjlEVlloWXFXS1djSHVxNTBPZWVuYVh4YmZNUTQ3MFZFZXR6WlJhMXZpZTZNVnNxRDFuZVBFQlpiOTZWYVZnWmpLVXhibnNka0EwaFJvc1RHbGNMMXB5Q0xnWjZPcg=="
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
    labelUsername:setTextColor(0, 0, 0)
    labelUsername.anchorX=1
    labelUsername.anchorX=0
    labelUsername.x = _W * 0.5 - (labelUsername.width/2)
    labelUsername.y = (_H/2)-220
    group:insert(labelUsername)

    local labelPassword = display.newText(group, "Contraseña", 0, 0, font, 25)

    labelPassword.anchorX=1
    labelPassword.anchorX=0
    labelPassword:setTextColor(0, 0, 0)
    labelPassword.x = _W * 0.5 - (labelPassword.width/2)

    labelPassword.y = (_H/2)-140
    group:insert(labelPassword)

    local labelReturnStatus = display.newText(group, "", 0, 0, font, 18)

    labelReturnStatus.anchorX=1
    labelReturnStatus.anchorX=0
    labelReturnStatus:setTextColor(0, 0, 0)
    labelReturnStatus.x = _W * 0.5 - 140
    labelReturnStatus.y = (_H/2)-40
    group:insert(labelReturnStatus)

    local imageLogo= display.newImage("Image/logoColgate.png")
    imageLogo.x=display.contentCenterX
    imageLogo.y=_H -100
    imageLogo:scale( .5, 0.5 )
    group:insert(imageLogo)

    local frmUsername = native.newTextField(0, 0, _W/2, 40)
    frmUsername.inputType = "default"
    frmUsername.font = native.newFont(font, 18)
  
    frmUsername.isEditable = true
    frmUsername.align = "center"
    
    frmUsername.anchorX=1
    frmUsername.anchorX=0

    frmUsername.x = _W * 0.5 - 140
    frmUsername.y = (_H/2)-180
    frmUsername.text = ''

-- add login form field to login screen
    group:insert(frmUsername)

-- handle field events
   


    local frmPassword = native.newTextField(0, 0, _W /2, 40)
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

    -- add login form field to login screen
    group:insert(frmPassword)


    frmPassword:addEventListener("userInput",frmPassword)

    local btnPresslog = function( event )

        local userid = frmUsername.text
        local password = frmPassword.text 

         
        -- stop if fields are blank
        if(userid == '' or password == '') then
            labelReturnStatus.text = 'Favor de llenar los campos.'
            return


        else
            labelReturnStatus.text = 'Haciendo login.'

             --  INICIAR VARIABLES PARA CONVERTIR EL STRING EN JSON

            local params = {}
            
            local headers = {}
            headers["authorization"] = "Basic QU1Cc2JHMko4MGZONlMxYVVaaExjYW1PUzdxOUFEdFdsMW5Yemt3bjplSVFxcjNGRUVKS0VHa09TWkJVQkJWaElqZFB2OFZyYlFQQjlEVlloWXFXS1djSHVxNTBPZWVuYVh4YmZNUTQ3MFZFZXR6WlJhMXZpZTZNVnNxRDFuZVBFQlpiOTZWYVZnWmpLVXhibnNka0EwaFJvc1RHbGNMMXB5Q0xnWjZPcg=="
            local body = "grant_type=password&username=" .. userid .. "&password=" .. password

            params.headers = headers
            params.body = body

            url = "https://colgate.herokuapp.com/o/token/"

            network.request( url, "POST", handleResponse, params )
            timer.performWithDelay( 500, function()  network.request( url, "POST", handleResponse, params )  
           -- print(variableRegistro["access_token"]) 
            if variableRegistro["access_token"] == nil then


            else
                 myData.token = variableRegistro["access_token"]

                 frmUsername:removeSelf()
                 frmPassword:removeSelf()
                 composer.gotoScene( "ruletaColgate", "crossFade", 500 )         
            end end )
        end  
       

    end
    local function btnRegistrar( event )
        
            frmUsername:removeSelf()
            frmPassword:removeSelf()
            composer.gotoScene( "registro", "slideRight", 500 )

        
    end


-- create button
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

    

     local btnRegistro = display.newText(group, "Si aun no estas registrado, registrate AQUI", display.contentCenterX, display.contentCenterY+ 240, font, 18)

    btnRegistro.anchorX=1
    btnRegistro.anchorX=0
    btnRegistro:setTextColor(0, 0, 0)
    btnRegistro.x=display.contentCenterX- btnRegistro.width/2
    btnRegistro:addEventListener("tap", btnRegistrar)
    
    group:insert(btnRegistro)
   
	 --Runtime:addEventListener("enterFrame", function() end)
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