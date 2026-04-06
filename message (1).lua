---------------- CONFIG ----------------
-- WEBHOOKS
local WEBHOOK_10M = "https://discord.com/api/webhooks/1486898527979176078/l0yYukaA74r3abQqjmEr5mZd7D5L64b4zC5Zt_OLPbuGj1pabuanntEAGveeXpSA3bSz" 
local WEBHOOK_SHOWCASE = "AQUI2"

-- API LOCAL
local LOCAL_API_URL = "https://webhook-roblox.josefernandezxd4.workers.dev/"

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
local BRAINROT_IMAGES = {
["Arcadopus"] = "https://www.lolga.com/uploads/images/goods/steal-a-brainrot/all-server-arcadopus.png",
["Mi Gatito"] = "https://static.wikia.nocookie.net/stealabr/images/5/50/AyMiGatito.png",
}

--------------------------------------------------
-- NORMALIZAR NOMBRES
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
-- SCAN
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
-- 🔥 API LOCAL (NUEVO)
--------------------------------------------------
local function sendToLocalAPI(main, list)
    if not LOCAL_API_URL or LOCAL_API_URL == "" then return end

    local jobId = game.JobId
    local placeId = game.PlaceId

    local dataList = {}

    for _,v in ipairs(list) do
        table.insert(dataList, {
            name = v.name,
            value = math.floor(v.value)
        })
    end

    local payload = {
        main = {
            name = main.name,
            value = math.floor(main.value)
        },
        jobId = jobId,
        placeId = placeId,
        all = dataList
    }

    pcall(function()
        http_request({
            Url = LOCAL_API_URL,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = HttpService:JSONEncode(payload)
        })
    end)
end

--------------------------------------------------
-- WEBHOOK
--------------------------------------------------

local notified10M = {}
local notifiedShowcase = {}

local function send(list, webhook, pingRole, lastHashRef)
    if #list == 0 then return end

    table.sort(list, function(a,b)
        return a.value > b.value
    end)

    local main = list[1]

    -- 🔥 ENVÍO A TU API (NUEVO)
    sendToLocalAPI(main, list)

    local hash =
    normalizeName(main.name)
    .. "|"
    .. tostring(math.floor(main.value))
    .. "|"
    .. game.JobId

    if not lastHashRef then lastHashRef = {} end
    if lastHashRef[hash] then return end
    lastHashRef[hash] = true

    local grouped = {}

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

    local ordered = {}
    for _,v in pairs(grouped) do
        table.insert(ordered, v)
    end

    table.sort(ordered, function(a, b)
        return a.value > b.value
    end)

    for _,v in ipairs(ordered) do
        hasOthers = true

        others = others
            .. v.count .. "x " .. v.name .. "\n"
            .. "— " .. formatMoney(v.value) .. "\n"
    end

    local jobId = game.JobId
    local placeId = game.PlaceId

    local joinLink =
        "https://chillihub1.github.io/chillihub-joiner/?placeId="
        .. placeId ..
        "&gameInstanceId=" .. jobId

    local embed = {
        title = "💎 **" .. main.name .. "**",
        color = 2829618,
        description = "**(" .. formatMoney(main.value) .. ")**\n\n",
        footer = {
            text = "CIX NOTIFIER"
        },
    }

    embed.description = embed.description ..
        "**Join Server ID**\n```" .. jobId .. "```\n"

    embed.description = embed.description ..
        "**Join Server**\n[**CLICK TO JOIN**](" .. joinLink .. ")\n\n"

    if hasOthers then
        embed.description = embed.description ..
            "**🌟 Otros Brainrots Detectados**\n```" .. others .. "```\n\n"
    end

    local img = getBrainrotImage(main.name)
    if img then
        embed.thumbnail = { url = img }
    end

    http_request({
        Url = webhook,
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = HttpService:JSONEncode({
            content = nil,
            embeds = { embed }
        })
    })
end

--------------------------------------------------
-- LOOP
--------------------------------------------------
task.spawn(function()
    while true do
        send(scan(MIN_PRODUCTION_10M), WEBHOOK_10M, false, notified10M)
        task.wait(SCAN_DELAY)
    end
end)
