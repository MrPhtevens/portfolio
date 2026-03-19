# see: https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations

resource "azurerm_application_insights" "appi" {
  name                = var.application_insights_name
  location            = var.location
  resource_group_name = var.resource_group_name
  workspace_id        = var.workspace_id
  application_type    = var.application_type
  tags                = var.tags
}

resource "azurerm_monitor_action_group" "ag" {
  name                = "ag-${var.application_insights_name}"
  short_name          = "appi-app"
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_monitor_smart_detector_alert_rule" "apr" {
  name                = "apr-${var.application_insights_name}"
  resource_group_name = var.resource_group_name
  severity            = "Sev3"  # Sev0 | Sev1 | Sev2 | Sev3 | Sev4
  scope_resource_ids  = [azurerm_application_insights.appi.id]
  frequency           = "PT1M"
  detector_type       = "FailureAnomaliesDetector"  # FailureAnomaliesDetector | RequestPerformanceDegradationDetector | DependencyPerformanceDegradationDetector | ExceptionVolumeChangedDetector | TraceSeverityDetector | MemoryLeakDetector

  action_group {
    ids = [azurerm_monitor_action_group.ag.id]
  }

  tags                = var.tags
}
