pre-terraform:
	@echo "Create the different elements to run terraform"
	@cd _scripts && sh pre-terraform-landingzone.sh

landingzone.pre:
	@sh _scripts/run-terraform-lz.sh pretf

landingzone.plan:
	@sh _scripts/run-terraform-lz.sh init
	@sh _scripts/run-terraform-lz.sh plan

landingzone.apply:
	@sh _scripts/run-terraform-lz.sh apply

landingzone.destroy:
	@sh _scripts/run-terraform-lz.sh destroy

landingzone.show:
	@sh _scripts/run-terraform-lz.sh show
