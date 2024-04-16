<a name="v0.61.0"></a>
## [v0.61.0] - 2024-04-16

### BREAKING CHANGE

### AMS
The following models have been updated:
- Model `net.accelbyte.sdk.api.ams.models.ApiDevelopmentServerConfigurationCreateRequest`
    - field `CommandLine ` renamed to `commandLineArguments`.
- Model `net.accelbyte.sdk.api.ams.models.ApiDevelopmentServerConfigurationGetResponse`
    - field `CommandLine ` renamed to `commandLineArguments`.

The following operations have been updated:
- Operation `net.accelbyte.sdk.api.ams.development.DevelopmentServerConfigurationList`
    - response changed from `List<ApiDevelopmentServerConfigurationGetResponse>` to `ApiDevelopmentServerConfigurationListResponse `

### Chat
The following models have been updated:
- Model `net.accelbyte.sdk.api.chat.models.ModelsCategoryHook`
    - enum `Driver ` is removed
    - Method `getDriverAsEnum` and `setDriverFromEnum` are removed