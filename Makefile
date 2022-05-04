# Deploy dotfiles and directories into the home directory as symbolic-links
PHONY: deploy
deploy:

.PHONY: .vim
.vim:
	ln -snf $(CURDIR)/$@ $(HOME)/$@

.PHONY: .aliases
.aliases:
	ln -snf $(CURDIR)/$@ $(HOME)/$@

.PHONY: vim-plugins
vim-plugins: .vim
	git submodule update --init
	vim -c "NeoBundleInstall" -c "quit"