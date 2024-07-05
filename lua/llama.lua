local curl = require("plenary.curl")

local llama = {
  config = {
    model = "llama3",
  },
}

local parse = function(response)
  return vim.json.decode(response)
end

llama.ask = function(prompt)
  local response = llama.post(prompt)
  local json = parse(response.body)

  return json.response
end

llama.post = function(prompt)
  return curl.post("http://localhost:11434/api/generate", {
    body = vim.json.encode({
      model = llama.config.model,
      prompt = prompt,
      stream = false,
    }),
  })
end

llama.setup = function(config)
  llama.config = vim.tbl_deep_extend("force", llama.config, config or {})
end

return llama
