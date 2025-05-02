# AccelByte Java SDK CLI Sample App

A command-line sample application that demonstrates how to use AccelByte Java SDK.

## Prerequsites

* Java 8
* Gradle

## Build

To build this command-line sample app, execute the following command.

```
bash gradlew installDist
```

## Usage

### Setup

The following environment variables are required by this command-line sample app.

```
export AB_BASE_URL='https://test.accelbyte.io'
export AB_CLIENT_ID='xxxxxxxxxx'
export AB_CLIENT_SECRET='xxxxxxxxxx'
```

### Login

Before invoking any service endpoints, you must first log in. The access token 
obtained during login will be stored and used for subsequent requests to 
service endpoints.

```
build/install/cli/bin/cli login -u myUsername -p myPassword
```

### Invoking a Service Endpoint

To invoke a service endpoint, use the CLI command structure shown below.

```
build/install/cli/bin/cli <service name> <operation> \
        --<parameter1> <parameter 1 value> \
        --<parameter2> <parameter 2 value> \
        --<parameter2> <parameter 3 value> \
        ...
```

For example:

```
build/install/cli/bin/cli basic publicGetCountries --namespace accelbyte
```

See this [index](./operations/index.md) for the list of services and the 
operations they support.

### Sending a Lobby WebSocket Message

To send a `lobby` WebSocket message, use the CLI command structure shown below.

```
build/install/cli/bin/cli -m $'type: acceptFriendsNotif\nfriendId: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
```

### Help

To view general help information:


```
build/install/cli/bin/cli -h
```

To view a specific help information for invoking a service endpoint, for 
example for `iam` service:

```
build/install/cli/bin/cli iam -h
```
