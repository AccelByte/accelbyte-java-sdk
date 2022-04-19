# AccelByte Java SDK CLI

A CLI sample app to showcase AccelByte Java SDK.

## Prerequsites

- Java 8 or above

## Building

1. Change your working directory to this CLI project root path where this `README.md` file located
2. Execute `gradlew installDist` to build CLI project

## Setup

This CLI sample app requires the following environment variables to be declared.

* `AB_BASE_URL` (Required)

* `AB_CLIENT_ID` (Required)

* `AB_CLIENT_SECRET` (Required if you use confidential OAuth client only)

## Usage

### Login
Before you execute the API, execute the login command first. This operation will save your access token and use it for the next API call.

```
build\install\cli\bin login -u myUsername -p myPassword
```

### Calling a Service Endpoint

To call a service endpoint, the CLI command structure is shown below.

```
build\install\cli\bin <service name> <operation> --<parameter> <parameter value>
```

Example:

```
build\install\cli\bin basic publicGetCountries --namespace accelbyte
```

### Help

You can use help to see the parameter required or the list of services.

```
build\install\cli\bin -h
```

or

```
build\install\cli\bin iam -h
```
