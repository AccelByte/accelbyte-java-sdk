# AccelByte Java SDK

## Initializing

First, you have to set environment variable :

`MY_BASE_URL` (Required)

`MY_CLIENT_ID` (Required)

`MY_CLIENT_SECRET` (Required if using private OAuth client only)

Then, you'll have to instantiate AccelByteConfig and AccelByteSDK the SDK. this is the example how to instantiate it:

```java
package example.java.co;
        
import net.accelbyte.sdk.core.AccelByteConfig;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepositoryImpl;
import net.accelbyte.sdk.core.repository.TokenRepositoryImpl;

public class Main {
   public static void main(String[] args) {
      AccelByteConfig config = new AccelByteConfig(
              new OkhttpClient(),
              TokenRepositoryImpl.getInstance(),
              new ConfigRepositoryImpl());
      AccelByteSDK sdk = new AccelByteSDK(config);
   }
}

```

## Logging In

### loginUser

```java
boolean login = sdk.loginUser("myUsername", "myPassword");
if (!login) {
    // unsuccessful login handling ...  
}
```


### loginClient (client credentials type)

```java
boolean login = sdk.loginClient();
if (!login) {
    // unsuccessful login handling ...  
}
```

## Logging Out
```java
boolean login = sdk.logout();
if (!logout) {
    // unsuccessful login handling ...
}
```

## Using the API

### Example

In this example, we will get profile info using the `GET` endpoint `/basic/v1/public/namespaces/{namespace}/users/me/profiles`

```java
package example.java.co;

import net.accelbyte.sdk.api.basic.models.UserProfilePrivateInfo;
import net.accelbyte.sdk.api.basic.operations.user_profile.GetMyProfileInfo;
import net.accelbyte.sdk.api.basic.wrappers.UserProfile;
import net.accelbyte.sdk.core.AccelByteConfig;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.ResponseException;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepositoryImpl;
import net.accelbyte.sdk.core.repository.TokenRepositoryImpl;

import java.io.IOException;

public class Main {
   public static void main(String[] args) {

      // instantiate AccelByteConfig and AccelByteSDK class
      AccelByteConfig config = new AccelByteConfig(
              new OkhttpClient(),
              TokenRepositoryImpl.getInstance(),
              new ConfigRepositoryImpl()
      );
      AccelByteSDK sdk = new AccelByteSDK(config);

      // login
      boolean login = sdk.loginUser("myUsername", "myPassword");
      if (!login) {
            System.out.println("login failed");
            return;
      }

      // initialize wrapper class
      // This example below is UserProfile group API from Basic service
      UserProfile userProfile = new UserProfile(sdk);

      try {
         // call the API
         UserProfilePrivateInfo response = userProfile.getMyProfileInfo(new GetMyProfileInfo("accelbyte"));

         // handling when get successful response
         System.out.println(response.getUserId());

      } catch (ResponseException e) { // ResponseException will occur if get unsuccessful response (e.g : 400, 401 etc)
          // handling body
          e.printStackTrace();

         // this is optional, to handle specific unsuccessful response code
         if (e.getHttpCode() == 400) {
            // handling body
         }

      } catch (IOException e) {
         // handling body
         e.printStackTrace();
      }
   }
}
