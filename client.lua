------------------------------------------------------------------------
------------------------------------------------------------------------
--			DO NOT EDIT IF YOU DON'T KNOW WHAT YOU'RE DOING			  --
--     							 									  --
--	   For support join my discord: https://discord.gg/Z9Mxu72zZ6	  --
------------------------------------------------------------------------
------------------------------------------------------------------------

-- variables
local display = false
local pageNumber = 1
local MaxPages = 1

-- Key mapping
RegisterCommand('StateCodes', function()
    SetDisplay(not display)
    SendNUIMessage({
        page = "page" .. pageNumber
    })
end, false)
RegisterKeyMapping('StateCodes', 'State Codes | Open', 'keyboard', 'down')

RegisterCommand('StateCodesPreviousPage', function()
    if pageNumber == 1 then
        pageNumber = pageNumber + MaxPages - 1
        SendNUIMessage({
            page = "page" .. pageNumber
        })
    else
        pageNumber = pageNumber - 1
        SendNUIMessage({
            page = "page" .. pageNumber
        })
    end
end, false)
RegisterKeyMapping('StateCodesPreviousPage', 'State Codes | Previous page', 'keyboard', 'left')

RegisterCommand('StateCodesNextPage', function()
    if pageNumber == MaxPages then
        pageNumber = pageNumber - MaxPages + 1
        SendNUIMessage({
            page = "page" .. pageNumber
        })
    else
        pageNumber = pageNumber + 1
        SendNUIMessage({
            page = "page" .. pageNumber
        })
    end
end, false)
RegisterKeyMapping('+StateCodesNextPage', 'State Codes | Next page', 'keyboard', 'right')

-- Close when NUI callback is close.
RegisterNUICallback("close", function(data)
    SetDisplay(false)
end)

-- Functions
function SetDisplay(bool)
    display = bool
    SendNUIMessage({
        type = "open",
        status = bool
    })
end