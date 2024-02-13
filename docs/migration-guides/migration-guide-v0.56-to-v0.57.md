<a name="v0.57.0"></a>
## [v0.57.0] - 2024-02-13

### BREAKING CHANGE

### AMS
The following model(s) are updated:
- model `net.accelbyte.sdk.api.ams.models.ApiDSHistoryEvent`
   - field `gameSession` is removed

The following operation(s) has been updated:
- operation `net.accelbyte.sdk.api.ams.operations.artifacts.ArtifactGet`
   - return type changed from `List<ApiArtifactResponse>` to `ApiArtifactListResponse`

### Cloudsave
The following operation(s) has been updated:
- operation `net.accelbyte.sdk.api.cloudsave.operations.admin_game_binary_record.AdminGetGameBinaryRecordV1`
    - return type changed from `ModelsGameBinaryRecordResponse` to `ModelsGameBinaryRecordAdminResponse`
- operation net.accelbyte.sdk.api.cloudsave.operations.admin_game_binary_record.AdminListGameBinaryRecordsV1
    - return type changed from `ModelsListGameBinaryRecordsResponse` to `ModelsListGameBinaryRecordsAdminResponse`    
- operation net.accelbyte.sdk.api.cloudsave.operations.admin_game_binary_record.AdminPutGameBinaryRecordV1
    - return type changed from `ModelsGameBinaryRecordResponse` to `ModelsGameBinaryRecordAdminResponse`    
- operation net.accelbyte.sdk.api.cloudsave.operations.admin_game_binary_record.AdminGetGameBinaryRecordV1
    - return type changed from `ModelsGameBinaryRecordResponse` to `ModelsGameBinaryRecordAdminResponse`
- operation net.accelbyte.sdk.api.cloudsave.operations.admin_game_record.AdminGetGameRecordHandlerV1
    - return type changed from `ModelsGameRecordResponse` to `ModelsGameRecordAdminResponse`
- operation net.accelbyte.sdk.api.cloudsave.operations.admin_game_record.AdminPostGameRecordHandlerV1`
    - return type changed from `ModelsGameRecordResponse` to `ModelsGameRecordAdminResponse`
- operation net.accelbyte.sdk.api.cloudsave.operations.admin_game_record.AdminPutGameRecordHandlerV1
    - return type changed from `ModelsGameRecordResponse` to `ModelsGameRecordAdminResponse`

### IAM
The following operation(s) has been updated:
- operation `net.accelbyte.sdk.api.iam.operations.users.CreateUserFromInvitationV3`
    - body type changed from `ModelUserCreateFromInvitationRequestV3` to `ModelUserCreateRequestV3`
- operation net.accelbyte.sdk.api.iam.operations.users_v4.CreateUserFromInvitationV4
    - body type changed from `ModelUserCreateFromInvitationRequestV4` to `AccountCreateUserRequestV4`