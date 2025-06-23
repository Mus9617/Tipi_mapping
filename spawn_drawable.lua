local drawableName = "drawable" 

local spawnedDrawable = nil

RegisterCommand("spawn_tipi", function()
    if spawnedDrawable then
        print("Ya tienes un tipi spawneado, usa /delete_tipi para borrarlo primero.")
        return
    end

    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    local forwardVector = GetEntityForwardVector(playerPed)

    local spawnPos = vector3(
        playerPos.x + forwardVector.x * 2.0,
        playerPos.y + forwardVector.y * 2.0,
        playerPos.z
    )

    RequestModel(drawableName)
    while not HasModelLoaded(drawableName) do
        Wait(100)
    end

    spawnedDrawable = CreateObject(drawableName, spawnPos.x, spawnPos.y, spawnPos.z, true, true, true)

    SetModelAsNoLongerNeeded(drawableName)

    print("Tipi spawnado.")
end, false)

RegisterCommand("delete_tipi", function()
    if spawnedDrawable and DoesEntityExist(spawnedDrawable) then
        DeleteObject(spawnedDrawable)
        spawnedDrawable = nil
        print("Tipi borrado.")
    else
        print("No hay tipi spawneado.")
    end
end, false)
