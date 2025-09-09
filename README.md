# AccelByte Java SDK

A software development kit (SDK) for interacting with AccelByte services written in Java.

This SDK was generated from OpenAPI spec included in the [spec](spec) directory.

## Setup

This SDK is developed using JDK 8 and Gradle 7.5.

### Gradle

Add the required configuration in `gradle.build`. Replace `{VERSION}` with 
a specific release version tag from [releases](https://github.com/AccelByte/accelbyte-java-sdk/releases) 
without the leading `v` character.

#### For v0.18.0 and later

The artifacts are published in Maven Central.

```java
repositories {
   mavenCentral()
}

dependencies {
   implementation 'net.accelbyte.sdk:sdk:{VERSION}'
}
```

#### For v0.17.0 and earlier

The artifacts are moved to AccelByte Internal Nexus. You need to request for `{USERNAME}` and `{PASSWORD}` to be able to access it.

```java
repositories {
   mavenCentral()
   maven {
      url 'https://nexus.tools.accelbyte.net/repository/maven-releases/'
      credentials {
         username = '{USERNAME}'
         password = '{PASSWORD}'
      }
   }
}

dependencies {
   implementation 'net.accelbyte.sdk:sdk:{VERSION}'
}
```

### Environment Variables

The following environment variables need to be set when using `DefaultConfigRepository`.

| Name               | Required                                              | Example                          |
|--------------------|-------------------------------------------------------|----------------------------------|
| `AB_BASE_URL`      | Yes                                                   | https://test.accelbyte.io        |
| `AB_CLIENT_ID`     | Yes                                                   | abcdef0123456789abcdef0123456789 |
| `AB_CLIENT_SECRET` | Yes, but only if you use a confidential `AB_CLIENT_ID`| ab#c,d)ef(ab#c,d)ef(ab#c,d)ef(ab |

## Usage

### Instantiation

#### With Default HTTP Client (OkhttpClient)

Use the following to get SDK instance with basic HTTP functionality.
    
```java
AccelByteConfig config = new AccelByteConfig(
      new OkhttpClient(),
      DefaultTokenRepository.getInstance(),
      new DefaultConfigRepository());     // Using DefaultConfigRepository, make sure the required environment variables are set

AccelByteSDK sdk = new AccelByteSDK(config);
```

#### With Reliable HTTP client

Use the following to get SDK instance with HTTP retry functionality.

```java
final DefaultHttpRetryPolicy retryPolicy = new DefaultHttpRetryPolicy();

retryPolicy.setCallTimeout(3000);   // In milliseconds
retryPolicy.setMaxRetry(3);
retryPolicy.setRetryInterval(2000);    // In milliseconds
retryPolicy.setRetryIntervalType(RetryIntervalType.LINEAR);    // LINEAR, EXPONENTIAL are available

private final ReliableHttpClient reliableHttpClient = new ReliableHttpClient(retryPolicy);

AccelByteConfig config = new AccelByteConfig(
      reliableHttpClient,
      DefaultTokenRepository.getInstance(),
      new DefaultConfigRepository());     // Using DefaultConfigRepository, make sure the required environment variables are set

AccelByteSDK sdk = new AccelByteSDK(config);
```

#### Automatic Token Refresh

Use the following to get SDK instance with automatic token refresh which is checked and performed periodically.

```java
AccelByteConfig config =  AccelByteConfig.getDefault() //use default configuration
   .useBackgroundTokenRefresh(); // use background token refresh.

//use configuration object when creating the sdk object.
AccelByteSDK sdk = new AccelByteSDK(config);
```

To configure background token refresh, set the following environment variables.

| Name                             | Required | Description                                                                                    |
|----------------------------------|--------- |------------------------------------------------------------------------------------------------|
| `AB_REFRESH_RATE`                | No       | Fraction of token lifetime before it is refreshed. Value between`0.0` to `1.0`. Default: `0.8` |
| `AB_REFRESH_MAX_RETRY`           | No       | Maximum number of retries for refresh token requests before failing. Default: `2`              |
| `AB_REFRESH_BACKGROUND_INTERVAL` | No       | Timer interval (in seconds) to check token expiry. Default: `10`                               |
| `AB_REFRESH_BACKGROUND_ENABLED`  | No       | Enables background token refresh. Default: `true`                                              |

NOTE: The `AB_REFRESH_RATE` uses a float value between `0` and `1` representing the fraction of the token's lifetime. For example, if a token is valid for 1 hour (3600 seconds), and `AB_REFRESH_RATE` is set to `0.5`, the SDK will attempt to refresh the token after it has less than 1800 seconds remaining (3600 x 0.5).

Background token refresh runs on a timer at a specified interval to check for token expiry. If the token is nearing its expiration time (as determined by the `AB_REFRESH_RATE` value), it will be refreshed automatically.

If a periodic background process is not preferred, use .useOnDemandTokenRefresh() instead. This method triggers automatic token refresh whenever the SDK calls any AGS endpoint.
Please note that this type of token refresh is recommended only for OAuth client logins (using the LoginClient method), as it relies solely on the configured client ID and client secret values. It can be used for other login types, but once the refresh token expires, any subsequent calls will be unauthorized.
    
```java
AccelByteConfig config =  AccelByteConfig.getDefault() //use default configuration
   .useOnDemandTokenRefresh(); // use on-demand token refresh.

//use configuration object when creating the sdk object.
AccelByteSDK sdk = new AccelByteSDK(config);
```

To configure on-demand token refresh, set the following environment variables.

| Name                          | Required | Description                                                                                    |
|-------------------------------|--------- |------------------------------------------------------------------------------------------------|
| `AB_REFRESH_RATE`             | No       | Fraction of token lifetime before it is refreshed. Value between`0.0` to `1.0`. Default: `0.8` |
| `AB_REFRESH_MAX_RETRY`        | No       | Maximum number of retries for refresh token requests before failing. Default: `2`              |
| `AB_REFRESH_ONDEMAND_ENABLED` | No       | Enables token refresh. Default: `true`                                                         |

NOTE: Avoid using both `.useOnDemandTokenRefresh()` and `.useBackgroundTokenRefresh()` together, as it introduces unnecessary overhead and may lead to unexpected behavior.

```

#### Local Token Validation

To enable local token validation, use the following when instantiating the SDK. When enabled, the SDK instance will cache JWKS and revocation list for performing token validation so that it does not have to call AccelByte Gaming Services endpoint each time. See [Validate Access Token](#validate-access-token) section on how to validate token using SDK.

```java
final DefaultConfigRepository defaultConfigRepository = new DefaultConfigRepository();    // Using DefaultConfigRepository, make sure the required environment variables are set

defaultConfigRepository.setLocalTokenValidationEnabled(true);     // Enable local token validation
defaultConfigRepository.setJwksRefreshInterval(300);    // Refresh JWKS for local token validation every 5 minutes
defaultConfigRepository.setRevocationListRefreshInterval(300);    // Refresh revocation list for local token validation every 5 minutes

AccelByteConfig config = new AccelByteConfig(
      new OkhttpClient(),
      DefaultTokenRepository.getInstance(),
      defaultConfigRepository);

AccelByteSDK sdk = new AccelByteSDK(config);
```

### Login

#### Login Using Username and Password

```java
boolean login = sdk.loginUser("myUsername", "myPassword");

if (!login) {
    // Login failed  
}
```

#### Login Using Username and Password with Specific Scope

```java
boolean login = sdk.loginUser("myUsername", "myPassword", "scopeA scopeB");   // Space separated scope values

if (!login) {
    // Login failed  
}
```

#### Login Using OAuth Client

```java
boolean login = sdk.loginClient();

if (!login) {
    // Login failed   
}
```

> :warning: **Please use loginClient() function with confidential OAuth client:** Using loginClient() function with public OAuth client is not supported.

### Validate Access Token

To validate if an access token is valid and has the required permission, use the `ValidateToken` method of `AccelByteSDK` instance. To validate an access token without validating the required permission, omit the optional `permission` and `action` parameters of `ValidateToken` method. By default, remote token validation is performed. However, if higher throughput is required, you may enable local token validation as mentioned in [Local Token Validation](#local-token-validation) section. With local token validation, token validation will be quicker at the expense of delayed revocation list update (a revoked token may still be regarded as valid until local cache of the revocation list is updated).

```java
boolean isOk = sdk.validateToken("token", "ADMIN:NAMESPACE:serversdktest:INFORMATION:USER:abdedef", 2);  // Validate token

if (isOk) {
    // Token is valid and has the required permission
}
else {
   // Token is not valid or expired or does not have the required permission
}
```

### Parse Access Token

Use the following to parse access token and get its payload.
```java
AccessTokenPayload payload = sdk.parseAccessToken("access token", false);

// Or if token validation is required before parsing, then use the following

AccessTokenPayload payload = sdk.parseAccessToken("access token", true);
```
The `payload` will be null if the parse failed or when validation is required, and it failed.


### Interacting with a Service Endpoint

As an example, we will get current user profile info using [getMyProfileInfo](https://docs.accelbyte.io/api-explorer/#Basic/getMyProfileInfo) endpoint available in [basic](https://docs.accelbyte.io/api-explorer/#Basic) service.

```java
// Login using username and password

boolean login = sdk.loginUser("myUsername", "myPassword");

if (!login) {
      System.out.println("login failed");
      return;
}

// Instantiate UserProfile wrapper class which is part of basic service

UserProfile userProfile = new UserProfile(sdk);

try {
   // Make a call to getMyProfileInfo endpoint
   UserProfilePrivateInfo response = userProfile
         .getMyProfileInfo(new GetMyProfileInfo("accelbyte"));

   System.out.println(response.getUserId());    // Success response

} catch (HttpResponseException e) {     // Error response from the service
   e.printStackTrace();

   if (e.getHttpCode() == 400) {
      // Handle specific error response HTTP code
   }

} catch (IOException e) {     // Network error
   e.printStackTrace();    
}
```

### Refresh Token Manually

```java
boolean isOk = sdk.refreshToken();  // Trigger token refresh manually when not using automatic token refresh functionality

if (isOk) {
    // Refresh token is succesful or not required
}
else {
   // Refresh token failed
}
```

### Logout

```java
boolean logout = sdk.logout();

if (!logout) {
    // Logout failed
}
```

### Websocket
- **Automatic Ping Interval:** by default, automatic ping frames are not sent.  

    To enable the feature, for the LobbyWebSocketClient.create() call, simply pass in:
    - `pingIntervalMs` > 0 to set the number of seconds between each automatic ping (until the connection is closed) 
    - `pingIntervalMs` = 0 means disabled

- **Websocket Reconnection:**  Websocket Reconnection is a feature to help support auto-reconnection on websocket disconnects resulting from RFC 6455 status codes between 1001 to 2999. By default, the feature is off.  

    To enable the feature, for the LobbyWebSocketClient.create() call, simply pass in: 
    - `reconnectDelayMs` > 0 to control the delay between each reconnect attempt (with exponential backoff)  
    - `reconnectDelayMs` = 0 means disabled
    - `maxNumReconnectAttempts` to control the maximum number of reconnection attempts
    - `maxNumReconnectAttempts` = -1 means unlimited reconnect attempts (`reconnectDelayMs` must be > 0 to enable)

Example:
```java
final WebSocketListener listener =
    new WebSocketListener() {
        @Override
        public void onMessage(@NotNull WebSocket webSocket, @NotNull String text) {
            log.info("Received onMessage: " + text);
            ...
        }
    };

final int RECONNECT_DELAY_MS = 60000;  // 1m (0 to disable)
final int MAX_NUM_RECONNECT_ATTEMPTS = 10; // -1 for unlimited reconnect attempts (RECONNECT_DELAY_MS must be > 0 to enable)

final int PING_INTERVAL_MS = 30000;  // 30s (0 to disable)

final LobbyWebSocketClient ws =
        LobbyWebSocketClient.create(
            new DefaultConfigRepository(), DefaultTokenRepository.getInstance(), listener, RECONNECT_DELAY_MS, MAX_NUM_RECONNECT_ATTEMPTS, PING_INTERVAL_MS);

ws.connect();

final String requestMessage = PartyCreateRequest.builder().id(request_id).build().toWSM();
ws.sendMessage(requestMessage);
...
```
**Lobby session preservation logic upon reconnect:**
In the event of a disconnection and a reconnection, the previous lobby session id will be requested for reuse via the "X-Ab-LobbySessionID" header with the cached value from the previous lobby session.
## Samples

Sample apps are available in the [samples](samples) directory.

## Documentation

Reference about AccelByte service endpoints and their corresponding SDK API is available in [docs/operations](docs/operations) directory.

For more information on how to use AccelByte services and SDKs, see [docs.accelbyte.io](https://docs.accelbyte.io/).
