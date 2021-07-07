

Player = {}

function Player:load()
    self.x = 50
    self.y = love.graphics.getHeight() / 2
    self.width = 20
    self.height = 100
    self.speed = 300
    self.stamina = 50
    self.timer = 0
    self.skid = 0
end

function Player:update(dt)
    if self.stamina > 0 then
        if love.keyboard.isDown("return") then
            self.speed = 700
            self.stamina = self.stamina - 1
        else
            self.speed = 300
            if self.stamina < 50 then
                self.stamina = self.stamina + 0.50
            end
        end
    else
        self.speed = 200
        if self.timer > 5 then
            self.stamina = self.stamina + 1
        end
    end

    if self.stamina <= 0 then
        self.timer = self.timer + dt
    
    elseif self.stamina == 1 then
        self.timer = 0
    end

    if love.keyboard.isDown("w") then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
    end

    if self.y < 0 then
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end

function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.print(self.stamina, 100, 100)
end