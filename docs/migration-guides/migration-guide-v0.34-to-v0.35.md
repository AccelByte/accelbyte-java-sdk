<a name="v0.34.0"></a>
## [v0.35.0] - 2023-4-27

### BREAKING CHANGE

Following changes in OpenAPI spec:

1. Lobby
   - Class `net.accelbyte.sdk.api.lobby.operations.chat.PersonalChatHistory` removed
   - Class `net.accelbyte.sdk.api.lobby.operations.chat.GetPersonalChatHistoryV1Public` removed
   - Class `net.accelbyte.sdk.api.lobby.operations.chat.PersonalChatHistory` removed

2. Platform

   - Field `net.accelbyte.sdk.api.platform.models.ItemCreate.regionData` changed the type from `Map<String, List<RegionDataItem>>` to `Map<String, List<RegionDataItemDTO>>`
   - Method `net.accelbyte.sdk.api.platform.wrappers.DLC.getUserDLC` changed the return value from `UserDLCRecord` to `List<UserDLCRecord>`

3. UGC

   - Class `net.accelbyte.sdk.api.ugc.operations.admin_content.AdminUpdateContentS3.AdminUpdateContentS3` change `body` param from `ModelsUpdateContentRequest` to `ModelsAdminUpdateContentRequest`
   - Class `net.accelbyte.sdk.api.ugc.operations.admin_content.SingleAdminUpdateContentS3` change `body` param from `ModelsUpdateContentRequest` to `ModelsAdminUpdateContentRequest`
