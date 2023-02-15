<a name="v0.31.0"></a>
## [v0.31.0] - 2023-2-28

### BREAKING CHANGE

Following changes in OpenAPI spec:

1. In lobby service, due to fixing an issue in backend, the following model has been renamed and some of the field type has been changed.

   - net.accelbyte.sdk.api.lobby.operations.{notification -> admin}.CreateTemplate
   - net.accelbyte.sdk.api.lobby.operations.{notification -> admin}.DeleteTemplateLocalization
   - net.accelbyte.sdk.api.lobby.operations.{notification -> admin}.DeleteTemplateSlug
   - net.accelbyte.sdk.api.lobby.operations.{notification -> admin}.FreeFormNotification
   - net.accelbyte.sdk.api.lobby.operations.{notification -> admin}.GetGameTemplate
   - net.accelbyte.sdk.api.lobby.operations.{notification -> admin}.GetLocalizationTemplate
   - net.accelbyte.sdk.api.lobby.operations.{notification -> admin}.etSlugTemplate
   - net.accelbyte.sdk.api.lobby.operations.{notification -> admin}.NotificationWithTemplate
   - net.accelbyte.sdk.api.lobby.operations.{notification -> admin}.PublishTemplate
   - net.accelbyte.sdk.api.lobby.operations.{notification -> admin}.UpdateLocalizationTemplate

   The corresponding wrapper methods for the above operations are also moved from `notification` to `admin`.