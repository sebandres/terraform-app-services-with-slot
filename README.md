# Infrastructure

## We create:

### For production only:
- An AppService app

### For Non-Prod Slots:
- An AppService app
- A slot on the app service

## New Non-Prod Environemnt
Because of the container-child relationship between an AppService and it's slots we need to make sure that when we create a new non prod environment we first import the already existing parent resource and domain before in order to sync the state for that environment to what is deployed. 

## Complete rebuild
In order to do a complete rebuild delete the resource group container first and then apply a prod or non prod configuration. For a non prod environment the production appservice and domain will also be created given we cannot have a slot without a parent appService and we can't assign the certificates to our parent appService without a domain pointing to it.
