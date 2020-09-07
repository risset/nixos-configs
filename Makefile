default: home-manager rebuild

home-manager:
	home-manager switch

rebuild:
	sudo nixos-rebuild switch
