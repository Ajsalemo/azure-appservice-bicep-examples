param sku string
param azureContainerRegistryName string
param azureContainerRegistryImageName string
param azureContainerRegistryUsername string
@secure()
param azureContainerRegistryPassword string
param azureContainerRegistryTagName string
param location string
param appServicePlanName string
param webAppName string

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  location: location
  properties: {
    reserved: false
    isXenon: true
    hyperV: true
  }
  sku: {
    name: sku
  }
  kind: 'app,container,windows'
}
resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      windowsFxVersion: 'DOCKER|${azureContainerRegistryName}.azurecr.io/${azureContainerRegistryImageName}:${azureContainerRegistryTagName}'
      appSettings: [
        {
          name: 'DOCKER_REGISTRY_SERVER_URL'
          value: 'https://${azureContainerRegistryName}.azurecr.io'
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_USERNAME'
          value: azureContainerRegistryUsername
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_PASSWORD'
          value: azureContainerRegistryPassword
        }
      ]
    }
  }
}

