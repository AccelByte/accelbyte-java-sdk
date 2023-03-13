# Getting Started Guide for AccelByte Java Extend SDK

This guide will show you how to create a project which uses Java Extend SDK from scratch.

## Prerequisites

* AccelByte Gaming Services (demo environment):
    * Use https://demo.accelbyte.io for `AB_BASE_URL` environment variable.
    * [Create an Oauth Client](https://docs.accelbyte.io/guides/access/iam-client.html#create-a-client) with client type `Confidential`.
        * Use `Client ID` value for `AB_CLIENT_ID` environment variable.
        * Use `Client Secret` value for `AB_CLIENT_SECRET` environment variable.
* Java Development Kit (JDK) 8
* Gradle 7
* Java IDE e.g. Visual Studio Code, etc

## Tutorial

### 1. Create a Java Project

Create a folder and use `gradle init` to create a Java project.

```bash
$ mkdir getting-started
$ cd getting-started/
$ gradle init --type java-application --dsl groovy --test-framework junit-jupiter

Welcome to Gradle 7.4.2!

Here are the highlights of this release:
 - Aggregated test and JaCoCo reports
 - Marking additional test source directories as tests in IntelliJ
 - Support for Adoptium JDKs in Java toolchains

For more details see https://docs.gradle.org/7.4.2/release-notes.html

Starting a Gradle Daemon (subsequent builds will be faster)

Generate build using new APIs and behavior (some features may change in the next minor release)? (default: no) [yes, no]

Project name (default: getting-started):
Source package (default: getting.started):

> Task :init
Get more help with your project: https://docs.gradle.org/7.4.2/samples/sample_building_java_applications.html

BUILD SUCCESSFUL in 19s
2 actionable tasks: 2 executed
```

### 2. Add to Project Dependency

Add the required configuration in `build.gradle`. 

Replace `{VERSION}` with a specific release version tag from [releases](https://github.com/AccelByte/accelbyte-java-sdk/releases) without the leading `v` character.

It is recommended to use the matching Java Extend SDK version for the given AccelByte Gaming Services version.

```groovy
// build.gradle

repositories {
    mavenCentral()
    ...
}

dependencies {
    ...
    implementation 'net.accelbyte.sdk:sdk:{VERSION}'
}
```

### 3. Use in Code

Create an SDK instance, login using client credentials, and call an AccelByte Gaming Services API in `App.java`. 

The `DefaultConfigRepository` gets its values from `AB_BASE_URL`, `AB_CLIENT_ID`, and `AB_CLIENT_SECRET` environment variables.

```java
// App.java

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

        AccelByteSDK sdk = new AccelByteSDK(
                httpClient,
                tokenRepository,
                configRepository);

        // Login using client credentials

        boolean isLoginOk = sdk.loginClient();

        if (!isLoginOk) {
            System.exit(1); // Login failed
        }

        // Call an AccelByte Gaming Services endpoint e.g. GetCountryLocationV3

        OAuth20Extension wrapper = new OAuth20Extension(sdk);
        GetCountryLocationV3 operation = GetCountryLocationV3.builder()
                .build();
        OauthmodelCountryLocationResponse response = wrapper.getCountryLocationV3(operation);

        System.out.println(response.getCountryName());
    }
}
```

### 4. Run the Code

Set the required environment variables and run the code using `gradle run`.

```bash
$ export AB_BASE_URL="https://demo.accelbyte.io"              # AccelByte Gaming Services Base URL e.g. demo environment
$ export AB_CLIENT_ID="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"      # AccelByte Gaming Services OAuth Client ID
$ export AB_CLIENT_SECRET="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"  # AccelByte Gaming Services OAuth Client Secret
$ gradle run
```

## Follow Up Resources

* Java Extend SDK [README.md](https://github.com/AccelByte/accelbyte-java-sdk/blob/main/README.md)
* Reference documentation on AccelByte Gaming Services endpoints, their corresponding Java Extend SDK API, and short examples on how to use them is available in [docs](https://github.com/AccelByte/accelbyte-java-sdk/blob/main/docs)
* Sample apps which show some practical usage of Java Extend SDK are available in [samples](https://github.com/AccelByte/accelbyte-java-sdk/blob/main/samples)

## FAQ

### 1. Can I customize the default token repository and/or the default config repository?

Yes. You just need to implement the interface accordingly.

### 2. How can I use more advanced features of Java Extend SDK e.g. HTTP retry and automatic token refresh? 

See [README.md](https://github.com/AccelByte/accelbyte-java-sdk/blob/main/README.md)
