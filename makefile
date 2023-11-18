export: 
	clear
	@echo "Exporting configuration directory..."
	cp -r ~/.config .
	@echo "Exporting .zshrc..."
	cp ~/.zshrc .

import:
	clear
	@echo "Importing configuration directory..."
	cp -r .config ~
	@echo "Importing .zshrc..."
	cp .zshrc ~ 
