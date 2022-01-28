# AccelByte Java SDK CLI

## Setup

### 1. Requirement

- Gradle
- JVM version 8 or above

### 2. Set the environment variables :
You have to declare these environment variables below:

`AB_BASE_URL` (Required)

`AB_CLIENT_ID` (Required)

`AB_CLIENT_SECRET` (Required if you use private OAuth client only)


###3. Build CLI the project using gradle:

1. Open your terminal, change your directory to this CLI project root path file where this `README.md` file located
2. execute `gradle fatJar` to build CLI project
3. Change your directory to `./build/libs` after building process successful
4. Execute cli with `java -jar cli.jar`, e.g : `java -jar cli.jar -h`

## Demo

### Login first
Before you execute the API, execute the login command first. This operation will save your access token and use it for other API call. Login command: 

`java -jar cli.jar login -u myUsername -p myPassword`

### Execute command to call the API
To call the API, the command structure will be:

`java -jar cli.jar <service name> <operation> --<parameter> <parameter value>`

example:

`java -jar cli.jar basic publicGetCountries --namespace accelbyte`


### Help
You can use help to see the parameter required or the list of the service. example:

`java -jar cli.jar -h`

or

`java -jar cli.jar iam -h`