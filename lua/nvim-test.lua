-- Define the plugin table
local my_plugin = {}

-- Function to change terminal text color to green
function my_plugin.change_color()
    -- ANSI escape code for green text
    local green_color_code = "\27[32m"
    io.write(green_color_code)
end

-- Function to reset terminal color back to normal
function my_plugin.reset_color()
    -- ANSI escape code to reset terminal color
    local reset_color_code = "\27[0m"
    io.write(reset_color_code)
end

return my_plugin
