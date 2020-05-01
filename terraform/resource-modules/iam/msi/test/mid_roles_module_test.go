package test

import (
	"testing"
	"encoding/json"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

// An example of how to test the simple Terraform module in examples/terraform-basic-example using Terratest.
func TestTerraformMidRolesModule(t *testing.T) {
	t.Parallel()

	type M map[string]interface{}
	var mapSlice []M
	m1 := M{
			"scope_id" : "/subscriptions/4cb0a463-ca43-4b4d-9a82-d51ab05c293c/resourceGroups/condaenv/providers/Microsoft.Storage/storageAccounts/condaenv",
			"role_definition"    : "Reader",
		}
  m2 := M{
			"scope_id" : "/subscriptions/4cb0a463-ca43-4b4d-9a82-d51ab05c293c/resourceGroups/abstorage/providers/Microsoft.Storage/storageAccounts/abstoraccount",
			"role_definition"    : "Managed Identity Operator",
	}
	m3 := M{
			"scope_id" : "/subscriptions/4cb0a463-ca43-4b4d-9a82-d51ab05c293c/resourceGroups/abstorage/providers/Microsoft.Storage/storageAccounts/abstoraccount",
			"role_definition"    : "Reader",
	}
  expectedName := "msitest"
	expectedRgName := "MC_dsp-playground-aks-resources_dsp-playground-aks_westeurope"
	expectedLocation := "westeurope"
	expectedRoles := append(mapSlice,m1,m2,m3)
	/*expectedServicePrincipalId := "23432423-234324-changeme-23423-234324"
	expectedRoleDefinitions := []string {
        		"Managed Identity Operator",
	}*/
	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"name": expectedName,
			"resource_group": expectedRgName,
			// We also can see how lists and maps translate between terratest and terraform.
			"location": expectedLocation,
			myJson, _ := json.MarshalIndent(expectedRoles, "", "    "),
			"roles": string(myJson),
			/* Only needed when you do not put the msi inside of the AKS Resources Resource Group (it starts with MC_)
    		"service_principal_id": expectedServicePrincipalId, 
				"role_definition_name": expectedRoleDefinitions,
			*/
		},

		// Disable colors in Terraform commands so its easier to parse stdout/stderr
		NoColor: false,
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

}