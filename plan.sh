environment=$1
variablesFile="./variables/$environment.tfvars"
saveFile="key=$environment.tfstate"

terraform init -backend-config="$saveFile" -reconfigure
terraform plan -var-file="$variablesFile" -input=false