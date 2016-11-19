
-- ----------------------------------------------------------------------------
-- SET GLOBAL VARIABLES
-- ----------------------------------------------------------------------------
 _W = display.viewableContentWidth
 _H = display.viewableContentHeight
 display.setStatusBar( display.HiddenStatusBar )

-- require controller module
local composer = require "composer"

local widget = require "widget"
--local loginScreen = require "login"
-- load first scene
composer.gotoScene( "registro", "fade", 400 )
-- ----------------------------------------------------------------------------
-- INCLUDE REQUIRED LIBRARIES
-- ---------------------------------------------------------------------------- 

