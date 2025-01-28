# Tic Tac Toe Sample App

A sample app to showcase a simple tic tac toe game using AB Gaming Services, Java Extend SDK, and AWS Lambda.

## Prerequsites

* Java Development Kit (JDK) 8

* AWS SAM CLI

* A Redis host

* AccelByte Gaming Services Demo Enviroment

    * `Base URL` 
      
      For example https://test.accelbyte.io

    * [Create a Game Namespace](https://docs.accelbyte.io/gaming-services/services/access/reference/namespaces/manage-your-namespaces/) if you don't have one yet. Keep the `Namespace ID`
        

    * Two users registered in AB Gaming Services as player #1 and player #2.

    

## Setup

### Lambda

Set the environment variables required by the lambda function in `template.yml`.

```yml
Globals:
  Function:
    Timeout: 60   # Give enough time to complete API calls
    Environment:
        Variables:
          AB_BASE_URL: https://test.accelbyte.io    # Base URL
          AB_CLIENT_ID: 'xxxxxxxxxx'                # Cliend ID
          AB_CLIENT_SECRET: 'xxxxxxxxxx'            # Client Secret
          AB_NAMESPACE: 'xxxxxxxxxx'                # Namespace
          REDIS_HOST: 'xxxxxxxxxx'                  # Redis host
```

### Client

Set the environment variables required by the client app before using it.

```bash
$ export AB_BASE_URL='https://test.accelbyte.io'    # Base URL
$ export AB_CLIENT_ID='xxxxxxxxxx'                  # Cliend ID
$ export AB_CLIENT_SECRET='xxxxxxxxxx'              # Client Secret
$ export LAMBDA_URL='xxxxxxxxxx'                    # Lambda URL e.g. http://127.0.0.1:3000/tictactoe if running locally
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
    $ sam local start-api       # Lambda should be available at http://127.0.0.1:3000/tictactoe
    ```

### Client

Start two instances of client app for player #1 and player #2 respectively.

1. Go to [client](client) folder.

2. Build client app.

    ```bash
    $ bash gradlew installDist
    ```

3. Run an instance of client app, enter player #1 username and password (the password will not be echoed), and keep it open. If there is an existing game, you will be asked whether you want to clear it first.

    ```bash
    $ app/build/install/app/bin/app                                                                                         
    Username: serversdk_player1@dummy.com
    Password: 
    Press Ctrl+C to exit
    Waiting for player 2
    ...
    ```

4. Run another instance of client app, enter player #2 username and password (the password will not be echoed), and keep it open. The game will start and player #1 is given a chance to move first.

    ```bash
    $ app/build/install/app/bin/app                                                                                          
    Username: serversdk_player2@dummy.com
    Password: 
    Press Ctrl+C to exit
    Player 1 moves first
    ...
    ```
5. If successful both players will be able to play tic tac toe over the internet.

    ```
    ...
    +―――+―――+―――+
    | 1 | 2 | 3 |
    +―――+―――+―――+
    | 4 | 5 | 6 |
    +―――+―――+―――+
    | 7 | 8 | 9 |
    +―――+―――+―――+

    Your move (X): 5

    +―――+―――+―――+
    | 1 | 2 | 3 |
    +―――+―――+―――+
    | 4 | X | 6 |
    +―――+―――+―――+
    | 7 | 8 | 9 |
    +―――+―――+―――+

    Waiting for response
    ...
    ```

## Deploy Lambda to AWS

Follow AWS SAM CLI instruction to deploy Lambda to AWS. Make sure the AWS account you use has all the required permissions. Adjust environment variables required by the lambda and the client app accordingly.

```
sam deploy --guided
```
