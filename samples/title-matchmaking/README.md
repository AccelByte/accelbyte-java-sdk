# Title Matchmaking Sample App

A sample app to showcase simple matchmaking using AB Gaming Services, Java Extend SDK, and AWS Lambda.

## Prerequsites

* Java Development Kit (JDK) 8

* AWS SAM CLI

* A Redis host

* AccelByte Gaming Services Demo Enviroment

    * `Base URL` 
      
        https://demo.accelbyte.io

    * [Create a Game Namespace](https://docs.accelbyte.io/esg/uam/namespaces.html#tutorials) if you don't have one yet. Keep the `Namespace ID`

    * [Create an OAuth Client](https://docs.accelbyte.io/guides/access/iam-client.html) with confidential client type. Keep the `Client ID` and `Client Secret`. The OAuth Client need to have the following permissions.
        * `NAMESPACE:<namespace>:SESSIONBROWSER:SESSION` CREATE, READ, UPDATE
        * `NAMESPACE:<namespace>:USER:*:NOTIFICATION` CREATE, UPDATE
        * `NAMESPACE:<namespace>:DSM:SESSION` CREATE, READ, UPDATE
        * `NAMESPACE:<namespace>:USER` READ

        

    * Two users registered in AB Gaming Services as player #1 and player #2.

    

## Setup

### Lambda

Set the environment variables required by the lambda function in `template.yml`.

```yml
Globals:
  Function:
    Timeout: 90   # Give enough time to complete claim server process
    Environment:
        Variables:
          AB_BASE_URL: https://demo.accelbyte.io    # Base URL
          AB_CLIENT_ID: 'xxxxxxxxxx'                # Cliend ID
          AB_CLIENT_SECRET: 'xxxxxxxxxx'            # Client Secret
          AB_NAMESPACE: 'xxxxxxxxxx'                # Namespace
          REDIS_HOST: 'xxxxxxxxxx'                  # Redis host
```

### Client

Set the environment variables required by the client app before using it.

```bash
$ export AB_BASE_URL='https://demo.accelbyte.io'    # Base URL
$ export AB_CLIENT_ID='xxxxxxxxxx'                  # Cliend ID
$ export AB_CLIENT_SECRET='xxxxxxxxxx'              # Client Secret
$ export LAMBDA_URL='xxxxxxxxxx'                    # Lambda URL e.g. http://127.0.0.1:3000/title-matchmaking if running locally
```

## Usage

### Lambda

Start the lambda, in this case, locally for testing purpose.

1. Go to [lambda](lambda) folder

2. Build lambda

    ```bash
    $ sam build
    ```

3. Run lambda and keep it running

    ```bash
    $ sam local start-api       # Lambda should be available at http://127.0.0.1:3000/title-matchmaking
    ```

### Client

Start two instances of client app for player #1 and player #2 respectively.

1. Go to [client](client) folder

2. Build client app

    ```bash
    $ bash gradlew installDist
    ```

3. Run an instance of client app, enter player #1 username and password (the password will not be echoed), and keep it open

    ```bash
    $ app/build/install/app/bin/app                                                                                         
    Username: serversdk_player1@dummy.com                                                        
    Password:
    ---
    Press Ctrl+C to exit
    ...
    payload: Waiting for player 2 
    ...
    ```

4. Run another instance of client app, enter player #2 username and password (the password will not be echoed), and keep it open

    ```bash
    $ app/build/install/app/bin/app                                                                                          
    Username: serversdk_player2@dummy.com                                                        
    Password:
    ---
    Press Ctrl+C to exit
    ...
    payload: Found player 1 waiting
    ...
    ```
5. If successful both players will get messages similar to the following

    ```
    ...
    payload: Claiming server, please wait
    ...
    payload: Done, server is at 35.90.56.251:28960
    ...
    ```

## Deploy Lambda to AWS

Follow AWS SAM CLI instruction to deploy Lambda to AWS. Make sure the AWS account you use has all the required permissions. Adjust environment variables required by the lambda and the client app accordingly.

```
sam deploy --guided
```