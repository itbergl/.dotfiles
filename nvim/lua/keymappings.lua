local set = vim.keymap.set

-- quitting
set({ "v", "n" }, "<leader>q", "<CMD>q<CR>", { desc = "quit" })

-- center the cursor when scrolling
set("n", "<C-u>", "<C-u>zz")
set("n", "<C-d>", "<C-d>zz")

-- navigate windows
set({ "v", "n" }, "<C-j>", "<C-w>j")
set({ "v", "n" }, "<C-k>", "<C-w>k")
set({ "v", "n" }, "<C-h>", "<C-w>h")
set({ "v", "n" }, "<C-l>", "<C-w>l")

-- relocating increment operators as <C-a> is used for TMUX 
set({ "v", "n" }, "<S-x>", "<C-a>", { desc = "increment selection" } )
set({ "v", "n" }, "g<S-x>", "g<C-a>", { desc = "increment selection (cumulative)" } )
set({ "v", "n" }, "<C-x>", "<C-x>", { desc = "decrement selection" } )
set({ "v", "n" }, "g<C-x>", "g<C-x>", { desc = "decrement selection (cumulative)" } )

-- Navigate buffers
set("n", "]w", ":bnext<CR>", { desc = "Next Buffer" })
set("n", "[w", ":bprevious<CR>", { desc = "Next Buffer" })

-- Resize with arrows
set("n", "<C-DOWN>", ":resize -2<CR>")
set("n", "<C-UP>", ":resize +2<CR>")
set("n", "<C-LEFT>", ":vertical resize -2<CR>")
set("n", "<C-RIGHT>", ":vertical resize +2<CR>")

-- clear last search on esc
set("n", "<ESC>", "<CMD>noh<CR>", { noremap = true, silent = true })

-- jump to next character (useful for closing pairs)
set("i", "<C-l>", "<C-o>a")

-- jumping between quickfix items
set("n", "]q", "<CMD>cnext<CR>", { desc = "Next Quickfix" })
set("n", "[q", "<CMD>cprev<CR>", { desc = "Previous Quickfix" })

-- jumping between quifix lists
set("n", "[Q", "<CMD>colder<CR>", { desc = "quickfix older" })
set("n", "<leader>c", "<CMD>copen<CR>", { desc = "copen" })
set("n", "]Q", "<CMD>cnewer<CR>", { desc = "quickfix newer" })
