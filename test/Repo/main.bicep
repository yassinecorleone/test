// Paramètres configurables
param appServicePlanName string = 'monAppServicePlan'
param appServiceName string = 'TestNet'
param location string = 'East US'
param sku string = 'F1' // Spécification du plan, ajustez selon le besoin (exemple: B1, F1, P1v2, etc.)

// Ressource - App Service Plan
resource appServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: sku
  }
  properties: {
    reserved: false // Mettre à true pour Linux, false pour Windows
  }
}

// Ressource - App Service
resource appService 'Microsoft.Web/sites@2021-02-01' = {
  name: appServiceName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
}
