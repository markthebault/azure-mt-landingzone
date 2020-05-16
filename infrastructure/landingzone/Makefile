pre-terraform:
	@echo "Create the different elements to run terraform"
	@cd _scripts && sh pre-terraform-landingzone.sh


landingzone: landingzone.pre landingzone.init landingzone.plan landingzone.apply

landingzone.pre:
	@sh _scripts/run-terraform-lz.sh all pretf

landingzone.init:
	@sh _scripts/run-terraform-lz.sh all init

landingzone.plan:
	@sh _scripts/run-terraform-lz.sh all plan

landingzone.apply:
	@sh _scripts/run-terraform-lz.sh all apply

landingzone.destroy:
	@sh _scripts/run-terraform-lz.sh all destroy

landingzone.show:
	@sh _scripts/run-terraform-lz.sh show