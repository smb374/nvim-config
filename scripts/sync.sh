#!/usr/bin/env bash
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'lua require[[plugins]]' -c 'lua require("packer").sync()'
