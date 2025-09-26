<a name="v0.76.0"></a>
## [v0.76.0] - 2025-09-26

### BREAKING CHANGE

### platform

- Fix wrong operation ids naming involving `QueryEntitlements` and `QueryEntitlements1`

    - Operation `net.accelbyte.sdk.api.platform.operations.entitlement.QueryEntitlements` is now `net.accelbyte.sdk.api.platform.operations.entitlement.QueryEntitlementsByItemIds`
    - Operation `net.accelbyte.sdk.api.platform.operations.entitlement.QueryEntitlements1` is now `net.accelbyte.sdk.api.platform.operations.entitlement.QueryEntitlements`