vim.api.nvim_create_user_command("Llama", function(options)
  local range = options.range ~= 0
  local start_line = range and options.line1 or 1
  local end_line = range and options.line2 or vim.api.nvim_buf_line_count(0)
  local content = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  local buffer_content = table.concat(content, "\n")
  local prompt = { options.args, buffer_content }
  local question = table.concat(prompt, "\n")
  local answer = require("llama").ask(question)

  require("floaty").open(answer)
end, { range = true })
