# Gdpr Service Index

&nbsp;  

## Operations

### Data Deletion Wrapper:  [DataDeletion](../src/main/java/net/accelbyte/sdk/api/gdpr/wrappers/DataDeletion.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/gdpr/admin/namespaces/{namespace}/deletions` | GET | AdminGetListDeletionDataRequest | [AdminGetListDeletionDataRequest](../src/main/java/net/accelbyte/sdk/api/gdpr/operations/data_deletion/AdminGetListDeletionDataRequest.java) | [AdminGetListDeletionDataRequest](../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gdpr/data_deletion/AdminGetListDeletionDataRequest.java) |
| `/gdpr/admin/namespaces/{namespace}/users/{userId}/deletions` | GET | AdminGetUserAccountDeletionRequest | [AdminGetUserAccountDeletionRequest](../src/main/java/net/accelbyte/sdk/api/gdpr/operations/data_deletion/AdminGetUserAccountDeletionRequest.java) | [AdminGetUserAccountDeletionRequest](../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gdpr/data_deletion/AdminGetUserAccountDeletionRequest.java) |
| `/gdpr/admin/namespaces/{namespace}/users/{userId}/deletions` | POST | AdminSubmitUserAccountDeletionRequest | [AdminSubmitUserAccountDeletionRequest](../src/main/java/net/accelbyte/sdk/api/gdpr/operations/data_deletion/AdminSubmitUserAccountDeletionRequest.java) | [AdminSubmitUserAccountDeletionRequest](../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gdpr/data_deletion/AdminSubmitUserAccountDeletionRequest.java) |
| `/gdpr/admin/namespaces/{namespace}/users/{userId}/deletions` | DELETE | AdminCancelUserAccountDeletionRequest | [AdminCancelUserAccountDeletionRequest](../src/main/java/net/accelbyte/sdk/api/gdpr/operations/data_deletion/AdminCancelUserAccountDeletionRequest.java) | [AdminCancelUserAccountDeletionRequest](../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gdpr/data_deletion/AdminCancelUserAccountDeletionRequest.java) |
| `/gdpr/public/namespaces/{namespace}/users/{userId}/deletions` | POST | PublicSubmitUserAccountDeletionRequest | [PublicSubmitUserAccountDeletionRequest](../src/main/java/net/accelbyte/sdk/api/gdpr/operations/data_deletion/PublicSubmitUserAccountDeletionRequest.java) | [PublicSubmitUserAccountDeletionRequest](../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gdpr/data_deletion/PublicSubmitUserAccountDeletionRequest.java) |
| `/gdpr/public/namespaces/{namespace}/users/{userId}/deletions` | DELETE | PublicCancelUserAccountDeletionRequest | [PublicCancelUserAccountDeletionRequest](../src/main/java/net/accelbyte/sdk/api/gdpr/operations/data_deletion/PublicCancelUserAccountDeletionRequest.java) | [PublicCancelUserAccountDeletionRequest](../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gdpr/data_deletion/PublicCancelUserAccountDeletionRequest.java) |
| `/gdpr/public/namespaces/{namespace}/users/{userId}/deletions/status` | GET | PublicGetUserAccountDeletionStatus | [PublicGetUserAccountDeletionStatus](../src/main/java/net/accelbyte/sdk/api/gdpr/operations/data_deletion/PublicGetUserAccountDeletionStatus.java) | [PublicGetUserAccountDeletionStatus](../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gdpr/data_deletion/PublicGetUserAccountDeletionStatus.java) |

### Data Retrieval Wrapper:  [DataRetrieval](../src/main/java/net/accelbyte/sdk/api/gdpr/wrappers/DataRetrieval.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/gdpr/admin/namespaces/{namespace}/emails/configurations` | GET | GetAdminEmailConfiguration | [GetAdminEmailConfiguration](../src/main/java/net/accelbyte/sdk/api/gdpr/operations/data_retrieval/GetAdminEmailConfiguration.java) | [GetAdminEmailConfiguration](../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gdpr/data_retrieval/GetAdminEmailConfiguration.java) |
| `/gdpr/admin/namespaces/{namespace}/emails/configurations` | PUT | UpdateAdminEmailConfiguration | [UpdateAdminEmailConfiguration](../src/main/java/net/accelbyte/sdk/api/gdpr/operations/data_retrieval/UpdateAdminEmailConfiguration.java) | [UpdateAdminEmailConfiguration](../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gdpr/data_retrieval/UpdateAdminEmailConfiguration.java) |
| `/gdpr/admin/namespaces/{namespace}/emails/configurations` | POST | SaveAdminEmailConfiguration | [SaveAdminEmailConfiguration](../src/main/java/net/accelbyte/sdk/api/gdpr/operations/data_retrieval/SaveAdminEmailConfiguration.java) | [SaveAdminEmailConfiguration](../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gdpr/data_retrieval/SaveAdminEmailConfiguration.java) |
| `/gdpr/admin/namespaces/{namespace}/emails/configurations` | DELETE | DeleteAdminEmailConfiguration | [DeleteAdminEmailConfiguration](../src/main/java/net/accelbyte/sdk/api/gdpr/operations/data_retrieval/DeleteAdminEmailConfiguration.java) | [DeleteAdminEmailConfiguration](../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gdpr/data_retrieval/DeleteAdminEmailConfiguration.java) |
| `/gdpr/admin/namespaces/{namespace}/requests` | GET | AdminGetListPersonalDataRequest | [AdminGetListPersonalDataRequest](../src/main/java/net/accelbyte/sdk/api/gdpr/operations/data_retrieval/AdminGetListPersonalDataRequest.java) | [AdminGetListPersonalDataRequest](../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gdpr/data_retrieval/AdminGetListPersonalDataRequest.java) |
| `/gdpr/admin/namespaces/{namespace}/users/{userId}/requests` | GET | AdminGetUserPersonalDataRequests | [AdminGetUserPersonalDataRequests](../src/main/java/net/accelbyte/sdk/api/gdpr/operations/data_retrieval/AdminGetUserPersonalDataRequests.java) | [AdminGetUserPersonalDataRequests](../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gdpr/data_retrieval/AdminGetUserPersonalDataRequests.java) |
| `/gdpr/admin/namespaces/{namespace}/users/{userId}/requests` | POST | AdminRequestDataRetrieval | [AdminRequestDataRetrieval](../src/main/java/net/accelbyte/sdk/api/gdpr/operations/data_retrieval/AdminRequestDataRetrieval.java) | [AdminRequestDataRetrieval](../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gdpr/data_retrieval/AdminRequestDataRetrieval.java) |
| `/gdpr/admin/namespaces/{namespace}/users/{userId}/requests/{requestDate}` | DELETE | AdminCancelUserPersonalDataRequest | [AdminCancelUserPersonalDataRequest](../src/main/java/net/accelbyte/sdk/api/gdpr/operations/data_retrieval/AdminCancelUserPersonalDataRequest.java) | [AdminCancelUserPersonalDataRequest](../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gdpr/data_retrieval/AdminCancelUserPersonalDataRequest.java) |
| `/gdpr/admin/namespaces/{namespace}/users/{userId}/requests/{requestDate}/generate` | POST | AdminGeneratePersonalDataURL | [AdminGeneratePersonalDataURL](../src/main/java/net/accelbyte/sdk/api/gdpr/operations/data_retrieval/AdminGeneratePersonalDataURL.java) | [AdminGeneratePersonalDataURL](../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gdpr/data_retrieval/AdminGeneratePersonalDataURL.java) |
| `/gdpr/public/namespaces/{namespace}/users/{userId}/requests` | GET | PublicGetUserPersonalDataRequests | [PublicGetUserPersonalDataRequests](../src/main/java/net/accelbyte/sdk/api/gdpr/operations/data_retrieval/PublicGetUserPersonalDataRequests.java) | [PublicGetUserPersonalDataRequests](../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gdpr/data_retrieval/PublicGetUserPersonalDataRequests.java) |
| `/gdpr/public/namespaces/{namespace}/users/{userId}/requests` | POST | PublicRequestDataRetrieval | [PublicRequestDataRetrieval](../src/main/java/net/accelbyte/sdk/api/gdpr/operations/data_retrieval/PublicRequestDataRetrieval.java) | [PublicRequestDataRetrieval](../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gdpr/data_retrieval/PublicRequestDataRetrieval.java) |
| `/gdpr/public/namespaces/{namespace}/users/{userId}/requests/{requestDate}` | DELETE | PublicCancelUserPersonalDataRequest | [PublicCancelUserPersonalDataRequest](../src/main/java/net/accelbyte/sdk/api/gdpr/operations/data_retrieval/PublicCancelUserPersonalDataRequest.java) | [PublicCancelUserPersonalDataRequest](../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gdpr/data_retrieval/PublicCancelUserPersonalDataRequest.java) |
| `/gdpr/public/namespaces/{namespace}/users/{userId}/requests/{requestDate}/generate` | POST | PublicGeneratePersonalDataURL | [PublicGeneratePersonalDataURL](../src/main/java/net/accelbyte/sdk/api/gdpr/operations/data_retrieval/PublicGeneratePersonalDataURL.java) | [PublicGeneratePersonalDataURL](../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gdpr/data_retrieval/PublicGeneratePersonalDataURL.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `models.DataRetrievalResponse` | [ModelsDataRetrievalResponse](../src/main/java/net/accelbyte/sdk/api/gdpr/models/ModelsDataRetrievalResponse.java) |
| `models.DeletionData` | [ModelsDeletionData](../src/main/java/net/accelbyte/sdk/api/gdpr/models/ModelsDeletionData.java) |
| `models.DeletionStatus` | [ModelsDeletionStatus](../src/main/java/net/accelbyte/sdk/api/gdpr/models/ModelsDeletionStatus.java) |
| `models.ListDeletionDataResponse` | [ModelsListDeletionDataResponse](../src/main/java/net/accelbyte/sdk/api/gdpr/models/ModelsListDeletionDataResponse.java) |
| `models.ListPersonalDataResponse` | [ModelsListPersonalDataResponse](../src/main/java/net/accelbyte/sdk/api/gdpr/models/ModelsListPersonalDataResponse.java) |
| `models.Pagination` | [ModelsPagination](../src/main/java/net/accelbyte/sdk/api/gdpr/models/ModelsPagination.java) |
| `models.PersonalData` | [ModelsPersonalData](../src/main/java/net/accelbyte/sdk/api/gdpr/models/ModelsPersonalData.java) |
| `models.RequestDeleteResponse` | [ModelsRequestDeleteResponse](../src/main/java/net/accelbyte/sdk/api/gdpr/models/ModelsRequestDeleteResponse.java) |
| `models.UserDataURL` | [ModelsUserDataURL](../src/main/java/net/accelbyte/sdk/api/gdpr/models/ModelsUserDataURL.java) |
| `models.UserPersonalData` | [ModelsUserPersonalData](../src/main/java/net/accelbyte/sdk/api/gdpr/models/ModelsUserPersonalData.java) |
| `models.UserPersonalDataResponse` | [ModelsUserPersonalDataResponse](../src/main/java/net/accelbyte/sdk/api/gdpr/models/ModelsUserPersonalDataResponse.java) |
| `response.Error` | [ResponseError](../src/main/java/net/accelbyte/sdk/api/gdpr/models/ResponseError.java) |
