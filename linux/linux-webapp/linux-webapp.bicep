param sku string
param linuxFxVersion string
// This should be in the format of "LANGUAGE|VERSION"
// Ex. "PYTHON|3.8"
param location string
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
      scmType: 'LocalGit'
    }
  }
}

