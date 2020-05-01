package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformModule(t *testing.T) {

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../",

		VarFiles: []string{"./test/test.tfvars"},

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{},

		// Disable colors in Terraform commands so its easier to parse stdout/stderr
		NoColor: false,
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// For debugging
	terraform.InitAndPlan(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)
}
