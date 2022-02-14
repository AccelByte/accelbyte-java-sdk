# AccelByte Java SDK

## Setup

### 1. Adding SDK to gradle file

Add this code below to `build.gradle` file on your project.
Replace `{VERSION}` with a specific release tag version and without the `v` charracter.
Check available tag in this repo <a href="https://github.com/AccelByte/accelbyte-java-sdk/releases">release tag</a>
```java
repositories {
    mavenCentral()
    maven {
        url 'https://nexus.accelbyte.net/repository/maven-releases/'
    }
}

dependencies {
    implementation 'net.accelbyte.sdk:sdk:{VERSION}'
}
```

### 2. Set the environment variables :
You have to declare these environment variables below:

`AB_BASE_URL` (Required)

`AB_CLIENT_ID` (Required)

`AB_CLIENT_SECRET` (Required if you use private OAuth client only)


## Initializing SDK
You'll have to create AccelByteConfig and AccelByteSDK object. This is the example how to create them:
    
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
boolean logout = sdk.logout();
if (!logout) {
    // unsuccessful logout handling ...
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
```

## API Covered:
All the REST-API and websocket from all AccelByte services are included

Below are the list of services covered on the SDK:
1. achievement
2. basic
3. cloudsave
4. DS Log Manager
5. DSMC
6. eventlog
7. game telemetry
8. GDPR
9. group
10. IAM
11. leaderboard
12. legal
13. lobby
14. matchmaking
15. platform
16. QoSM
17. season pass
18. session browser
19. social
20. UGC
