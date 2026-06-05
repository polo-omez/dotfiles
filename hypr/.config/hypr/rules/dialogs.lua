local floatTitles = {
	"^(Open File)(.*)$",
	"^(Select a File)(.*)$",
	"^(Choose wallpaper)(.*)$",
	"^(Open Folder)(.*)$",
	"^(Save As)(.*)$",
	"^(Library)(.*)$",
	"^(File Upload)(.*)$",
	"^(File Operation Progress)$",
	"^(Confirm to replace files)$",
}
for _, t in ipairs(floatTitles) do
	hl.window_rule({ match = { title = t }, float = true })
end

hl.window_rule({ match = { class = "^(" .. browser .. ")$", title = ".*accounts.*" }, float = true })

local dialogSizes = { "^(Save As)$", "^(Choose Files)$", "^(Open File)$", "^(Open Folder)$" }
for _, t in ipairs(dialogSizes) do
	hl.window_rule({ match = { class = "^(firefox|google-chrome|zen)$", title = t }, size = { 800, 600 } })
end

hl.window_rule({ name = "qview-optimization", match = { class = "^(com.interversehq.qView)$" }, opaque = true })
