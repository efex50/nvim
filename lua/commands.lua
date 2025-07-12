

function Det()
    local command = "shpool detach $SHPOOL_SESSION_NAME"
    vim.fn.system(command) 
-- buraya istediğin Lua kodlarını yaz
end

vim.api.nvim_create_user_command("Det", Det, {} )
