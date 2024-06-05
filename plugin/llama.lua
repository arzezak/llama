vim.api.nvim_create_user_command("Llama", function(options)
  local start_line = options.line1
  local end_line = options.line2
  local prompt = options.args
  local answer = require("llama").ask(prompt)

  print(start_line, end_line)
  print(answer)
end, { range = true })
