# Reporting Service Index

&nbsp;  

## Operations

### Admin Extension Categories and Auto Moderation Actions Wrapper:  [AdminExtensionCategoriesAndAutoModerationActions](../../src/main/java/net/accelbyte/sdk/api/reporting/wrappers/AdminExtensionCategoriesAndAutoModerationActions.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/reporting/v1/admin/extensionActions` | GET | AdminFindActionList | [AdminFindActionList](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_extension_categories_and_auto_moderation_actions/AdminFindActionList.java) | [AdminFindActionList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_extension_categories_and_auto_moderation_actions/AdminFindActionList.java) |
| `/reporting/v1/admin/extensionActions` | POST | AdminCreateModAction | [AdminCreateModAction](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_extension_categories_and_auto_moderation_actions/AdminCreateModAction.java) | [AdminCreateModAction](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_extension_categories_and_auto_moderation_actions/AdminCreateModAction.java) |
| `/reporting/v1/admin/extensionCategories` | GET | AdminFindExtensionCategoryList | [AdminFindExtensionCategoryList](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_extension_categories_and_auto_moderation_actions/AdminFindExtensionCategoryList.java) | [AdminFindExtensionCategoryList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_extension_categories_and_auto_moderation_actions/AdminFindExtensionCategoryList.java) |
| `/reporting/v1/admin/extensionCategories` | POST | AdminCreateExtensionCategory | [AdminCreateExtensionCategory](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_extension_categories_and_auto_moderation_actions/AdminCreateExtensionCategory.java) | [AdminCreateExtensionCategory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_extension_categories_and_auto_moderation_actions/AdminCreateExtensionCategory.java) |

### Admin Configurations Wrapper:  [AdminConfigurations](../../src/main/java/net/accelbyte/sdk/api/reporting/wrappers/AdminConfigurations.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/reporting/v1/admin/namespaces/{namespace}/configurations` | GET | Get | [Get](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_configurations/Get.java) | [Get](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_configurations/Get.java) |
| `/reporting/v1/admin/namespaces/{namespace}/configurations` | POST | Upsert | [Upsert](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_configurations/Upsert.java) | [Upsert](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_configurations/Upsert.java) |

### Admin Reasons Wrapper:  [AdminReasons](../../src/main/java/net/accelbyte/sdk/api/reporting/wrappers/AdminReasons.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/reporting/v1/admin/namespaces/{namespace}/reasonGroups` | GET | AdminListReasonGroups | [AdminListReasonGroups](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/AdminListReasonGroups.java) | [AdminListReasonGroups](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/AdminListReasonGroups.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reasonGroups` | POST | CreateReasonGroup | [CreateReasonGroup](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/CreateReasonGroup.java) | [CreateReasonGroup](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/CreateReasonGroup.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reasonGroups/{groupId}` | GET | GetReasonGroup | [GetReasonGroup](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/GetReasonGroup.java) | [GetReasonGroup](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/GetReasonGroup.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reasonGroups/{groupId}` | DELETE | DeleteReasonGroup | [DeleteReasonGroup](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/DeleteReasonGroup.java) | [DeleteReasonGroup](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/DeleteReasonGroup.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reasonGroups/{groupId}` | PATCH | UpdateReasonGroup | [UpdateReasonGroup](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/UpdateReasonGroup.java) | [UpdateReasonGroup](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/UpdateReasonGroup.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reasons` | GET | AdminGetReasons | [AdminGetReasons](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/AdminGetReasons.java) | [AdminGetReasons](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/AdminGetReasons.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reasons` | POST | CreateReason | [CreateReason](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/CreateReason.java) | [CreateReason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/CreateReason.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reasons/all` | GET | AdminGetAllReasons | [AdminGetAllReasons](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/AdminGetAllReasons.java) | [AdminGetAllReasons](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/AdminGetAllReasons.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reasons/unused` | GET | AdminGetUnusedReasons | [AdminGetUnusedReasons](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/AdminGetUnusedReasons.java) | [AdminGetUnusedReasons](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/AdminGetUnusedReasons.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reasons/{reasonId}` | GET | AdminGetReason | [AdminGetReason](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/AdminGetReason.java) | [AdminGetReason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/AdminGetReason.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reasons/{reasonId}` | DELETE | DeleteReason | [DeleteReason](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/DeleteReason.java) | [DeleteReason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/DeleteReason.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reasons/{reasonId}` | PATCH | UpdateReason | [UpdateReason](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/UpdateReason.java) | [UpdateReason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/UpdateReason.java) |

### Admin Reports Wrapper:  [AdminReports](../../src/main/java/net/accelbyte/sdk/api/reporting/wrappers/AdminReports.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/reporting/v1/admin/namespaces/{namespace}/reports` | GET | ListReports | [ListReports](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reports/ListReports.java) | [ListReports](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reports/ListReports.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reports` | POST | AdminSubmitReport | [AdminSubmitReport](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reports/AdminSubmitReport.java) | [AdminSubmitReport](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reports/AdminSubmitReport.java) |

### Admin Moderation Rule Wrapper:  [AdminModerationRule](../../src/main/java/net/accelbyte/sdk/api/reporting/wrappers/AdminModerationRule.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/reporting/v1/admin/namespaces/{namespace}/rule` | POST | CreateModerationRule | [CreateModerationRule](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_moderation_rule/CreateModerationRule.java) | [CreateModerationRule](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_moderation_rule/CreateModerationRule.java) |
| `/reporting/v1/admin/namespaces/{namespace}/rule/{ruleId}` | PUT | UpdateModerationRule | [UpdateModerationRule](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_moderation_rule/UpdateModerationRule.java) | [UpdateModerationRule](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_moderation_rule/UpdateModerationRule.java) |
| `/reporting/v1/admin/namespaces/{namespace}/rule/{ruleId}` | DELETE | DeleteModerationRule | [DeleteModerationRule](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_moderation_rule/DeleteModerationRule.java) | [DeleteModerationRule](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_moderation_rule/DeleteModerationRule.java) |
| `/reporting/v1/admin/namespaces/{namespace}/rule/{ruleId}/status` | PUT | UpdateModerationRuleStatus | [UpdateModerationRuleStatus](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_moderation_rule/UpdateModerationRuleStatus.java) | [UpdateModerationRuleStatus](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_moderation_rule/UpdateModerationRuleStatus.java) |
| `/reporting/v1/admin/namespaces/{namespace}/rules` | GET | GetModerationRules | [GetModerationRules](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_moderation_rule/GetModerationRules.java) | [GetModerationRules](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_moderation_rule/GetModerationRules.java) |
| `/reporting/v1/admin/namespaces/{namespace}/rules/{ruleId}` | GET | GetModerationRuleDetails | [GetModerationRuleDetails](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_moderation_rule/GetModerationRuleDetails.java) | [GetModerationRuleDetails](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_moderation_rule/GetModerationRuleDetails.java) |

### Admin Tickets Wrapper:  [AdminTickets](../../src/main/java/net/accelbyte/sdk/api/reporting/wrappers/AdminTickets.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/reporting/v1/admin/namespaces/{namespace}/tickets` | GET | ListTickets | [ListTickets](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_tickets/ListTickets.java) | [ListTickets](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_tickets/ListTickets.java) |
| `/reporting/v1/admin/namespaces/{namespace}/tickets/statistic` | GET | TicketStatistic | [TicketStatistic](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_tickets/TicketStatistic.java) | [TicketStatistic](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_tickets/TicketStatistic.java) |
| `/reporting/v1/admin/namespaces/{namespace}/tickets/{ticketId}` | GET | GetTicketDetail | [GetTicketDetail](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_tickets/GetTicketDetail.java) | [GetTicketDetail](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_tickets/GetTicketDetail.java) |
| `/reporting/v1/admin/namespaces/{namespace}/tickets/{ticketId}` | DELETE | DeleteTicket | [DeleteTicket](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_tickets/DeleteTicket.java) | [DeleteTicket](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_tickets/DeleteTicket.java) |
| `/reporting/v1/admin/namespaces/{namespace}/tickets/{ticketId}/reports` | GET | GetReportsByTicket | [GetReportsByTicket](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_tickets/GetReportsByTicket.java) | [GetReportsByTicket](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_tickets/GetReportsByTicket.java) |
| `/reporting/v1/admin/namespaces/{namespace}/tickets/{ticketId}/resolutions` | POST | UpdateTicketResolutions | [UpdateTicketResolutions](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_tickets/UpdateTicketResolutions.java) | [UpdateTicketResolutions](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_tickets/UpdateTicketResolutions.java) |

### Public Reasons Wrapper:  [PublicReasons](../../src/main/java/net/accelbyte/sdk/api/reporting/wrappers/PublicReasons.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/reporting/v1/public/namespaces/{namespace}/reasonGroups` | GET | PublicListReasonGroups | [PublicListReasonGroups](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/public_reasons/PublicListReasonGroups.java) | [PublicListReasonGroups](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/public_reasons/PublicListReasonGroups.java) |
| `/reporting/v1/public/namespaces/{namespace}/reasons` | GET | PublicGetReasons | [PublicGetReasons](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/public_reasons/PublicGetReasons.java) | [PublicGetReasons](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/public_reasons/PublicGetReasons.java) |

### Public Reports Wrapper:  [PublicReports](../../src/main/java/net/accelbyte/sdk/api/reporting/wrappers/PublicReports.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/reporting/v1/public/namespaces/{namespace}/reports` | POST | SubmitReport | [SubmitReport](../../src/main/java/net/accelbyte/sdk/api/reporting/operations/public_reports/SubmitReport.java) | [SubmitReport](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/public_reports/SubmitReport.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `restapi.AdminAllReasonsResponse` | [RestapiAdminAllReasonsResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiAdminAllReasonsResponse.java) |
| `restapi.BanAccountActionRequest` | [RestapiBanAccountActionRequest](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiBanAccountActionRequest.java) |
| `restapi.BanAccountActionResponse` | [RestapiBanAccountActionResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiBanAccountActionResponse.java) |
| `restapi.ModerationRuleActionsRequest` | [RestapiModerationRuleActionsRequest](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiModerationRuleActionsRequest.java) |
| `restapi.ModerationRuleActionsResponse` | [RestapiModerationRuleActionsResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiModerationRuleActionsResponse.java) |
| `restapi.ModerationRuleActiveRequest` | [RestapiModerationRuleActiveRequest](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiModerationRuleActiveRequest.java) |
| `restapi.ModerationRuleRequest` | [RestapiModerationRuleRequest](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiModerationRuleRequest.java) |
| `restapi.ModerationRuleResponse` | [RestapiModerationRuleResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiModerationRuleResponse.java) |
| `restapi.ModerationRulesList` | [RestapiModerationRulesList](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiModerationRulesList.java) |
| `restapi.UnusedReasonListResponse` | [RestapiUnusedReasonListResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiUnusedReasonListResponse.java) |
| `restapi.actionApiRequest` | [RestapiActionApiRequest](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiActionApiRequest.java) |
| `restapi.actionApiResponse` | [RestapiActionApiResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiActionApiResponse.java) |
| `restapi.actionListApiResponse` | [RestapiActionListApiResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiActionListApiResponse.java) |
| `restapi.adminReasonListResponse` | [RestapiAdminReasonListResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiAdminReasonListResponse.java) |
| `restapi.adminReasonResponse` | [RestapiAdminReasonResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiAdminReasonResponse.java) |
| `restapi.categoryLimit` | [RestapiCategoryLimit](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiCategoryLimit.java) |
| `restapi.configResponse` | [RestapiConfigResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiConfigResponse.java) |
| `restapi.createReasonGroupRequest` | [RestapiCreateReasonGroupRequest](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiCreateReasonGroupRequest.java) |
| `restapi.createReasonRequest` | [RestapiCreateReasonRequest](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiCreateReasonRequest.java) |
| `restapi.errorResponse` | [RestapiErrorResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiErrorResponse.java) |
| `restapi.extensionCategoryApiRequest` | [RestapiExtensionCategoryApiRequest](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiExtensionCategoryApiRequest.java) |
| `restapi.extensionCategoryApiResponse` | [RestapiExtensionCategoryApiResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiExtensionCategoryApiResponse.java) |
| `restapi.extensionCategoryListApiResponse` | [RestapiExtensionCategoryListApiResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiExtensionCategoryListApiResponse.java) |
| `restapi.pagination` | [RestapiPagination](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiPagination.java) |
| `restapi.publicReasonGroupResponse` | [RestapiPublicReasonGroupResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiPublicReasonGroupResponse.java) |
| `restapi.publicReasonListResponse` | [RestapiPublicReasonListResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiPublicReasonListResponse.java) |
| `restapi.publicReasonResponse` | [RestapiPublicReasonResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiPublicReasonResponse.java) |
| `restapi.reasonGroupListResponse` | [RestapiReasonGroupListResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiReasonGroupListResponse.java) |
| `restapi.reasonGroupResponse` | [RestapiReasonGroupResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiReasonGroupResponse.java) |
| `restapi.reportListResponse` | [RestapiReportListResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiReportListResponse.java) |
| `restapi.reportResponse` | [RestapiReportResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiReportResponse.java) |
| `restapi.reportingLimit` | [RestapiReportingLimit](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiReportingLimit.java) |
| `restapi.submitReportRequest` | [RestapiSubmitReportRequest](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiSubmitReportRequest.java) |
| `restapi.submitReportResponse` | [RestapiSubmitReportResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiSubmitReportResponse.java) |
| `restapi.ticketListResponse` | [RestapiTicketListResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiTicketListResponse.java) |
| `restapi.ticketResponse` | [RestapiTicketResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiTicketResponse.java) |
| `restapi.ticketStatisticResponse` | [RestapiTicketStatisticResponse](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiTicketStatisticResponse.java) |
| `restapi.updateReasonGroupRequest` | [RestapiUpdateReasonGroupRequest](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiUpdateReasonGroupRequest.java) |
| `restapi.updateTicketResolutionsRequest` | [RestapiUpdateTicketResolutionsRequest](../../src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiUpdateTicketResolutionsRequest.java) |
