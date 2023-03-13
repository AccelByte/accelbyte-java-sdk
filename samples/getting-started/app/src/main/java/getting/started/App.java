package getting.started;

import net.accelbyte.sdk.api.iam.models.OauthmodelCountryLocationResponse;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.GetCountryLocationV3;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20Extension;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;

public class App {
  public static void main(String[] args) throws Exception {
    // Create default HTTP client, token repository, and config repository instance

    OkhttpClient httpClient = new OkhttpClient();
    DefaultTokenRepository tokenRepository = new DefaultTokenRepository();
    DefaultConfigRepository configRepository = new DefaultConfigRepository();

    // Create SDK instance

    AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, configRepository);

    // Login using client credentials

    boolean isLoginOk = sdk.loginClient();

    if (!isLoginOk) {
      System.exit(1); // Login failed
    }

    // Call an AccelByte Gaming Services endpoint e.g. GetCountryLocationV3

    OAuth20Extension wrapper = new OAuth20Extension(sdk);
    GetCountryLocationV3 operation = GetCountryLocationV3.builder().build();
    OauthmodelCountryLocationResponse response = wrapper.getCountryLocationV3(operation);

    System.out.println(response.getCountryName());
  }
}
