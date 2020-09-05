default:
	home_manager rebuild

home-manager:
	home-manager switch

rebuild:
	sudo nixos-rebuild switch
