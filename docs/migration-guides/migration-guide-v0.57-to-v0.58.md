<a name="v0.58.0"></a>
## [v0.58.0] - 2024-02-26

### BREAKING CHANGE

### Cloudsave
The following operations are moved to a different package as follows:
- `net.accelbyte.sdk.cli.api.cloudsave.operations.{tags->admin_tags}.AdminDeleteTagHandlerV1`
- `net.accelbyte.sdk.cli.api.cloudsave.operations.{tags->admin_tags}.AdminListTagsHandlerV1`
- `net.accelbyte.sdk.cli.api.cloudsave.operations.{tags->admin_tags}.AdminPostTagHandlerV1` 

- `net.accelbyte.sdk.cli.api.cloudsave.operations.{tags->public_tags}.PublicListTagsHandlerV1`

### IAM
The following operations have been updated:
- operation `net.accelbyte.sdk.api.iam.operations.users.PublicPartialUpdateUserV3`
  - body type changed from `ModelUserUpdateRequestV3` to `ModelPublicUserUpdateRequestV3`
- operation `net.accelbyte.sdk.api.iam.operations.users.UpdateUserV3`
  - body type changed from `ModelUserUpdateRequestV3` to `ModelPublicUserUpdateRequestV3`
- operation `net.accelbyte.sdk.api.iam.operations.users_v4.PublicUpdateUserV4`
  - body type changed from `ModelUserUpdateRequestV3` to `ModelPublicUserUpdateRequestV3`