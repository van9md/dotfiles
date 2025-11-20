require("config.lazy")
require("config.remap")
require("config.set")
require("config.transparent")
require("config.ahk")
vim.filetype.add({
  extension = {
    tmpl = "html"
  },
})


vim.opt.makeprg = "make"
vim.opt.errorformat = "%f:%l:%c: %m"

