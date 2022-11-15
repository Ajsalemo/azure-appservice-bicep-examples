param sku string
param linuxFxVersion string
// This should be in the format of "LANGUAGE|VERSION"
// Ex. "PYTHON|3.8"
param location string
param repositoryUrl string
param branch string
param appServicePlanName string
param webAppName string

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  location: location
  properties: {
    reserved: true
  }
  sku: {
    name: sku
  }
  kind: 'linux'
}
resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
  }
}

// This can be changed to another deployment source as needed
// Review the documentation here: https://learn.microsoft.com/en-us/azure/templates/microsoft.web/sites/sourcecontrols?tabs=bicep&pivots=deployment-language-bicep
resource srcControls 'Microsoft.Web/sites/sourcecontrols@2021-01-01' = {
  name: '${appService.name}/web'
  properties: {
    repoUrl: repositoryUrl
    branch: branch
    isManualIntegration: true
  }
}
