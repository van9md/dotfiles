require("config.lazy")
require("config.remap")
require("config.set")
vim.filetype.add({
  extension = {
    tmpl = "html"
  },
})
vim.opt.makeprg = "make"
vim.opt.errorformat = "%f:%l:%c: %m"

