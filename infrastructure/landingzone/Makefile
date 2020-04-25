pre-terraform:
	@echo "Create the different elements to run terraform"
	@cd _scripts && sh pre-terraform-landingzone.sh

landingzone.pre:
	@sh _scripts/run-terraform-lz.sh pretf

landingzone.plan:
	@sh _scripts/run-terraform-lz.sh init
	@sh _scripts/run-terraform-lz.sh plan