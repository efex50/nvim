
local result = vim.fn.system("cat ~/.path")
vim.env.PATH = result


-- Saat gösterme
function _G.clock()
  return os.date("%H:%M")
end

vim.fn.timer_start(15000, function()
  vim.cmd("redrawstatus")
end, { ["repeat"] = -1 })


-- batarya gösterimi
function _G.battery()
  local base = "/sys/class/power_supply/BAT0/"
  local capacity_f = io.open(base .. "capacity", "r")
  local status_f = io.open(base .. "status", "r")

  if not capacity_f or not status_f then
    return "🔌"
  end

  local percent = tonumber(capacity_f:read("*a"))
  local status = status_f:read("*l")
  capacity_f:close()
  status_f:close()

  local discharging_icons = {
    [0] = "󰁺", [10] = "󰁻", [20] = "󰁼", [30] = "󰁽", [40] = "󰁾",
    [50] = "󰁿", [60] = "󰂀", [70] = "󰂁", [80] = "󰂂", [90] = "󰂃", [100] = "󰁹"
  }

  local charging_icons = {
    [0] = "󰢜", [10] = "󰢝", [20] = "󰢞", [30] = "󰢟", [40] = "󰢠",
    [50] = "󰢡", [60] = "󰢢", [70] = "󰢣", [80] = "󰢤", [90] = "󰢥", [100] = "󰂅"
  }

  local rounded = math.floor(percent / 10) * 10
  if rounded > 100 then rounded = 100 end

  local icon
  if status == "Charging" then
    icon = charging_icons[rounded] or "󰂅"
  else
    icon = discharging_icons[rounded] or "󰁺"
  end

  return string.format("%s %d%%", icon, percent)
end



vim.opt.statusline = [[%f %h%m%r %= %l,%c %{v:lua.battery()} | %{v:lua.clock()}]]
