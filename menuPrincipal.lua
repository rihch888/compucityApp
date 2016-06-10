local composer = require( "composer" )
local widget = require( "widget" )
local parse = require( "mod_parse" )
local scene = composer.newScene()
parse:init({ 
  appId = "R8EgKGegXDqZd1CMxhELz00lChtTVLYQUP796lrl", 
  apiKey = "oNLCLB6VcBrxDoIaYHcNQ8iK7JUywMKc0yJSzHo7"
})

---------------------------------------------------------------------------------
function scene:create( event )
    local screenGroup = self.view
    centrox = display.contentCenterX
    centroy = display.contentCenterY
    local fondo = nil
    local textoOpcion = nil 

    local function fixedColor( col )
        for i = 1, math.min( #col, 3 ) do
            col[ i ] = col[ i ] / 255
        end
    end
    mycol = { 255, 240, 1, 1 }
    fixedColor( mycol )
    local myRectangle = display.newRect( centrox, centroy, display.contentWidth, display.contentHeight )
    myRectangle:setFillColor( unpack(mycol) )
    screenGroup:insert( myRectangle )
    local imagen = display.newImageRect("logo.png", 290, 90)
    imagen.x = centrox
    imagen.y = 140
    screenGroup:insert( imagen )

    local function entra( event )
        if ( "ended" == event.phase ) then
            composer.gotoScene( "login" )
        end
    end

    local entrar = widget.newButton
    {
        left = 50,
        top = 300,
        id = "button1",
        label = "Iniciar sesión",
        onEvent = entra,
        shape="roundedRect",
        width = 220,
        height = 50,
        cornerRadius = 3,
        fillColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
        labelColor = { default={ 1, 1, 1 }, over={ 1, 1, 1, 0.5 } },
        font = native.systemFontBold
    }
    screenGroup:insert( entrar )

    local function registro( event )
        if ( "ended" == event.phase ) then
            composer.gotoScene("registro")
        end
    end
    
    local registrar = widget.newButton
    {
        left = 50,
        top = 360,
        id = "button1",
        label = "Registrar",
        onEvent = registro,
        shape="roundedRect",
        width = 220,
        height = 50,
        cornerRadius = 3,
        fillColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
        labelColor = { default={ 1, 1, 1 }, over={ 1, 1, 1, 0.5 } },
        font = native.systemFontBold
    }
    screenGroup:insert( registrar )

    local function productos( event )
        if ( "ended" == event.phase ) then
            composer.gotoScene("verProductos")
        end
    end
    
    local produ = widget.newButton
    {
        left = 50,
        top = 420,
        id = "button1",
        label = "Ver Productos",
        onEvent = productos,
        shape="roundedRect",
        width = 220,
        height = 50,
        cornerRadius = 3,
        fillColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
        labelColor = { default={ 1, 1, 1 }, over={ 1, 1, 1, 0.5 } },
        font = native.systemFontBold
    }
    screenGroup:insert( produ )

end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Example: start timers, begin animation, play audio, etc.
        
    end
end

function scene:hide( event )
     local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end
end


function scene:destroy( event )
    local sceneGroup = self.view
    background:removeSelf()
    background=nil
    myText:removeSelf()
    myText=nil
    logo:removeSelf()
    logo=nil
    imagen:removeSelf()
    imagen=nil
    conf:removeSelf()
    conf=nil
    help:removeSelf()
    help=nil
    entrar:removeSelf()
    entrar=nil
    registrar:removeSelf()
    registrar=nil
    email:removeSelf()
    email = nil
    pass:removeSelf()
    pass=nil
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene