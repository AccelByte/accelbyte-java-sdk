<a name="v0.82.0"></a>
## [v0.82.0] - 2026-07-09

### BREAKING CHANGE

### IAM Service

- Operation `net.accelbyte.sdk.api.iam.operations.o_auth.PlatformTokenRequestHandler` is renamed to `net.accelbyte.sdk.api.iam.operations.o_auth.NamespaceScopedPlatformTokenGrant`
- Wrapper method `net.accelbyte.sdk.api.iam.wrappers.OAuth.platformTokenRequestHandler(...)` is renamed to `net.accelbyte.sdk.api.iam.wrappers.OAuth.namespaceScopedPlatformTokenGrant(...)`
- Model `net.accelbyte.sdk.api.iam.models.ModelLinkRequest` is renamed to `net.accelbyte.sdk.api.iam.models.ModelReAuthRequest`
  - Wrapper method `net.accelbyte.sdk.api.iam.wrappers.Users.publicGetAsyncStatus` return type changed from `ModelLinkRequest` to `ModelReAuthRequest`
  - Wrapper method `net.accelbyte.sdk.api.iam.wrappers.Users.publicProcessWebLinkPlatformV3` return type changed from `ModelLinkRequest` to `ModelReAuthRequest`
