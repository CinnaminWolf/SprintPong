do
    local buttonPrototype = {
        posX = 20,
        posY = 10
    }
    
    function buttonPrototype.draw()
        print("hi")
    end
    
    local buttonMetatable = {}
    buttonMetatable.__index = buttonPrototype
    
    
    function newButton(button)
        button = button or {}
        setmetatable(button,buttonMetatable)
        return button
    end
end


do
    local imageButtonPrototype = newButton{
        width = 100
    }
    
    local oldDraw = imageButtonPrototype.draw
    function imageButtonPrototype.draw()
        oldDraw()
        print("hi2")
    end
    
    local imageButtonMetatable = {}
    imageButtonMetatable.__index = imageButtonPrototype
    
    function newImageButton(imageButton)
        imageButton = imageButton or {}
        setmetatable(imageButton,imageButtonMetatable)
        return imageButton
    end
end

local imageButton = newImageButton()
imageButton.draw()