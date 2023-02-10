<a name="v0.30.0"></a>
## [v0.30.0] - 2023-2-13

### BREAKING CHANGE

Following changes in OpenAPI spec:

1. In match2 service, due to fixing an issue in backend, the following model has been renamed and some of the field type has been changed.

   - net.accelbyte.sdk.api.match2.models.ApiMatchRuleSet.ApiMatchRuleSet -> net.accelbyte.sdk.api.match2.models.ApiRuleSetPayload.ApiRuleSetPayload