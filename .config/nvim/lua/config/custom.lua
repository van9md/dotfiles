local M = {}

function M.markdown_search()
  local telescope = require("telescope.builtin")
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local previewers = require("telescope.previewers")
  local cwd = vim.fn.expand("~/notes")  -- <--- поменяй на свою папку
  telescope.find_files({
    prompt_title = "Markdown Files",
    cwd = cwd,
    find_command = { "rg", "--files", "--glob", "*.md" },
        previewer = previewers.vim_buffer_cat.new({}),
    attach_mappings = function(prompt_bufnr, map)
      -- при нажатии <C-n> создаём новый файл
      map("i", "<C-c>", function()
        actions.close(prompt_bufnr)
        local new_name = vim.fn.input("New markdown filename (without .md): ")
        if new_name ~= "" then
          local new_path = cwd .. "/" .. new_name .. ".md"
          vim.cmd("edit " .. vim.fn.fnameescape(new_path))
        end
      end)
      return true
    end,
  })
end

return M

