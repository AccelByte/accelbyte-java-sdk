# AWS Lambda Sample App (Java)

An AWS Lambda Sample App built using AccelByte Java SDK for adding statistic to a user, getting a list of statistics of a user, and deleting a statistic from a user.

## Prerequsites

*  Windows 10 WSL2 or Linux Ubuntu 20.04 with the following tools installed.
    * Java Development Kit (JDK) 8
    * Gradle 7.5.1
    * AWS SAM CLI
* AccelByte Gaming Services
    * Base URL: https://test.accelbyte.io.
    * [Create a Game Namespace](https://docs.accelbyte.io/gaming-services/services/access/reference/namespaces/manage-your-namespaces/) if you don't have one yet. Keep the `Namespace ID`.
    * [Create an OAuth Client](https://docs.accelbyte.io/gaming-services/services/access/reference/authorization/manage-access-control-for-applications/#create-an-iam-client) with confidential client type with the following permission. Keep the `Client ID` and `Client Secret`.
       - ADMIN:NAMESPACE:{namespace}:USER:*:STATITEM - CREATE,READ,DELETE
    * A user. Keep the `User ID`.
    * A statistic. Keep the `Stat Code`.
        
## Setup

Set the environment variables required by the lambda function in `template.yml`.

```yml
Globals:
  Function:
    Timeout: 20   # Give enough time to complete API calls
    Environment:
        Variables:
          AB_BASE_URL: https://test.accelbyte.io    # Base URL
          AB_CLIENT_ID: 'xxxxxxxxxx'                # Cliend ID
          AB_CLIENT_SECRET: 'xxxxxxxxxx'            # Client Secret
```

## Build and Test Locally

Start the lambda, in this case, locally for testing purpose.

1. Input credentials in `POST.json`, `GET.json`, `DELETE.json` files.
    
    ```json
    "queryStringParameters": {
        "namespace": "xxxxxxxxxx",
        "userId": "xxxxxxxxxx"
    },
    "body": "{\"statCode\": \"xxxxxxxxxx\"}"
    ```
2. Build lambda.

    ```bash
    sam build
    ```

3. Run the following command and replace `httpMethod` with POST/GET/DELETE. 

    ```bash
    sam local invoke UserStatsFunction --event ./{httpMethod}.json
    ```

## Deploy to AWS and Testing

1. Build lambda.

    ```bash
    sam build
    ```
2. Follow AWS SAM CLI instruction to deploy Lambda to AWS. Make sure the AWS account you use has all the required permissions. Adjust environment variables required by the lambda and the client app accordingly.
    ```bash
    sam deploy --guided
    ```

3. Obtain the `FunctionURL` from command line output.
Try it out. Use the your `FunctionURL`, `Namespace`, `User ID`, and `Stat Code`

    ```bash
    # Add a statistic to a user
    curl -X POST '{functionURL}?namespace={Namespace}&userId={user_id}' -H "Content-Type: application/json" -d '{"statCode":"{stat_code}"}'
    
    # Get a list of statistics of a user
    curl '{functionURL}?namespace={Namespace}&userId={user_id}'
    
    # Delete a statistic from a user
    curl -X DELETE '{functionURL}?userId={user_id}&namespace={Namespace}&statCode={stat_code}'
    ```