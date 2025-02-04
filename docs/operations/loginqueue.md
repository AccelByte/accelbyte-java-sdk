# Loginqueue Service Index

&nbsp;  

## Operations

### Admin V1 Wrapper:  [AdminV1](../../src/main/java/net/accelbyte/sdk/api/loginqueue/wrappers/AdminV1.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/login-queue/v1/admin/namespaces/{namespace}/config` | GET | AdminGetConfiguration | [AdminGetConfiguration](../../src/main/java/net/accelbyte/sdk/api/loginqueue/operations/admin_v1/AdminGetConfiguration.java) | [AdminGetConfiguration](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/loginqueue/admin_v1/AdminGetConfiguration.java) |
| `/login-queue/v1/admin/namespaces/{namespace}/config` | PUT | AdminUpdateConfiguration | [AdminUpdateConfiguration](../../src/main/java/net/accelbyte/sdk/api/loginqueue/operations/admin_v1/AdminUpdateConfiguration.java) | [AdminUpdateConfiguration](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/loginqueue/admin_v1/AdminUpdateConfiguration.java) |
| `/login-queue/v1/admin/namespaces/{namespace}/status` | GET | AdminGetStatus | [AdminGetStatus](../../src/main/java/net/accelbyte/sdk/api/loginqueue/operations/admin_v1/AdminGetStatus.java) | [AdminGetStatus](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/loginqueue/admin_v1/AdminGetStatus.java) |

### Ticket V1 Wrapper:  [TicketV1](../../src/main/java/net/accelbyte/sdk/api/loginqueue/wrappers/TicketV1.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/login-queue/v1/namespaces/{namespace}/ticket` | GET | RefreshTicket | [RefreshTicket](../../src/main/java/net/accelbyte/sdk/api/loginqueue/operations/ticket_v1/RefreshTicket.java) | [RefreshTicket](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/loginqueue/ticket_v1/RefreshTicket.java) |
| `/login-queue/v1/namespaces/{namespace}/ticket` | DELETE | CancelTicket | [CancelTicket](../../src/main/java/net/accelbyte/sdk/api/loginqueue/operations/ticket_v1/CancelTicket.java) | [CancelTicket](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/loginqueue/ticket_v1/CancelTicket.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `apimodels.ConfigurationRequest` | [ApimodelsConfigurationRequest](../../src/main/java/net/accelbyte/sdk/api/loginqueue/models/ApimodelsConfigurationRequest.java) |
| `apimodels.ConfigurationResponse` | [ApimodelsConfigurationResponse](../../src/main/java/net/accelbyte/sdk/api/loginqueue/models/ApimodelsConfigurationResponse.java) |
| `apimodels.Link` | [ApimodelsLink](../../src/main/java/net/accelbyte/sdk/api/loginqueue/models/ApimodelsLink.java) |
| `apimodels.QueueStatusResponse` | [ApimodelsQueueStatusResponse](../../src/main/java/net/accelbyte/sdk/api/loginqueue/models/ApimodelsQueueStatusResponse.java) |
| `apimodels.RefreshTicketResponse` | [ApimodelsRefreshTicketResponse](../../src/main/java/net/accelbyte/sdk/api/loginqueue/models/ApimodelsRefreshTicketResponse.java) |
| `response.Error` | [ResponseError](../../src/main/java/net/accelbyte/sdk/api/loginqueue/models/ResponseError.java) |
