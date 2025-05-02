<a name="v0.72.0"></a>
## [v0.72.0] - 2025-05-02

### BREAKING CHANGE


### CSM

- Operation `net.accelbyte.sdk.api.csm.operations.configuration_v2.SaveSecretV2`
    - Request body model changed from `ApimodelSaveConfigurationV2Request` to `ApimodelSaveSecretConfigurationV2Request`
- Operation `net.accelbyte.sdk.api.csm.operations.configuration_v2.UpdateSecretV2`
    - Request body model changed from `ApimodelUpdateConfigurationV2Request` to `ApimodelUpdateSecretConfigurationV2Request`

### IAM

- Model `net.accelbyte.sdk.api.iam.models.ModelUserResponseV3`
    - Type changed for field `tags` from `List<String>` to `List<ModelTagDetail>`.

- Operation `net.accelbyte.sdk.api.iam.operations.users.AdminListUserIDByUserIDsV3`
    - Request body model changed from `ModelUserIDsRequest` to `ModelAdminBulkUserRequest`.
