# Create the landing zone with terraform
**Steps:**
- **Run make pre-terraform**: This will create the required subscriptions and create a file `/accounts.json` it will also create a Service principal for terraform that will be the Owner of the subscription. The details of the SP will not be commited but they will be in the file `./tf-sp.tfvars`
- **Put the correct subscription_id in ./landinzone/tflz_*/terraform.tfvars**: copy the subscription id from the `/accounts.json` and paste it there 
- **Run make landingzone** this will create the landinzone, the varaiables `sp_tf_appid` and `sp_tf_password` must be passed, you can pass they via env vars