local menu = {}

function menu:enter(previous)
end

function menu:mousereleased(x, y, button, isTouch)
    -- If one of the three buttons are pressed, the number of mines is
    -- determined and the state changes to firstmove.
    if button ~= 1 then return end
    for option, menuButton in pairs(buttons) do
        if menuButton:isClicked(x, y) then
            if option == "easy" then mines_percentage = 11
            elseif option == "medium" then mines_percentage = 17
            elseif option == "hard" then mines_percentage = 23 end
            total_mines = math.ceil(mines_percentage / 100 * NUM_COLS * NUM_ROWS)

            difficulty = option

            buttons.easy = nil
            buttons.hard = nil

            Gamestate.switch(states.preGame)
            -- state = "firstmove"
        end
    end
end

function menu:draw()
    love.graphics.setColor(255,255,255)
    for option, button in pairs(buttons) do
        button:draw()
    end
end
return menu