package ext.sample;

import net.accelbyte.sdk.core.AccelByteConfig;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRefreshRepository;

public class Main {

  // If you run this sample outside the java sdk project
  // Please read the note in settings.gradle (samples/login-or-refresh/settings.gradle) for this
  // project
  public static void main(String[] args) {
    DefaultConfigRepository configRepo = new DefaultConfigRepository();
    // must use this if you want to use LoginOrRefresh
    DefaultTokenRefreshRepository refreshRepo = new DefaultTokenRefreshRepository();
    AccelByteConfig config = new AccelByteConfig(new OkhttpClient(), refreshRepo, configRepo);
    AccelByteSDK sdk = new AccelByteSDK(config);
    boolean result =
        sdk.loginOrRefreshUser(System.getenv("AB_USERNAME"), System.getenv("AB_PASSWORD"));
    System.out.println("login success: " + result);
  }
}
