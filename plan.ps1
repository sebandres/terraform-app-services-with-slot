param (
    [string]$environment = $(throw "-environment is required.")
)

$environment=$environment.ToLower()
$variablesFile=".\\variables\\$environment.tfvars"
$saveFile="key=$environment.tfstate"

terraform init -backend-config="$saveFile" -reconfigure
terraform plan -var-file="$variablesFile" -input=false