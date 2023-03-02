<a name="v0.32.0"></a>
## [v0.32.0] - 2023-3-14

### BREAKING CHANGE

Following changes in OpenAPI spec:

- Platform

  In `net.accelbyte.sdk.api.platform.operations.iap` package the old `SyncTwitchDropsEntitlement` operation is renamed to `SyncTwitchDropsEntitlement1` and there is a new `SyncTwitchDropsEntitlement` operation which takes over but it has incompatible parameters e.g. it has no `userId` parameter.
  