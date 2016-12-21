local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local myData = require( "mydata" )

local socket = require("socket")
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

local image, text1, text2, text3, memTimer, variableRegistro
local frmNombre, frmApellido, frmCorreo, frmContrasena, frmContrasenaN

local function onNombre( event )
    if ( "began" == event.phase ) then
        -- This is the "keyboard appearing" event.
        -- In some cases you may want to adjust the interface while the keyboard is open.

    elseif ( "submitted" == event.phase ) then
        -- Automatically tab to password field if user clicks "Return" on virtual keyboard.
        native.setKeyboardFocus( frmApellido )
    end
end


local function onApellido( event )
    if ( "began" == event.phase ) then
        -- This is the "keyboard appearing" event.
        -- In some cases you may want to adjust the interface while the keyboard is open.

    elseif ( "submitted" == event.phase ) then
        -- Automatically tab to password field if user clicks "Return" on virtual keyboard.
        native.setKeyboardFocus( frmCorreo )
    end
end

local function onCorreo( event )
    if ( "began" == event.phase ) then
        -- This is the "keyboard appearing" event.
        -- In some cases you may want to adjust the interface while the keyboard is open.

    elseif ( "submitted" == event.phase ) then
        -- Automatically tab to password field if user clicks "Return" on virtual keyboard.
        native.setKeyboardFocus( frmContrasena )
    end
end

local function onContrasena( event )
    if ( "began" == event.phase ) then
        -- This is the "keyboard appearing" event.
        -- In some cases you may want to adjust the interface while the keyboard is open.

    elseif ( "submitted" == event.phase ) then
        -- Automatically tab to password field if user clicks "Return" on virtual keyboard.
        native.setKeyboardFocus( frmContrasenaN )
    end
end

local function onContrasenaN( event )
    -- Hide keyboard when the user clicks "Return" in this field
    if ( "submitted" == event.phase ) then
        native.setKeyboardFocus( nil )
    end
end



--  INICIAR VARIABLES PARA CONVERTIR EL STRING EN JSON
local json = require( "json" )
local function handleResponse( event )
    if not event.isError then
        local response = json.decode( event.response )
        print( event.response )
    else
        print( "Error" )
    end
    return
end

-- Touch event listener for background image

function linkTerminos( event )
    system.openURL( "http://apptrespasitos.com/" )
end 


-- Called when the scene's view does not exist:
function scene:create( event )
    local sceneGroup = self.view

        ------------  SE DEBEN INICIAR LOS VALORES PARA CREAR LA VARIABLE "REGISTRO"  --------------------------------------      

    url_Consulta =  "https://colgate.herokuapp.com/api/v1/users/"
    local params = {}

    local headers = {}
        
    local body = "email=0&first_name=0&last_name=0&password=0&birthdate=0"
    headers["Content-Type"] = "application/x-www-form-urlencoded"

    params.headers = headers
    params.body = body

    network.request( url_Consulta, "POST", handleResponse, params )

    ---------------------------------------------------------------------------------------------

	local background = display.newRect(0, 0, _W, _H)
    background.x = display.contentWidth / 2
    background.y = display.contentHeight / 2
    background:setFillColor( 255 )
    background:setStrokeColor( 255, 255, 255 )
    
    sceneGroup:insert(background)

     local fondoPunteado= display.newImage("Image/fondoCel.png")
    fondoPunteado.x= display.contentWidth / 2
    fondoPunteado.y=display.contentHeight/2
  
    sceneGroup:insert( fondoPunteado )

    local labelTitulo = display.newText(sceneGroup, "REGISTRO", 0, 0, font, 25)
    labelTitulo:setTextColor(0, 0, 0)
    labelTitulo.anchorX=1
    labelTitulo.anchorX=0
    labelTitulo.x = _W/2 - (labelTitulo.width /2)
    labelTitulo.y = 50
    sceneGroup:insert(labelTitulo)

    local labelNombre = display.newText(sceneGroup, "Nombre", 0, 0, font, 25)
    labelNombre:setTextColor(0, 0, 0)
    labelNombre.anchorX=1
    labelNombre.anchorX=0
    labelNombre.x = _W/2 - (labelNombre.width /2)
    labelNombre.y = (_H/8)-50
    sceneGroup:insert(labelNombre)

    frmNombre = native.newTextField(0, 0, _W /2, 40)
    frmNombre.inputType = "default"
    frmNombre.font = native.newFont(font, 18)
    frmNombre.isEditable = true
    frmNombre.align = "center"
    frmNombre.anchorX=1
    frmNombre.anchorX=0
    frmNombre.x = _W * 0.5 - (frmNombre.width/2)
    frmNombre.y = (_H/8)
    frmNombre.text = ''
    frmNombre:addEventListener( "userInput", onNombre )
    sceneGroup:insert(frmNombre)

    local labelApellido = display.newText(sceneGroup, "Apellido", 0, 0, font, 25)
    labelApellido:setTextColor(0, 0, 0)
    labelApellido.anchorX=1
    labelApellido.anchorX=0
    labelApellido.x = _W/2 - (labelApellido.width /2)
    labelApellido.y = (_H/8)*1.4
    sceneGroup:insert(labelApellido)

    frmApellido = native.newTextField(0, 0, _W /2, 40)
    frmApellido.inputType = "default"
    frmApellido.font = native.newFont(font, 18)
    frmApellido.isEditable = true
    frmApellido.align = "center"
    frmApellido.anchorX=1
    frmApellido.anchorX=0
    frmApellido.x = _W * 0.5 - (frmApellido.width/2)
    frmApellido.y = (_H/8)*1.8
    frmApellido.text = ''
    frmApellido:addEventListener( "userInput", onApellido )
    
    sceneGroup:insert(frmApellido)

    local labelCorreo = display.newText(sceneGroup, "Email", 0, 0, font, 25)
    labelCorreo:setTextColor(0, 0, 0)
    labelCorreo.anchorX=1
    labelCorreo.anchorX=0
    labelCorreo.x = _W/2 - (labelCorreo.width /2)
    labelCorreo.y = (_H/8)*2.2
    sceneGroup:insert(labelCorreo)

    frmCorreo = native.newTextField(0, 0, _W /2, 40)
    frmCorreo.inputType = "default"
    frmCorreo.font = native.newFont(font, 18)
    frmCorreo.isEditable = true
    frmCorreo.align = "center"
    frmCorreo.anchorX=1
    frmCorreo.anchorX=0
    frmCorreo.x = _W * 0.5 - (frmCorreo.width/2)
    frmCorreo.y = (_H/8)*2.6
    frmCorreo.text = ''
    frmCorreo:addEventListener( "userInput", onCorreo )
    
    sceneGroup:insert(frmCorreo)

    local labelContrasena = display.newText(sceneGroup, "Contraseña", 0, 0, font, 25)
    labelContrasena:setTextColor(0, 0, 0)
    labelContrasena.anchorX=1
    labelContrasena.anchorX=0
    labelContrasena.x = _W/2 - (labelContrasena.width /2)
    labelContrasena.y = (_H/8)*3
    sceneGroup:insert(labelContrasena)

    frmContrasena = native.newTextField(0, 0, _W /2, 40)
    frmContrasena.inputType = "default"
    frmContrasena.font = native.newFont(font, 18)
    frmContrasena.isEditable = true
    frmContrasena.isSecure = true
    frmContrasena.align = "center"
    frmContrasena.anchorX=1
    frmContrasena.anchorX=0
    frmContrasena.x = _W * 0.5 - (frmContrasena.width/2)
    frmContrasena.y = (_H/8)*3.4
    frmContrasena.text = ''
    frmContrasena:addEventListener( "userInput", onContrasena )
    
    sceneGroup:insert(frmContrasena)

    local labelContrasenaN = display.newText(sceneGroup, "Confirma Contraseña", 0, 0, font, 25)
    labelContrasenaN:setTextColor(0, 0, 0)
    labelContrasenaN.anchorX=1
    labelContrasenaN.anchorX=0
    labelContrasenaN.x = _W/2 - (labelContrasenaN.width /2)
    labelContrasenaN.y = (_H/8)*3.8
    sceneGroup:insert(labelContrasenaN)

    frmContrasenaN = native.newTextField(0, 0, _W /2, 40)
    frmContrasenaN.inputType = "default"
    frmContrasenaN.font = native.newFont(font, 18)
    frmContrasenaN.isEditable = true
    frmContrasenaN.isSecure = true
    frmContrasenaN.align = "center"
    frmContrasenaN.anchorX=1
    frmContrasenaN.anchorX=0
    frmContrasenaN.x = _W * 0.5 - (frmContrasenaN.width/2)
    frmContrasenaN.y = (_H/8)*4.2
    frmContrasenaN.text = ''
    frmContrasenaN:addEventListener( "userInput", onContrasenaN )
    
    sceneGroup:insert(frmContrasenaN)

    
    local labelFechaNac = display.newText(sceneGroup, "Fecha de Nacimiento", 0, 0, font, 25)
    labelFechaNac:setTextColor(0, 0, 0)
    labelFechaNac.anchorX=1
    labelFechaNac.anchorX=0
    labelFechaNac.x = _W/2 - (labelFechaNac.width /2)
    labelFechaNac.y = (_H/8)*4.6
    sceneGroup:insert(labelFechaNac)

    
    -----------------------------------------------------
    -- Create two tables to hold data for days and years      
    local days = {}
    local years = {}

    -- Populate the "days" table
    for d = 1, 31 do
        days[d] = d
    end

    -- Populate the "years" table
    for y = 1, 48 do
        years[y] = 1969 + y
    end

    -- Configure the picker wheel columns
    local columnData = 
    {
        -- Months
        { 
            align = "left",
            width = 140,
            startIndex = 11,
           -- labels = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" }
            labels = { "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" }
        },
        -- Days
        {
            align = "center",
            width = 60,
            startIndex = 18,
            labels = days
        },
        -- Years
        {
            align = "center",
            width = 80,
            startIndex = 20,
            labels = years
        }
    }

    -- Create the widget
    local pickerWheel = widget.newPickerWheel(
        {

            top = display.contentHeight - 222,
            columns = columnData
        }
    )

    pickerWheel.x= _W/2
    pickerWheel.y=(_H/8)*5.6

    sceneGroup:insert(pickerWheel)
    -- Get the table of current values for all columns
    -- This can be performed on a button tap, timer execution, or other event
    local values = pickerWheel:getValues()

    -- Get the value for each column in the wheel (by column index)
    local currentMonth = values[1].value
    local currentDay = values[2].value
    local currentYear = values[3].value
    
    
    local currentMonth = "04"
    local currentDay = "05"
    local currentYear = "1994"
    

    local labelTerminos = display.newText(sceneGroup, "Acepto Términos y Condiciones (link)", 0, 0, native.systemFontBold, 25)
    labelTerminos.id = "terminos"
    labelTerminos:setTextColor(0, 0, 0)
    labelTerminos.anchorX=1
    labelTerminos.anchorX=0
    labelTerminos.x = _W/6.5
    labelTerminos.y = (_H/8)*6.6
    sceneGroup:insert(labelTerminos)
    labelTerminos:addEventListener("tap", linkTerminos)

    -- El switch de Términos y Condiciones
    local function onSwitchPress( event )
        local switch = event.target
        print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
    end

    -- Create the widget
    local checkboxButton = widget.newSwitch(
        {
            style = "checkbox",
            id = "Checkbox"
        }
    )
    sceneGroup:insert(checkboxButton)

    checkboxButton.x= _W/9
    checkboxButton.y=(_H/8)*6.6

-------------------------------------------


local btnPresslog = function( event )
    
                local test = socket.tcp()
                test:settimeout(1000)                   -- Set timeout to 1 second
                            
                local testResult = test:connect("www.google.com", 80)        -- Note that the test does not work if we put http:// in front
                 
                if not(testResult == nil) then
                    print("Internet access is available")
                    local switch = checkboxButton

                    --  OBTENER DATOS DEL FORMULARIO
                    local nombre = frmNombre.text
                    local apellido = frmApellido.text
                    local correo = frmCorreo.text
                    local contrasena = frmContrasena.text


                    birth = currentYear .. "-" .. currentMonth .. "-" .. currentDay

                    --  VALIDAR LLENADO DE CAMPOS
                    if nombre == "" then
                        local alert = native.showAlert( "Atención", "Ingresa tu nombre", {"OK"})
                    elseif apellido == "" then
                        local alert = native.showAlert( "Atención", "Ingresa tu apellido", {"OK"})
                    elseif correo == "" then
                        local alert = native.showAlert( "Atención", "Ingresa tu correo", {"OK"})
                    elseif contrasena == "" then
                        local alert = native.showAlert( "Atención", "Ingresa tu contrasena", {"OK"})
                    elseif contrasena == "" then
                        local alert = native.showAlert( "Atención", "Ingresa tu contrasena", {"OK"})
                    elseif contrasena ~= frmContrasenaN.text then
                        local alert = native.showAlert( "Atención", "Las contraseñas no coinciden", {"OK"})
                    elseif tostring(switch.isOn) == "false" then
                        local alert = native.showAlert( "Atención", "Debes aceptar los términos y Condiciones", {"OK"})


                    --  SI TODO ESTÁ BIEN, ENVIAR PARÁMETROS AL SERVIDOR Y CONTINUAR      
                    else
                        url_Consulta =  "https://colgate.herokuapp.com/api/v1/users/"
                        local params = {
                            body = "email=" .. correo .. "&first_name=" .. nombre .. "&last_name=" .. apellido .. "&password=" .. contrasena .. "&birthdate=" .. birth
                        };

                        network.request( url_Consulta, "POST", handleResponse, params )

                        myData.registro_mail = correo
                        myData.registro_pass = contrasena
                        
                        
                         frmContrasena:removeSelf()
                         frmCorreo:removeSelf()
                         frmNombre:removeSelf()
                         frmApellido:removeSelf()
                         frmContrasenaN:removeSelf()   
                         composer.gotoScene( "graciasRegistro", "slideUp", 500 )  
                    end
                                    
                else
                    local alert = native.showAlert( "Error de validación", "Revisa tu conexión de internet", { "OK" } )
                end
                            
                test:close()
                test = nil
                

    
   
 end


    local btnComenzar = widget.newButton({
        id = "registrar button",
        --label = "REGISTRAR",
        emboss = false,
        defaultFile = "Image/btnRegistro.png",
        overFile = "Image/btnRegistro.png",

        -- Properties for a rounded rectangle button
        --shape = "roundedRect",
        --width = 200,
        --height = 40,
        --cornerRadius = 2,
        --fillColor = { default={1,1,1,1}, over={1,0.1,0.7,0.4} },
        --strokeColor = { default={2,1,4,1}, over={0.8,0.8,1,1} },
        --strokeWidth = 4,
        onPress = btnPresslog     
        })
    btnComenzar.x = display.contentCenterX
    btnComenzar.y = (_H/8)*7.3
-- add button to login screen
sceneGroup:insert(btnComenzar)
	
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