if vim.fn.executable("nvm") == 1 then
  print("NVM path is not supported yet")
end

if vim.fn.executable("fnm") == 1 then
  local is_mac = vim.fn.has("macunix") == 1
  local node_bin = "~/.local/share/fnm"

  if is_mac then
    node_bin = "~/Library/Application Support/fnm"
  end

  node_bin = node_bin .. "/aliases/default/bin"
  vim.env.PATH = node_bin .. vim.env.PATH
end

-- if none of them is detected will fallback to system's nodeJS
