# AccelByte Java SDK CLI Sample App

A CLI sample app to showcase AccelByte Java SDK.

## Prerequsites

* Java 8
* Gradle

## Build

To build this CLI sample app, execute the following command.

```
bash gradlew installDist
```

## Usage

### Setup

The following environment variables are required by this CLI sample app.

```
export AB_BASE_URL='https://demo.accelbyte.io'    # Required
export AB_CLIENT_ID='xxxxxxxxxx'                  # Required
export AB_CLIENT_SECRET='xxxxxxxxxx'              # Required for confidential OAuth client only
```

### Login

Before calling any service endpoints, perform login first. Your access token will be saved and it will be used to call service endpoints.

```
build/install/cli/bin/cli login -u myUsername -p myPassword
```

### Calling a Service Endpoint

To call a service endpoint, the CLI command structure is shown below.

```
build/install/cli/bin/cli <service name> <operation> --<parameter> <parameter value>
```

For example:

```
build/install/cli/bin/cli basic publicGetCountries --namespace accelbyte
```

### Help

To see general help:


```
build/install/cli/bin/cli -h
```

To see specific help for `iam` service:

```
build/install/cli/bin/cli iam -h
```
