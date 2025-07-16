# Sessionhistory Service Index

&nbsp;  

## Operations

### XRay Wrapper:  [XRay](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/wrappers/XRay.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/tickets` | POST | CreateXrayTicketObservability | [CreateXrayTicketObservability](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/CreateXrayTicketObservability.java) | [CreateXrayTicketObservability](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/CreateXrayTicketObservability.java) |
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/tickets/bulk` | POST | CreateXrayBulkTicketObservability | [CreateXrayBulkTicketObservability](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/CreateXrayBulkTicketObservability.java) | [CreateXrayBulkTicketObservability](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/CreateXrayBulkTicketObservability.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `apimodels.XRayBulkTicketObservabilityRequest` | [ApimodelsXRayBulkTicketObservabilityRequest](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayBulkTicketObservabilityRequest.java) |
| `apimodels.XRayBulkTicketObservabilityResponse` | [ApimodelsXRayBulkTicketObservabilityResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayBulkTicketObservabilityResponse.java) |
| `apimodels.XRayTicketObservabilityRequest` | [ApimodelsXRayTicketObservabilityRequest](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayTicketObservabilityRequest.java) |
| `apimodels.XRayTicketObservabilityResponse` | [ApimodelsXRayTicketObservabilityResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayTicketObservabilityResponse.java) |
| `models.AllianceRule` | [ModelsAllianceRule](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsAllianceRule.java) |
| `models.MatchingRule` | [ModelsMatchingRule](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsMatchingRule.java) |
| `response.Error` | [ResponseError](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ResponseError.java) |
