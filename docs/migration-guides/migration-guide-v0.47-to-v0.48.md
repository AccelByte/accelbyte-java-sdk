<a name="v0.48.0"></a>
## [v0.48.0] - 2023-10-11

### BREAKING CHANGE

Following changes in OpenAPI spec:

1. GDPR, some operations are moved to different class due to OpenAPI spec tag renaming.
   - import net.accelbyte.sdk.api.gdpr.operations.{ data_retrieval -> configuration }.DeleteAdminEmailConfiguration; 
   - import net.accelbyte.sdk.api.gdpr.operations.{ data_retrieval -> configuration }.GetAdminEmailConfiguration; 
   - import net.accelbyte.sdk.api.gdpr.operations.{ data_retrieval -> configuration }.SaveAdminEmailConfiguration; 
   - import net.accelbyte.sdk.api.gdpr.operations.{ data_retrieval -> configuration }.UpdateAdminEmailConfiguration; 
   - import net.accelbyte.sdk.api.gdpr.wrappers.{ DataRetrieval -> Configuration};

