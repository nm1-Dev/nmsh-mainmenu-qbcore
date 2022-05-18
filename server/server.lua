local QBCore = exports['nmsh-base']:GetCoreObject()
local cache = {}

QBCore.Functions.CreateCallback('nmsh-mainmenu:getPlayerName', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local nameofplayer

    local ped = QBCore.Functions.GetPlayer(source)

    nameofplayer = ped.PlayerData.charinfo.firstname .. ' ' .. ped.PlayerData.charinfo.lastname

    cb(nameofplayer)
end)

QBCore.Functions.CreateCallback('nmsh-mainmenu:getPhoneNumber', function(source, cb)
  local Player = QBCore.Functions.GetPlayer(source)
  local phonenumber

  phonenumber = Player.PlayerData.charinfo.phone

  cb(phonenumber)
end)

QBCore.Functions.CreateCallback('nmsh-mainmenu:getJob', function(source, cb)
  local Player = QBCore.Functions.GetPlayer(source)
  local job

  job = Player.PlayerData.job.name

  cb(job)
end)

QBCore.Functions.CreateCallback('nmsh-mainmenu:getCash', function(source, cb)
  local Player = QBCore.Functions.GetPlayer(source)
  local cash

  cash = Player.PlayerData.money['cash']

  cb(cash)
end)

QBCore.Functions.CreateCallback('nmsh-mainmenu:getBank', function(source, cb)
  local Player = QBCore.Functions.GetPlayer(source)
  local bank

  bank = Player.PlayerData.money['bank']

  cb(bank)
end)