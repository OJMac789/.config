local status_ok, notify = pcall(require, "notify")
if not status_ok then
	return
end

require("notify").setup({
    background_colour = "#282A36",
    fps = 60,
    icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = ""
    },
    level = 2,
    minimum_width = 50,
    render = "compact",
    stages = "fade",
    timeout = 3000,
    top_down = true
})
