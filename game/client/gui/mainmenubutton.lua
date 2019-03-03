--=========== Copyright © 2018, Planimeter, All rights reserved. ===========--
--
-- Purpose: Main Menu Button class
--
--==========================================================================--

class "gui.mainmenubutton" ( "gui.button" )

local mainmenubutton = gui.mainmenubutton

function mainmenubutton:mainmenubutton( parent, text )
	local name  = text and text or "Blank" .. " Button"
	gui.button.button( self, parent, name, text or "" )
	self:setBorderWidth( 0 )

	local font  = self:getScheme( "mainmenuFont" )
	self.text   = gui.text( self, name .. " Text Node", text or "" )
	self.text:setFont( font )

	self.height = font:getHeight()
end

function mainmenubutton:draw()
	local textColor = "mainmenubutton.dark.textColor"
	if ( self:isDisabled() ) then
		textColor = "mainmenubutton.dark.disabled.textColor"
	elseif ( self.mousedown and ( self.mouseover or self:isChildMousedOver() ) ) then
		textColor = "mainmenubutton.dark.mousedown.textColor"
	elseif ( self.mousedown or ( self.mouseover or self:isChildMousedOver() ) or self.focus ) then
		textColor = "mainmenubutton.dark.mouseover.textColor"
	end

	self.text:setColor( self:getScheme( textColor ) )

	gui.box.draw( self )
end
