package oidcweb;

import static spark.Spark.*;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.HashMap;
import net.accelbyte.sdk.api.iam.models.OauthmodelCountryLocationResponse;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.GetCountryLocationV3;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20Extension;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRefreshRepository;
import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import spark.Spark;

public class App {
  public static String PH_AB_PLATFORM_ID =
      "phantauth"; // Must match with the registered PhantAuth OIDC provider in AB Gaming Services

  public static String PH_DISCOVERY_URL = "https://phantauth.net/.well-known/openid-configuration";
  public static String PH_CLIENT_ID = "test.client";
  public static String PH_CLIENT_SECRET = "UTBcWwt6";
  public static String PH_SCOPE = "openid profile email phone address";

  public static void main(String[] args) throws Exception {
    final ObjectMapper objectMapper = new ObjectMapper();

    final OkHttpClient oidcClient = new OkHttpClient();

    final AccelByteSDK sdk =
        new AccelByteSDK(
            new OkhttpClient(), new DefaultTokenRefreshRepository(), new DefaultConfigRepository());

    port(4567);

    // index.html in public folder under resources

    Spark.staticFileLocation("/public");

    // Handler for oidcclient config request from index.html

    get(
        "/config",
        (req, res) -> {
          final HashMap<String, String> oidcConfig = new HashMap<>();

          oidcConfig.put("platform_id", PH_AB_PLATFORM_ID);
          oidcConfig.put("discovery_url", PH_DISCOVERY_URL);
          oidcConfig.put("client_id", PH_CLIENT_ID);
          oidcConfig.put("client_secret", PH_CLIENT_SECRET);
          oidcConfig.put("scope", PH_SCOPE);

          return objectMapper.writeValueAsString(oidcConfig);
        });

    // Handler for callback from PhantAuth

    get(
        "/callback",
        (req, res) -> {
          // Get auth token from PhantAuth

          final Request authTokenRequest =
              new Request.Builder()
                  .url("https://phantauth.net/auth/token")
                  .post(
                      new FormBody.Builder()
                          .add("grant_type", "authorization_code")
                          .add("client_id", PH_CLIENT_ID)
                          .add("client_secret", PH_CLIENT_SECRET)
                          .add("redirect_uri", "http://localhost")
                          .add("code", req.queryParams("code"))
                          .build())
                  .build();

          HashMap<String, String> authToken;

          try (Response authTokenResponse = oidcClient.newCall(authTokenRequest).execute()) {
            if (!authTokenResponse.isSuccessful()) {
              return "Auth token request failed!";
            }

            authToken =
                objectMapper.readValue(
                    authTokenResponse.body().string(),
                    new TypeReference<HashMap<String, String>>() {});
          }

          // Extract id_token from auth token

          final String idToken = authToken.get("id_token");

          // Check environment variables required by AccelByteSDK DefaultConfigRepository

          final ConfigRepository configRepository = sdk.getSdkConfiguration().getConfigRepository();

          if (configRepository.getBaseURL() == null
              || configRepository.getBaseURL().isEmpty()
              || configRepository.getClientId() == null
              || configRepository.getClientId().isEmpty()
              || configRepository.getClientSecret() == null
              || configRepository.getClientSecret().isEmpty()) {
            return "Missing one or more environment variables required by AccelByte SDK";
          }

          // Login to AccelByte using the corresponding OIDC provider configured in admin portal
          // (PhantAuth) and id_token we just obtained

          if (!sdk.loginPlatform("phantauth", idToken)) {
            return "Login platform failed!";
          }

          // Try to call AccelByte API after login success

          final OAuth20Extension oauth20Extension = new OAuth20Extension(sdk);
          final GetCountryLocationV3 getCountryOperation = GetCountryLocationV3.builder().build();
          final OauthmodelCountryLocationResponse getCountryResponse =
              oauth20Extension.getCountryLocationV3(getCountryOperation);

          return "Success: " + objectMapper.writeValueAsString(getCountryResponse);
        });
  }
}
