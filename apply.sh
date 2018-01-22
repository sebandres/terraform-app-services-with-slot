environment=$1
variablesFile="./variables/$environment.tfvars"
saveFile="key=$environment.tfstate"

terraform init -backend-config="$saveFile" -reconfigure
terraform apply -var-file="$variablesFile" -input=false -auto-approve