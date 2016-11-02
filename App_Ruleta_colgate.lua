
-- ----------------------------------------------------------------------------
-- INCLUDE REQUIRED LIBRARIES
-- ----------------------------------------------------------------------------

-- ----------------------------------------------------------------------------
-- INITIALIZE VALUES
-- ----------------------------------------------------------------------------
local font = "HelveticaNeue" or system.nativeFont
local userid = nil
local password = nil
local URL = nil
local widget = require( "widget" )
-- ----------------------------------------------------------------------------
-- SET BACKGROUND
-- ----------------------------------------------------------------------------
local background = display.newRect(0, 0, _W, _H)
background.x = display.contentWidth / 2
background.y = display.contentHeight / 2
background:setFillColor( 0.5 )
background:setStrokeColor( 1, 0, 0 )


-- ----------------------------------------------------------------------------
-- CREATE LOGIN SCREEN
-- ----------------------------------------------------------------------------
local loginScreen = display.newGroup()
loginScreen:insert(background)

-- ----------------------------------------------------------------------------
-- CREATE LABELS
-- ----------------------------------------------------------------------------


local labelUsername = display.newText(loginScreen, "Email", 0, 0, font, 20)

labelUsername:setTextColor(180, 180, 180)
labelUsername.anchorX=1
labelUsername.anchorX=0
labelUsername.x = _W * 0.5 - 140
labelUsername.y = (_H/2)-220
loginScreen:insert(labelUsername)

local labelPassword = display.newText(loginScreen, "Contraseña", 0, 0, font, 20)

labelPassword.anchorX=1
labelPassword.anchorX=0
labelPassword:setTextColor(180, 180, 180)
labelPassword.x = _W * 0.5 - 140

labelPassword.y = (_H/2)-145
loginScreen:insert(labelPassword)

local labelReturnStatus = display.newText(loginScreen, "", 0, 0, font, 14)

labelReturnStatus.anchorX=1
labelReturnStatus.anchorX=0
labelReturnStatus.x = _W * 0.5 - 140
labelReturnStatus.y = 310
loginScreen:insert(labelReturnStatus)

-- ----------------------------------------------------------------------------
-- CREATE USERNAME TEXT FIELD - ADD TO LOGIN FORM
-- ----------------------------------------------------------------------------
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
loginScreen:insert(frmUsername)

-- handle field events
function frmUsername:userInput(event)
    if(event.phase == "began") then
        -- you could implement tweening of object to get out of the way of the keyboard here
        print("Began frmUsername" .. ' ' .. event.target.text)
        event.target.text = ''
    elseif(event.phase == "editing") then
        -- fired with each new character
        print("Editing frmUsername" .. ' ' .. event.target.text)
    elseif(event.phase == "ended") then
        -- fired when the field looses focus as a result of some other object being interacted with
        print("Ended frmUsername" .. ' ' .. event.target.text)
    elseif(event.phase == "submitted") then
        -- you could implement tweening of objects to their original postion here
        print("Submitted frmUsername" .. ' ' .. event.target.text)        
    end
end
frmUsername:addEventListener("userInput",frmUsername)

-- ----------------------------------------------------------------------------
-- CREATE PASSWORD TEXT FIELD - ADD TO LOGIN FORM
-- ----------------------------------------------------------------------------
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
loginScreen:insert(frmPassword)

-- handle field events
function frmPassword:userInput(event)
    if(event.phase == "began") then
        -- you could implement tweening of object to get out of the way of the keyboard here
        print("Began Password" .. ' ' .. event.target.text)
        event.target.text = ''
    elseif(event.phase == "editing") then
        -- fired with each new character
        print("Editing Password" .. ' ' .. event.target.text)
    elseif(event.phase == "ended") then
        -- fired when the field looses focus as a result of some other object being interacted with
        print("Ended Password" .. ' ' .. event.target.text)
    elseif(event.phase == "submitted") then
        -- you could implement tweening of objects to their original postion here
        print("Submitted Password" .. ' ' .. event.target.text)        
    end
end
frmPassword:addEventListener("userInput",frmPassword)


-- ----------------------------------------------------------------------------
-- HANDLE JSON RETURN VALUES - DISPLAY IN STATUS LABEL
-- ----------------------------------------------------------------------------
local function loginCallback(event)
    
    -- print("inside loginCallback function")
    
    if ( event.isError ) then
        print( "Network error!");
    else
        print ( "RESPONSE: " .. event.response )
        local data = json.decode(event.response)
        
        -- do with data what you want...
        if data.result == 200 then
            -- player logged in okay
            print("Welcome back",data.firstname:gsub("^%l", string.upper))
            labelReturnStatus.text = "Welcome back "..data.firstname:gsub("^%l", string.upper)
            

            -- CHANGE SCENES OR DO SOMTHING ELSE HERE

        else
            -- prompt them to login again
            print("Please try again")
            labelReturnStatus.text = "Please try again"
            
        end
    end
    
    return true;
end

-- ----------------------------------------------------------------------------
-- MAKE KEYBOARD GO AWAY ON BACKGROUND TAP
-- ----------------------------------------------------------------------------
function background:tap(event)
    native.setKeyboardFocus(nil)
end
background:addEventListener("tap",background)

-- ----------------------------------------------------------------------------
-- HANDLE BUTTON PRESS
-- ----------------------------------------------------------------------------
local function btnOnPressHandler(event)    
    local userid = frmUsername.text
    local password = frmPassword.text 

    print(userid)
    print(password)
    
    -- stop if fields are blank
    if(userid == '' or password == '') then
        labelReturnStatus.text = 'A username or password is required.'
        return
    end   

   --local URL = "http://opensourcemarketer.com/json.php?userid=" .. mime.b64(userid) .. "&password=" .. mime.b64(password);
    
    -- debug
--print(URL)
    
   --call callback function
   --network.request( URL, "GET", loginCallback )
end
local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
    end
end
local function onRelease(event)    
    
end
-- handle onDrag
local function btnOnDragHandler(event)
    -- do something
end

-- handle onRelease
local function btnOnReleaseHandler(event)
    -- do something
end

-- create button
local btnLogin = widget.newButton({
		id = "Login Button",
	    label = "Comenzar a jugar",
        onEvent = handleButtonEvent,
        emboss = false,
        -- Properties for a rounded rectangle button
        shape = "roundedRect",
        width = 200,
        height = 40,
        cornerRadius = 2,
        fillColor = { default={1,1,1,1}, over={1,0.1,0.7,0.4} },
        strokeColor = { default={2,1,4,1}, over={0.8,0.8,1,1} },
        strokeWidth = 4,
	    onPress = btnOnPressHandler,
	    onDrag = btnOnDragHandler,
	    onRelease = btnOnReleaseHandler
   		})
	btnLogin.x = display.contentCenterX
	btnLogin.y = display.contentCenterY
-- add button to login screen
loginScreen:insert(btnLogin)
local btnRegistro = widget.newButton({
		id = "Login Registro",
	    label = "Si aun no estas registrado, registrate AQUI",
        onEvent = handleButtonEvent,
        emboss = false,
        -- Properties for a rounded rectangle button
        onEvent = handleButtonEvent

   		})
	btnRegistro.x = display.contentCenterX
	btnRegistro.y = display.contentCenterY+100
-- add button to login screen
loginScreen:insert(btnRegistro)

-- ----------------------------------------------------------------------------
-- END OF LOGIN SCREEN
-- ----------------------------------------------------------------------------

