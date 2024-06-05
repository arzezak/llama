local curl = require("plenary.curl")

local llama = {}

llama.ask = function(prompt)
  local response = llama.post(prompt)
  local json = llama.parse(response)

  return json.response
end

llama.parse = function(response)
  return vim.json.decode(response.body)
end

llama.post = function(prompt)
  return curl.post("http://localhost:11434/api/generate", {
    body = vim.fn.json_encode({
      model = "llama3",
      prompt = prompt,
      stream = false,
    }),
  })
end

return llama
