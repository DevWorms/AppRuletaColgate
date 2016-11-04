local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local group = self.view
 
        local bloqueo = display.newImage(group,"Image/bloqueo.png",_H/2, _W/2)
end
 
-- Called immediately after scene has moved onscreen:
function scene:show( event )
	local group = self.view
	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)
        
end
 
-- Called when scene is about to move offscreen:
function scene:hide( event )
	local group = self.view
 
 	collectgarbage()
	-- INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	-- Remove listeners attached to the Runtime, timers, transitions, audio tracks
 
end
 
-- Called prior to the removal of scene's "view" (display group)
function scene:destroy( event )
	local group = self.view
        
        composer.hideOverlay()
 	collectgarbage()

	-- INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	-- Remove listeners attached to the Runtime, timers, transitions, audio tracks
 
end
 
---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene