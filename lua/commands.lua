

function Det()
    local command = "shpool detach $SHPOOL_SESSION_NAME"
    local result = vim.fn.system(command) 
    local err = vim.v.shell_error
    if err ~= 0  then
        print("Zaten bir havuza bağlı değil")
    end


end

vim.api.nvim_create_user_command("Det", Det, {} )

function lolo()
    local col = vim.fn.col('.')

    print(col)
end

vim.api.nvim_create_user_command("Lol",lolo,{})

-- insert moda geçince cursor bi sağa
vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        vim.cmd("normal! l")
    end,
})


vim.opt.virtualedit = "onemore"

