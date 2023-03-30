<a name="v0.34.0"></a>
## [v0.33.0] - 2023-4-11

### BREAKING CHANGE

Following changes in OpenAPI spec:

1. Legal

  - Method `net.accelbyte.sdk.api.legal.wrappers.Agreement.retrieveAllUsersByPolicyVersion` change return values from.`List<PagedRetrieveUserAcceptedAgreementResponse>` to `PagedRetrieveUserAcceptedAgreementResponse`

2. UGC

  - Class `net.accelbyte.sdk.api.ugc.operations.public_channel.UpdateChannel.UpdateChannel` change builder body param from `ModelsChannelRequest` to `ModelsUpdateChannelRequest`
  - Class `net.accelbyte.sdk.api.ugc.operations.public_channel.CreateChannel` changed `net.accelbyte.sdk.api.ugc.operations.public_channel.PublicCreateChannel`
  - Method `net.accelbyte.sdk.api.ugc.wrappers.PublicChannel.createChannel` changed to `net.accelbyte.sdk.api.ugc.wrappers.PublicChannel.publicCreateChannel`
  - Class `net.accelbyte.sdk.api.ugc.operations.admin_channel.SingleAdminUpdateChannel` change builder body param from `ModelsChannelRequest` to `ModelsUpdateChannelRequest`
  - Class `net.accelbyte.sdk.api.ugc.operations.admin_channel.AdminUpdateChannel` change builder body param from `ModelsChannelRequest` to `ModelsUpdateChannelRequest`
  - Class `net.accelbyte.sdk.api.ugc.operations.admin_content.AdminUpdateContentS3` change builder body param from `ModelsContentRequest` to `ModelsUpdateContentRequest`
  - Class `net.accelbyte.sdk.api.ugc.operations.admin_content.SingleAdminUpdateContentS3` change builder body param from `ModelsContentRequest` to `ModelsUpdateContentRequest`
  - Class `net.accelbyte.sdk.api.ugc.operations.public_content.CreateContentS3` change builder body param from `ModelsCreateContentRequestS3` to `ModelsPublicCreateContentRequestS3`
  - Class `net.accelbyte.sdk.api.ugc.operations.public_content.UpdateContentS3` change builder body param from `ModelsContentRequest` to `ModelsUpdateContentRequest`


3. Platform

   - Class changed from `net.accelbyte.sdk.api.platform.operations.revocation.GetPaymentCallbackConfig1`  to `net.accelbyte.sdk.api.platform.operations.revocation.GetRevocationConfig`
   - Method `net.accelbyte.sdk.api.platform.wrappers.CatalogChanges.queryChanges` return valeu changed from `List<CatalogChangePagingSlicedResult> ` to `CatalogChangePagingSlicedResult`