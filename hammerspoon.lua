hs.window.animationDuration = 0

units = {
  topleft50     = { x = 0.00, y = 0.00, w = 0.50, h = 0.50 },
  topright50    = { x = 0.50, y = 0.00, w = 0.50, h = 0.50 },
  botleft50     = { x = 0.00, y = 0.50, w = 0.50, h = 0.50 },
  botright50    = { x = 0.50, y = 0.50, w = 0.50, h = 0.50 },
  top50         = { x = 0.00, y = 0.00, w = 1.00, h = 0.50 },
  bot50         = { x = 0.00, y = 0.50, w = 1.00, h = 0.50 },
  left50        = { x = 0.00, y = 0.00, w = 0.50, h = 1.00 },
  right50       = { x = 0.50, y = 0.00, w = 0.50, h = 1.00 },
  maximum       = { x = 0.00, y = 0.00, w = 1.00, h = 1.00 }
}

mash = { 'ctrl', 'alt', 'cmd' }
hs.hotkey.bind(mash, '&', function() hs.window.focusedWindow():move(units.topleft50, nil, true) end)
hs.hotkey.bind(mash, 'é', function() hs.window.focusedWindow():move(units.topright50, nil, true) end)
hs.hotkey.bind(mash, '"', function() hs.window.focusedWindow():move(units.botleft50, nil, true) end)
hs.hotkey.bind(mash, '\'', function() hs.window.focusedWindow():move(units.botright50, nil, true) end)
hs.hotkey.bind(mash, 'up', function() hs.window.focusedWindow():move(units.top50, nil, true) end)
hs.hotkey.bind(mash, 'down', function() hs.window.focusedWindow():move(units.bot50, nil, true) end)
hs.hotkey.bind(mash, 'left', function() hs.window.focusedWindow():move(units.left50, nil, true) end)
hs.hotkey.bind(mash, 'right', function() hs.window.focusedWindow():move(units.right50, nil, true) end)
hs.hotkey.bind(mash, ',', function() hs.window.focusedWindow():move(units.maximum, nil, true) end)
hs.hotkey.bind(mash, 'c', function() hs.window.focusedWindow():centerOnScreen() end)

caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
    if state then
        caffeine:setTitle("AWAKE")
    else
        caffeine:setTitle("SLEEPY")
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end
