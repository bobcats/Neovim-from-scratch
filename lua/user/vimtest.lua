vim.cmd [[
  let test#strategy = "neovim"
  let test#neovim#term_position = "horizontal botright 30"
  let test#javascript#reactscripts#executable = "npx react-scripts test --maxWorkers=50% --watchAll=false"
  let test#rust#cargo#executable = "cargo nextest"
]]
