<a name="v0.53.0"></a>
## [v0.53.0] - 2023-12-19

### BREAKING CHANGE

### AMS
The following model(s) are renamed.
```
- net.accelbyte.sdk.api.ams.models.{ ApiArtifactSamplingRuleResponse -> ApiArtifactSamplingRule }
```

### Platform
The following model(s) are renamed.
```
- net.accelbyte.sdk.api.platform.models.{ IAPClawbackPagingSlicedResult -> TradeActionPagingSlicedResult }
```

### Session
The following operation(s) has been updated.
- Operation `AccelByte.Sdk.Api.Session.Operation.GetSessionServerSecret`
   - Request body is removed.

### Social
The following operations are moved to a different package and the corresponding wrapper methods follows.
```
- package net.accelbyte.sdk.api.social.operations.{ stat_configuration -> stat_cycle_configuration }.ImportStatCycle
```
