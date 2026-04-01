<a name="v0.80.0"></a>
## [v0.80.0] - 2026-04-01

### BREAKING CHANGE

#### Following changes in OpenAPI spec:

1. Basic Service
   - Operation `net.accelbyte.sdk.api.basic.operations.namespace.GetNamespaces`
     - Constructor signature changed: added required parameter `isTesting` (Boolean). Old: `GetNamespaces(Boolean activeOnly)`. New: `GetNamespaces(Boolean activeOnly, Boolean isTesting)`.

2. Challenge Service
   - Operation `net.accelbyte.sdk.api.challenge.operations.challenge_progression.AdminEvaluateProgress`
     - Constructor signature changed: added required parameter `includeOneTimeEvent` (String). Old: `AdminEvaluateProgress(String namespace, List<String> challengeCode, ModelEvaluatePlayerProgressionRequest body)`. New: `AdminEvaluateProgress(String namespace, List<String> challengeCode, String includeOneTimeEvent, ModelEvaluatePlayerProgressionRequest body)`.
   - Operation `net.accelbyte.sdk.api.challenge.operations.challenge_progression.EvaluateMyProgress`
     - Constructor signature changed: added required parameter `includeOneTimeEvent` (String). Old: `EvaluateMyProgress(String namespace, List<String> challengeCode)`. New: `EvaluateMyProgress(String namespace, List<String> challengeCode, String includeOneTimeEvent)`.
