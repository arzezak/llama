local llama = {}

llama.ask = function(prompt)
  local curl = require("plenary.curl")

  local res = curl.post("http://localhost:11434/api/generate", {
    body = vim.fn.json_encode({
      model = "llama3",
      prompt = prompt,
      stream = false,
    }),
  }).body

  return res
end

return llama
