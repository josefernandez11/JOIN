
---------------- CONFIG ----------------
-- WEBHOOKS
local WEBHOOK_10M = "https://discord.com/api/webhooks/1486898527979176078/l0yYukaA74r3abQqjmEr5mZd7D5L64b4zC5Zt_OLPbuGj1pabuanntEAGveeXpSA3bSz"
local WEBHOOK_SHOWCASE = "AQUI2"

-- MINIMOS
local MIN_PRODUCTION_10M = 10_000_000

-- PINGS
local PING_HERE_AT = 100_000_000

local SCAN_DELAY = 0.1


--------------------------------------

local HttpService = game:GetService("HttpService")

local http_request =
    (request) or
    (http and http.request) or
    (syn and syn.request)

if not http_request then return end

--------------------------------------------------
-- IMÁGENES DE BRAINROTS
--------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
--------------------------------------------------
-- IMÁGENES DE BRAINROTS (COMPLETO)
--------------------------------------------------
local BRAINROT_IMAGES = {

-- A
["Arcadopus"] = "https://www.lolga.com/uploads/images/goods/steal-a-brainrot/all-server-arcadopus.png",
["Mi Gatito"] = "https://static.wikia.nocookie.net/stealabr/images/5/50/AyMiGatito.png",

-- B
["Bacuru and Egguru"] = "https://static.wikia.nocookie.net/stealabr/images/b/b5/Bacuru_and_Egguru.png",
["Brunito Marsito"] = "https://static.wikia.nocookie.net/stealabr/images/6/60/Brunito_Marsito_byLuiko.png",
["Burrito Bandito"] = "https://static.wikia.nocookie.net/stealabr/images/e/e6/PoTaTo.png",
["Burguro And Fryuro"] = "https://static.wikia.nocookie.net/stealabr/images/6/65/Burguro-And-Fryuro.png",

-- C
["Capitano Moby"] = "https://static.wikia.nocookie.net/stealabr/images/e/ef/Moby.png",
["Celularcini Viciosini"] = "https://media.discordapp.net/attachments/1452514638892634254/1459951125439713303/Celularcini_Viciosini.webp?format=png",
["Cerberus"] = "https://static.wikia.nocookie.net/stealabr/images/4/45/Cerberus.png",
["Chicleteira Bicicleteira"] = "https://static.wikia.nocookie.net/stealabr/images/5/5a/Chicleteira.png",
["Chicleteirina Bicicleteirina"] = "https://static.wikia.nocookie.net/stealabr/images/a/aa/Chicliterita_bicicliterita.png",
["Chicleteira Noelteira"] = "https://static.wikia.nocookie.net/stealabr/images/b/b3/Noel.png",
["Chill Puppy"] = "https://static.wikia.nocookie.net/stealabr/images/3/30/ChillPuppy.png",
["Chillin chili"] = "https://static.wikia.nocookie.net/stealabr/images/e/e0/Chilin.png",
["Chimnino"] = "https://static.wikia.nocookie.net/stealabr/images/c/c5/Chimnino.png",
["Chipso and Queso"] = "https://static.wikia.nocookie.net/stealabr/images/f/f8/Chipsoqueso.png",
["Cooki and Milki"] = "https://static.wikia.nocookie.net/stealabr/images/9/9b/Cooki_and_milki.png",
["Cupid Cupid Sahur"] = "https://static.wikia.nocookie.net/stealabr/images/8/89/Cupid_Cupid_Sahur.png",
["Cupid Hotspot"] = "https://static.wikia.nocookie.net/stealabr/images/1/1f/Pot_Cupid.png",
["Chicleteira Cupideira"] = "https://static.wikia.nocookie.net/stealabr/images/6/6f/Chicleteira_Cupideira.png",

-- D
["DonkeyTurbo Express"] = "https://static.wikia.nocookie.net/stealabr/images/9/9a/DonkeyturboExpress.png",
["Dragon Cannelloni"] = "https://static.wikia.nocookie.net/stealabr/images/3/31/Nah_uh.png",
["Dragon Gingerini"] = "https://static.wikia.nocookie.net/stealabr/images/3/3a/DragonGingerini.png",

-- E
["Esok Sekolah"] = "https://static.wikia.nocookie.net/stealabr/images/2/2a/EsokSekolah2.png",
["Eviledon"] = "https://static.wikia.nocookie.net/stealabr/images/7/78/Eviledonn.png",

-- F
["Festive 67"] = "https://static.wikia.nocookie.net/stealabr/images/c/c8/TransparentFestive67.png",
["67"] = "https://static.wikia.nocookie.net/stealabr/images/8/83/BOIIIIIII_SIX_SEVEN_%F0%9F%98%82%F0%9F%98%82%F0%9F%98%82%F0%9F%98%82%F0%9F%98%82%F0%9F%98%82%F0%9F%98%82%F0%9F%98%82%F0%9F%98%82%F0%9F%98%82.png",
["Fishino Clownino"] = "https://static.wikia.nocookie.net/stealabr/images/d/d6/Fishino_Clownino.png",
["Fragrama and Chocrama"] = "https://static.wikia.nocookie.net/stealabr/images/9/9a/Fragrama_and_Chocrama.png",

-- G
["Garama and Madundung"] = "https://static.wikia.nocookie.net/stealabr/images/e/ee/Garamadundung.png",
["Ginger Gerat"] = "https://static.wikia.nocookie.net/stealabr/images/8/85/GingerGerat.png",
["Gobblino Uniciclino"] = "https://static.wikia.nocookie.net/stealabr/images/c/c5/Gobblino_Uniciclino.png",
["Guest 666"] = "https://static.wikia.nocookie.net/stealabr/images/9/99/Guest666t.png",

-- H
["Headless Horseman"] = "https://static.wikia.nocookie.net/stealabr/images/f/ff/Headlesshorseman.png",
["Hydra Dragon Cannelloni"] = "https://static.wikia.nocookie.net/stealabr/images/e/ee/Hydra_Dragon_Cannelloni.png",

-- J
["Jolly jolly Sahur"] = "https://static.wikia.nocookie.net/stealabr/images/f/f1/JollyJollySahur.png",

-- K
["Ketupat Bros"] = "https://static.wikia.nocookie.net/stealabr/images/4/4d/Ketupat_Bros.png",
["Ketupat Kepat"] = "https://static.wikia.nocookie.net/stealabr/images/a/ac/KetupatKepat.png",
["Ketchuru and Musturu"] = "https://static.wikia.nocookie.net/stealabr/images/1/14/Ketchuru.png",

-- L
["La Casa Boo"] = "https://static.wikia.nocookie.net/stealabr/images/d/de/Casa_Booo.png",
["La Extinct Grande"] = "https://static.wikia.nocookie.net/stealabr/images/c/cd/La_Extinct_Grande.png",
["La Ginger Sekolah"] = "https://static.wikia.nocookie.net/stealabr/images/1/14/Esok_Ginger.png",
["La Grande Combinasion"] = "https://static.wikia.nocookie.net/stealabr/images/d/d8/Carti.png",
["La Jolly Grande"] = "https://static.wikia.nocookie.net/stealabr/images/5/5f/La_Chrismas_Grande.png",
["La Secret Combinasion"] = "https://static.wikia.nocookie.net/stealabr/images/f/f2/Lasecretcombinasion.png",
["La Spooky Grande"] = "https://static.wikia.nocookie.net/stealabr/images/5/51/Spooky_Grande.png",
["La Supreme Combinasion"] = "https://static.wikia.nocookie.net/stealabr/images/5/52/SupremeCombinasion.png",
["La Taco Combinasion"] = "https://static.wikia.nocookie.net/stealabr/images/8/84/Latacocombi.png",
["Las Sis"] = "https://cdn.shopify.com/s/files/1/0837/8712/0919/files/Las_Sis_600x600.webp?v=1758288678",
["Lavadorito Spinito"] = "https://static.wikia.nocookie.net/stealabr/images/f/ff/Lavadorito_Spinito.png",
["Los 25"] = "https://static.wikia.nocookie.net/stealabr/images/9/9b/Transparent_Los_25.png",
["Los 67"] = "https://static.wikia.nocookie.net/stealabr/images/d/db/Los-67.png",
["Los Bros"] = "https://static.wikia.nocookie.net/stealabr/images/5/53/BROOOOOOOO.png",
["Los Burritos"] = "https://static.wikia.nocookie.net/stealabr/images/9/97/LosBurritos.png",
["Los Candies"] = "https://static.wikia.nocookie.net/stealabr/images/f/f9/Candy%21.png",
["Los Chicleteiras"] = "https://static.wikia.nocookie.net/stealabr/images/4/4d/Los_ditos.png",
["Los combinasionas"] = "https://static.wikia.nocookie.net/stealabr/images/3/36/Stop_taking_my_chips_im_just_a_baybeh.png",
["Los Hotspotsitos"] = "https://static.wikia.nocookie.net/stealabr/images/6/69/Loshotspotsitos.png",
["Los Jolly Combinasionas"] = "https://static.wikia.nocookie.net/stealabr/images/7/7b/Los_jollycombos.png",
["Los Mobilis"] = "https://static.wikia.nocookie.net/stealabr/images/2/27/Losmobil.png",
["Los nooo My Hotspotsitos"] = "https://cdn.salla.sa/jDznl/003869f6-f451-47df-a720-491c012bfe01-1000x1000-X33W5yduW5d98TIEmdHhWHYgFwI9KCVCrqSIdZaF.png",
["Los Planitos"] = "https://static.wikia.nocookie.net/stealabr/images/8/83/Los_Planitos.png",
["Los Primos"] = "https://static.wikia.nocookie.net/stealabr/images/9/96/LosPrimos.png",
["Los Quesadillas"] = "https://static.wikia.nocookie.net/stealabr/images/9/99/LosQuesadillas.png",
["Los Spaghettis"] = "https://static.wikitide.net/italianbrainrotwiki/c/cb/Los_spaggetis.webp",
["Los Spooky Combinasionas"] = "https://static.wikia.nocookie.net/stealabr/images/8/8a/Lospookycombi.png",
["Los Tacoritas"] = "https://static.wikia.nocookie.net/stealabr/images/4/40/My_kids_will_also_rob_you.png",
["Los Puggies"] = "https://static.wikia.nocookie.net/stealabr/images/c/c8/LosPuggies2.png",
["Los Mi Gatitos"] = "https://static.wikia.nocookie.net/stealabr/images/a/af/Los_ay_Gattitos.png",
["Lovin Rose"] = "https://static.wikia.nocookie.net/stealabr/images/a/ab/LovinRose.png",
["Love Love Bear"] = "https://static.wikia.nocookie.net/stealabr/images/b/bf/Love_Love_Bear.png",
["La Romantic Grande"] = "https://static.wikia.nocookie.net/stealabr/images/d/d2/LaRomanricGrande_LeakBySammy.png",

-- M
["Mariachi Corazoni"] = "https://static.wikia.nocookie.net/stealabr/images/5/5a/MariachiCora.png",
["Meowl"] = "https://static.wikia.nocookie.net/stealabr/images/b/b8/Clear_background_clear_meowl_image.png",
["Mieteteira Bicicleteira"] = "https://static.wikia.nocookie.net/stealabr/images/8/86/Mieteteira_Bicicleteira.png",
["Money Money Puggy"] = "https://static.wikia.nocookie.net/stealabr/images/0/09/Money_money_puggy.png",
["Money Money Reindeer"] = "https://static.wikia.nocookie.net/stealabr/images/e/ec/MoneyMoneyReindeer.png",

-- N
["Nuclearo Dinossauro"] = "https://static.wikia.nocookie.net/stealabr/images/c/c6/Nuclearo_Dinosauro.png",
["Noo my Candy"] = "https://static.wikia.nocookie.net/stealabr/images/1/12/Noo_my_candy_transparent.png",
["Noo my Present"] = "https://static.wikia.nocookie.net/stealabr/images/3/35/Noo_my_Present.png",
["Naughty Naughty"] = "https://static.wikia.nocookie.net/stealabr/images/1/13/Sought_the_naught.png",
["Noo my Heart"] = "https://static.wikia.nocookie.net/stealabr/images/7/75/NooMyLoveheart.png",


-- O
["Orcaledon"] = "https://static.wikia.nocookie.net/stealabr/images/a/a6/Orcaledon.png",

-- P
["Popcuru and Fizzuru"] = "https://static.wikia.nocookie.net/stealabr/images/a/a9/Popuru_and_Fizzuru.png",

-- Q
["Quesadilla Vampiro"] = "https://static.wikia.nocookie.net/stealabr/images/0/0e/VampiroQuesa.png", 
["Quesadilla Crocodila"] = "https://static.wikia.nocookie.net/stealabr/images/3/3f/QuesadillaCrocodilla.png",

-- R
["Rang Ring Bus"] = "https://static.wikia.nocookie.net/stealabr/images/2/2b/RingRangBus2.png",
["Reinito Sleighito"] = "https://static.wikia.nocookie.net/stealabr/images/2/27/Reinito.png",
["Rosetti Tualetti"] = "https://static.wikia.nocookie.net/stealabr/images/f/f8/Rossetti_Tualetti.png",
["Rosey and Teddy"] = "https://static.wikia.nocookie.net/stealabr/images/9/9b/Rosey_and_Teddy.png",

-- S
["Skibidi Toilet"] = "https://static.wikia.nocookie.net/stealabr/images/3/34/Skibidi_toilet.png",
["Spinny Hammy"] = "https://static.wikia.nocookie.net/stealabr/images/7/7d/SpinnyHammy.png",
["Spaghetti Tualetti"] = "https://static.wikia.nocookie.net/stealabr/images/b/b8/Spaghettitualetti.png",
["Spooky and Pumpky"] = "https://static.wikia.nocookie.net/stealabr/images/d/d6/Spookypumpky.png",
["Strawberry Elephant"] = "https://static.wikia.nocookie.net/stealabr/images/5/58/Strawberryelephant.png",
["Swag Soda"] = "https://static.wikia.nocookie.net/stealabr/images/9/9f/Swag_Soda.png",
["Swaggy Bros"] = "https://static.wikia.nocookie.net/stealabr/images/8/85/Swaggy_Bros.png",

-- T
["Tacorita Bicicleta"] = "https://static.wikia.nocookie.net/stealabr/images/0/0f/Gonna_rob_you_twin.png",
["Tang Tang Keletang"] = "https://static.wikia.nocookie.net/stealabr/images/c/ce/TangTangVfx.png",
["Tictac Sahur"] = "https://static.wikia.nocookie.net/stealabr/images/6/6f/Time_moving_slow.png",
["Tralaledon"] = "https://static.wikia.nocookie.net/stealabr/images/7/79/Brr_Brr_Patapem.png",
["Tuff Toucan"] = "https://static.wikia.nocookie.net/stealabr/images/3/3e/TuffToucan.png",

-- W
["W or L"] = "https://static.wikia.nocookie.net/stealabr/images/2/28/Win_Or_Lose.png",
}
-- local BRAINROT_IMAGES = { ... }
-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
--------------------------------------------------

--------------------------------------------------
-- NORMALIZAR NOMBRES (ANTI BUGS)
--------------------------------------------------
local function normalizeName(name)
    return name
        :lower()
        :gsub("^%s+", "")
        :gsub("%s+$", "")
        :gsub("%s+", " ")
end

local NORMALIZED_IMAGES = {}
for name, url in pairs(BRAINROT_IMAGES) do
    NORMALIZED_IMAGES[normalizeName(name)] = url
end

local function getBrainrotImage(name)
    return NORMALIZED_IMAGES[normalizeName(name)]
end

--------------------------------------------------
-- PRODUCCIÓN
--------------------------------------------------
local function parseProduction(text)
    local n, u = text:match("%$([%d%.]+)%s*([MBT])%s*/s")
    if not n then return end
    n = tonumber(n)
    if u == "M" then return n * 1e6 end
    if u == "B" then return n * 1e9 end
    if u == "T" then return n * 1e12 end
end

local function formatMoney(v)
    local s = tostring(math.floor(v))
    local formatted = s:reverse():gsub("(%d%d%d)", "%1,"):reverse()
    if formatted:sub(1,1) == "," then
        formatted = formatted:sub(2)
    end
    return "$" .. formatted .. "/s"
end

--------------------------------------------------
-- SCAN (FIX DEFINITIVO PARA x2, x4, x8...)
--------------------------------------------------
local function scan(minProduction)
    local list = {}

    for _,ui in ipairs(workspace:GetDescendants()) do
        if ui:IsA("TextLabel") then
            local value = parseProduction(ui.Text)
            if value and value >= minProduction then

                local parent = ui.Parent

                for _,c in ipairs(parent:GetChildren()) do
                    if c:IsA("TextLabel") and not c.Text:find("%$") then
                        table.insert(list, {
                            name = c.Text,
                            value = value
                        })
                        break
                    end
                end
            end
        end
    end

    return list
end

--------------------------------------------------
-- WEBHOOK
--------------------------------------------------

local notified10M = {}
local notifiedShowcase = {}

local function send(list, webhook, pingRole, lastHashRef)
    if #list == 0 then return end

    -- ordenar por el que más genera
    table.sort(list, function(a,b)
        return a.value > b.value
    end)

    local main = list[1]
    local hash =
    normalizeName(main.name)
    .. "|"
    .. tostring(math.floor(main.value))
    .. "|"
    .. game.JobId

    if not lastHashRef then lastHashRef = {} end
if lastHashRef[hash] then return end
lastHashRef[hash] = true

--------------------------------------------------
    -- AGRUPAR OTHER BRAINROTS (x2, x3, x4...)
--------------------------------------------------
    local grouped = {}

-- CONTAR brainrots por nombre
for i = 1, #list do
    local v = list[i]
    local key = v.name

    grouped[key] = grouped[key] or {
        name = v.name,
        value = v.value,
        count = 0
    }
    grouped[key].count += 1
end

local others = ""
local hasOthers = false

-- ordenar por valor (mayor a menor)
local ordered = {}
for _,v in pairs(grouped) do
    table.insert(ordered, v)
end

table.sort(ordered, function(a, b)
    return a.value > b.value
end)

-- construir texto FINAL (SIN LISTA)
for _,v in ipairs(ordered) do
    hasOthers = true

    others = others
        .. v.count .. "x " .. v.name .. "\n"
        .. "— " .. formatMoney(v.value) .. "\n"
end

    --------------------------------------------------
    -- JOIN INFO
--------------------------------------------------
    local jobId = game.JobId
    local placeId = game.PlaceId

    local joinLink =
        "https://chillihub1.github.io/chillihub-joiner/?placeId="
        .. placeId ..
        "&gameInstanceId=" .. jobId

--------------------------------------------------
-- EMBED
--------------------------------------------------
local embed = {
    title = "💎 **" .. main.name .. "**",
    color = 2829618,
    description = "**— " .. formatMoney(main.value) .. "**\n\n",
    footer = {
        text = "L Hub"
    },
   
}


-- Producción

embed.description = "**(" .. formatMoney(main.value) .. ")**\n\n"

--------------------------------------------------
-- SERVER ID
--------------------------------------------------
embed.description = embed.description ..
    "**Join Server ID**\n```" .. jobId .. "```\n"

--------------------------------------------------
-- JOIN SERVER
--------------------------------------------------
embed.description = embed.description ..
    "**Join Server**\n[**CLICK TO JOIN**](" .. joinLink .. ")\n\n"

--------------------------------------------------
-- OTHER BRAINROTS
--------------------------------------------------
if hasOthers then
    embed.description = embed.description ..
        "**🌟 Otros Brainrots Detectados**\n```" .. others .. "```\n\n"
end

--------------------------------------------------
-- THUMBNAIL
--------------------------------------------------
local img = getBrainrotImage(main.name)
if img then
    embed.thumbnail = { url = img }
end

--------------------------------------------------
-- ENVIAR WEBHOOK (CON O SIN PING)
--------------------------------------------------
local content = nil

-- enviar a la webhook principal
http_request({
    Url = webhook,
    Method = "POST",
    Headers = { ["Content-Type"] = "application/json" },
    Body = HttpService:JSONEncode({
        content = content,
        embeds = { embed }
    })
})

-- 🔥 SHOWCASE (COPIA DE LA 10M)
if webhook == WEBHOOK_10M then
    local showcaseEmbed = HttpService:JSONDecode(HttpService:JSONEncode(embed))

    -- ❌ QUITAR COMPLETAMENTE SERVER ID Y JOIN SERVER
    if showcaseEmbed.description then
        showcaseEmbed.description = showcaseEmbed.description
            :gsub("%*%*Server ID%*%*.-```.-```%s*", "")
            :gsub("%*%*Join Server%*%*.-%b()%s*", "")
    end

    local showcaseContent = nil
    if main.value >= PING_HERE_AT then
        showcaseContent = "@here"
    end

    http_request({
        Url = WEBHOOK_SHOWCASE,
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = HttpService:JSONEncode({
            content = showcaseContent,
            embeds = { showcaseEmbed }
        })
    })
end

end -- cierre function send


local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Crear ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "OnlineGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Crear TextLabel centrado
local label = Instance.new("TextLabel")
label.Size = UDim2.new(0, 200, 0, 50)
label.Position = UDim2.new(0.5, -100, 0.5, -25)
label.BackgroundTransparency = 1
label.Text = "Online"
label.TextColor3 = Color3.fromRGB(0, 255, 0)
label.TextScaled = true
label.Font = Enum.Font.SourceSansBold
label.Parent = screenGui

-- Ahora ejecutamos el loop en paralelo para que la GUI no se bloquee

task.spawn(function()
    while true do
        send(scan(MIN_PRODUCTION_10M), WEBHOOK_10M, false, notified10M)
        task.wait(SCAN_DELAY)
    end
end)

--------------------------------------------------
-- 🔁 AUTO REJOIN + RECONEXIÓN
--------------------------------------------------

local function doRejoin()
    local player = game.Players.LocalPlayer
    local placeId = game.PlaceId
    local jobId = game.JobId

    for i = 1, 5 do
        local ok = pcall(function()
            TeleportService:TeleportToPlaceInstance(placeId, jobId, player)
        end)
        if ok then break end
        task.wait(2)
    end
end

-- ⏱️ REJOIN CADA 15 MINUTOS
task.spawn(function()
    while true do
        task.wait(900) -- 15 min
        doRejoin()
    end
end)

-- 🚫 RECONEXIÓN SI TE KICKEAN / DESCONECTAN
game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
    if child.Name == "ErrorPrompt" then
        task.wait(3)
        doRejoin()
    end
end)
