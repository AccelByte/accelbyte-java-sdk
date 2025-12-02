#!/usr/bin/env bash

# Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

# Code generated. DO NOT EDIT.

# Meta:
# - random seed: 256
# - template file: cli_test.j2

# Instructions:
# - Run the Justice SDK Mock Server first before running this script.

export AB_BASE_URL="http://127.0.0.1:8080"
export AB_CLIENT_ID="admin"
export AB_CLIENT_SECRET="admin"
export AB_NAMESPACE="test"

EXIT_CODE=0

eval_tap() {
  if [ $1 -eq 0 ]; then
    echo "ok $2 - $3"
  else
    EXIT_CODE=1
    echo "not ok $2 - $3"
    sed 's/^/# /g' $4
  fi
  rm -f $4
}

chmod +x ./ng
trap "./ng ng-stop" EXIT
java -jar build/install/cli/lib/nailgun-server-*.jar 1>&2 &
(for i in $(seq 1 100); do bash -c "timeout 1 echo > /dev/tcp/127.0.0.1/2113" 2>/dev/null && exit 0 || sleep 1; done; exit 1) || exit 1
for JAR in build/install/cli/lib/*.jar; do ./ng ng-cp $JAR 1>&2; done
./ng ng-cp 1>&2

echo "TAP version 13"
echo "1..74"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetAppListV1
eval_tap 0 2 'GetAppListV1 # SKIP deprecated' test.out

#- 3 GetAppV1
eval_tap 0 3 'GetAppV1 # SKIP deprecated' test.out

#- 4 CreateAppV1
eval_tap 0 4 'CreateAppV1 # SKIP deprecated' test.out

#- 5 DeleteAppV1
eval_tap 0 5 'DeleteAppV1 # SKIP deprecated' test.out

#- 6 UpdateAppV1
eval_tap 0 6 'UpdateAppV1 # SKIP deprecated' test.out

#- 7 CreateDeploymentV1
eval_tap 0 7 'CreateDeploymentV1 # SKIP deprecated' test.out

#- 8 GetAppImageListV1
eval_tap 0 8 'GetAppImageListV1 # SKIP deprecated' test.out

#- 9 DeleteAppImagesV1
eval_tap 0 9 'DeleteAppImagesV1 # SKIP deprecated' test.out

#- 10 GetAppReleaseV1
./ng net.accelbyte.sdk.cli.Main csm getAppReleaseV1 \
    --app 'EAxcVpFrttufHIRd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'GetAppReleaseV1' test.out

#- 11 GetListOfSecretsV1
eval_tap 0 11 'GetListOfSecretsV1 # SKIP deprecated' test.out

#- 12 SaveSecretV1
eval_tap 0 12 'SaveSecretV1 # SKIP deprecated' test.out

#- 13 UpdateSecretV1
eval_tap 0 13 'UpdateSecretV1 # SKIP deprecated' test.out

#- 14 DeleteSecretV1
eval_tap 0 14 'DeleteSecretV1 # SKIP deprecated' test.out

#- 15 StartAppV1
eval_tap 0 15 'StartAppV1 # SKIP deprecated' test.out

#- 16 StopAppV1
eval_tap 0 16 'StopAppV1 # SKIP deprecated' test.out

#- 17 GetListOfVariablesV1
eval_tap 0 17 'GetListOfVariablesV1 # SKIP deprecated' test.out

#- 18 SaveVariableV1
eval_tap 0 18 'SaveVariableV1 # SKIP deprecated' test.out

#- 19 UpdateVariableV1
eval_tap 0 19 'UpdateVariableV1 # SKIP deprecated' test.out

#- 20 DeleteVariableV1
eval_tap 0 20 'DeleteVariableV1 # SKIP deprecated' test.out

#- 21 GetListOfDeploymentV1
eval_tap 0 21 'GetListOfDeploymentV1 # SKIP deprecated' test.out

#- 22 GetDeploymentV1
eval_tap 0 22 'GetDeploymentV1 # SKIP deprecated' test.out

#- 23 DeleteDeploymentV1
eval_tap 0 23 'DeleteDeploymentV1 # SKIP deprecated' test.out

#- 24 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main csm publicGetMessages \
    > test.out 2>&1
eval_tap $? 24 'PublicGetMessages' test.out

#- 25 GetAppListV2
./ng net.accelbyte.sdk.cli.Main csm getAppListV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '59' \
    --body '{"appNames": ["9UzVRiXbqlAw7r6W", "2ktQG0h5JAav5kRa", "62WopBJHPtcDs8bB"], "appStatuses": ["ZLCXLx8bbgorQeFb", "Q1g7qbPngUNB1vRo", "dwpzS6DaDpv8N7ZQ"], "fuzzyAppName": "VqGj6oDLjWjkY1aX", "scenario": "lFcDtgOjchIua5tW"}' \
    > test.out 2>&1
eval_tap $? 25 'GetAppListV2' test.out

#- 26 GetAppV2
./ng net.accelbyte.sdk.cli.Main csm getAppV2 \
    --app 'EIC32ogW7olvbTgr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'GetAppV2' test.out

#- 27 CreateAppV2
./ng net.accelbyte.sdk.cli.Main csm createAppV2 \
    --app 'hRTcPiSuL0Sly6XM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 50}, "cpu": {"requestCPU": 83}, "description": "E3cwyALczNIicXm7", "memory": {"requestMemory": 0}, "replica": {"maxReplica": 100, "minReplica": 13}, "scenario": "BZqxYG3aREAu2D6Q", "vmSharingConfiguration": "VKNCWP75TB0i7pKx"}' \
    > test.out 2>&1
eval_tap $? 27 'CreateAppV2' test.out

#- 28 DeleteAppV2
./ng net.accelbyte.sdk.cli.Main csm deleteAppV2 \
    --app 'R8dl0zRVW4EZG9m0' \
    --namespace "$AB_NAMESPACE" \
    --forced 'XcgGVbMqSszE8GHa' \
    > test.out 2>&1
eval_tap $? 28 'DeleteAppV2' test.out

#- 29 UpdateAppV2
./ng net.accelbyte.sdk.cli.Main csm updateAppV2 \
    --app 'vj7AorKsxwkosAVe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "rXpc1C8XfwHuKeb9"}' \
    > test.out 2>&1
eval_tap $? 29 'UpdateAppV2' test.out

#- 30 CreateSubscriptionHandler
./ng net.accelbyte.sdk.cli.Main csm createSubscriptionHandler \
    --app 'l3rGN9A3sNm84hdd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"topicNames": ["SpHt0P7MIIR7CkyF", "6C7duuyZ0GhDogqr", "hBRd8lDR6qVNPRZY"]}' \
    > test.out 2>&1
eval_tap $? 30 'CreateSubscriptionHandler' test.out

#- 31 UnsubscribeTopicHandler
./ng net.accelbyte.sdk.cli.Main csm unsubscribeTopicHandler \
    --app 'dFLIAjGGJddVCvu9' \
    --namespace "$AB_NAMESPACE" \
    --topicName 'vx5KQ7KYnIuMBvaO' \
    > test.out 2>&1
eval_tap $? 31 'UnsubscribeTopicHandler' test.out

#- 32 CreateDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm createDeploymentV2 \
    --app '35llzQRaT5kPxUfo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"imageTag": "fvnnSuB0y5WUlrMd"}' \
    > test.out 2>&1
eval_tap $? 32 'CreateDeploymentV2' test.out

#- 33 GetAppImageListV2
./ng net.accelbyte.sdk.cli.Main csm getAppImageListV2 \
    --app 'I4sNveabntBSxTeI' \
    --namespace "$AB_NAMESPACE" \
    --cached 'v53HGCiljvjKoyD6' \
    > test.out 2>&1
eval_tap $? 33 'GetAppImageListV2' test.out

#- 34 DeleteAppImagesV2
./ng net.accelbyte.sdk.cli.Main csm deleteAppImagesV2 \
    --app 'SCwGrncqmLtjQHAf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"imageTags": ["8TgoNm03VLisV6zw", "Puo3td6TC6I3lMjG", "SWN2laRlxfcjHfYa"]}' \
    > test.out 2>&1
eval_tap $? 34 'DeleteAppImagesV2' test.out

#- 35 CreateNoSQLDatabaseCredentialV2
./ng net.accelbyte.sdk.cli.Main csm createNoSQLDatabaseCredentialV2 \
    --app 'kUCTqGkE7wcWfDsl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"password": "pJSqGAXQ0yYoNRKd", "username": "3IL5TAQ6iiPlSC2u"}' \
    > test.out 2>&1
eval_tap $? 35 'CreateNoSQLDatabaseCredentialV2' test.out

#- 36 GetNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLDatabaseV2 \
    --app 'E4o5Vwdo3fePqIJA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'GetNoSQLDatabaseV2' test.out

#- 37 CreateNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm createNoSQLDatabaseV2 \
    --app '8IHtrkmu0hpDDWVA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"dbName": "la2l5BYNtIuS5S5X", "password": "UdjsoqwGyzzWi9gw", "username": "QYv7t1o7TTr1Dmrh"}' \
    > test.out 2>&1
eval_tap $? 37 'CreateNoSQLDatabaseV2' test.out

#- 38 DeleteNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm deleteNoSQLDatabaseV2 \
    --app 'Zv15T7quIOvBMcaY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'DeleteNoSQLDatabaseV2' test.out

#- 39 UpdateAppResourcesV2
./ng net.accelbyte.sdk.cli.Main csm updateAppResourcesV2 \
    --app 'mvCkGZ5dAgqxpBFm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 1}, "cpu": {"requestCPU": 44}, "memory": {"requestMemory": 77}, "replica": {"maxReplica": 48, "minReplica": 29}, "vmSharingConfiguration": "JMdalwSyliWMNW5N"}' \
    > test.out 2>&1
eval_tap $? 39 'UpdateAppResourcesV2' test.out

#- 40 UpdateAppResourcesResourceLimitFormV2
./ng net.accelbyte.sdk.cli.Main csm updateAppResourcesResourceLimitFormV2 \
    --app 'yLu0M3VHh2EI8JlD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientEmail": "bPWbQ6Q9lNmqRBaA", "preferredLimitReplica": 20, "requestReason": "Xi3choQrpOsDBU5S"}' \
    > test.out 2>&1
eval_tap $? 40 'UpdateAppResourcesResourceLimitFormV2' test.out

#- 41 GetListOfSecretsV2
./ng net.accelbyte.sdk.cli.Main csm getListOfSecretsV2 \
    --app 'epjChB3V0v52Dlym' \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 41 'GetListOfSecretsV2' test.out

#- 42 SaveSecretV2
./ng net.accelbyte.sdk.cli.Main csm saveSecretV2 \
    --app 'KXNB3Gv0IqmF51Tk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"configName": "hjYnaq6foWvXa3bM", "description": "rXsDr6kILsSSyDdm", "source": "ykmoPYgc2L4jk4Lo", "value": "0LSP0pf4IxjUkl53"}' \
    > test.out 2>&1
eval_tap $? 42 'SaveSecretV2' test.out

#- 43 UpdateSecretV2
./ng net.accelbyte.sdk.cli.Main csm updateSecretV2 \
    --app '5X3ateEKDpADz1x3' \
    --configId 'poD3Qgb3boLQQ1Mz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "H7Qm8bwbmXgdAPh1", "value": "EThG96gAFKK2WDgC"}' \
    > test.out 2>&1
eval_tap $? 43 'UpdateSecretV2' test.out

#- 44 DeleteSecretV2
./ng net.accelbyte.sdk.cli.Main csm deleteSecretV2 \
    --app 'cxvONZm3EeERmDny' \
    --configId 'eFoF7VSZ6pf3vneS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'DeleteSecretV2' test.out

#- 45 StartAppV2
./ng net.accelbyte.sdk.cli.Main csm startAppV2 \
    --app 'D2Tb3g7mSQUhAEtr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 45 'StartAppV2' test.out

#- 46 StopAppV2
./ng net.accelbyte.sdk.cli.Main csm stopAppV2 \
    --app 'mjqU6YE3p4lSck0Z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'StopAppV2' test.out

#- 47 GetNotificationSubscriberListV2
./ng net.accelbyte.sdk.cli.Main csm getNotificationSubscriberListV2 \
    --app 'Hn5GI39YBHqaTHeK' \
    --namespace "$AB_NAMESPACE" \
    --notificationType 'tW18iGeUlc9d9sog' \
    > test.out 2>&1
eval_tap $? 47 'GetNotificationSubscriberListV2' test.out

#- 48 BulkSaveSubscriptionAppNotificationV2
./ng net.accelbyte.sdk.cli.Main csm bulkSaveSubscriptionAppNotificationV2 \
    --app 'Wa24CKNS0GqVvUfH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"subscribers": [{"emailAddress": "QvsHXNUNe4mhgo5Q", "notificationType": {"B65lSAiYnNjkfZrQ": true, "3oZk03QXcKMDYDDx": true, "SZjtqXyJ58f7Gc26": true}, "userId": "aiGVkydwYWQG26yU"}, {"emailAddress": "ZNmTBcvrbYCwZtxF", "notificationType": {"HyPLtI8ilbyDPUIj": true, "cekdqCt81P1ktfIo": true, "eIP6rOvDz9KOsb39": true}, "userId": "k6YmJFfRByjlBiuF"}, {"emailAddress": "M3FIoVk8T3GpAnkC", "notificationType": {"mBUqg2SCnqntX9y1": false, "OqOBSC2DKHRuPMMW": false, "Yb33T5UBJCjfcnLR": false}, "userId": "gBnhhqElIaDml48w"}]}' \
    > test.out 2>&1
eval_tap $? 48 'BulkSaveSubscriptionAppNotificationV2' test.out

#- 49 SubscribeAppNotificationV2
./ng net.accelbyte.sdk.cli.Main csm subscribeAppNotificationV2 \
    --app 'dNFLTm5T50x9WT0G' \
    --namespace "$AB_NAMESPACE" \
    --body '{"notificationType": "fH2rtOa4EXsXzOXQ", "subscribers": [{"emailAddress": "Ak4mqrxzTtuLl4Xl", "userId": "bGL8QOxtjzm8y2wN"}, {"emailAddress": "hmwoYZyI4EFZKBcY", "userId": "rCEAE7WIsfmx40NL"}, {"emailAddress": "Rc6m8heKnWhzfe2N", "userId": "ubeoKFeIaFQCYoDP"}]}' \
    > test.out 2>&1
eval_tap $? 49 'SubscribeAppNotificationV2' test.out

#- 50 GetSubscriptionV2Handler
./ng net.accelbyte.sdk.cli.Main csm getSubscriptionV2Handler \
    --app 'ICpnduEEQlULdJz4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'GetSubscriptionV2Handler' test.out

#- 51 SubscribeV2Handler
./ng net.accelbyte.sdk.cli.Main csm subscribeV2Handler \
    --app 'mnRBkMNxvvKgAT8m' \
    --namespace "$AB_NAMESPACE" \
    --body '{"notificationType": "JrYq6hRkloqxM3gp"}' \
    > test.out 2>&1
eval_tap $? 51 'SubscribeV2Handler' test.out

#- 52 UnsubscribeV2Handler
./ng net.accelbyte.sdk.cli.Main csm unsubscribeV2Handler \
    --app 'wxcfMy9XzjjI5Ybs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'UnsubscribeV2Handler' test.out

#- 53 DeleteSubscriptionAppNotificationByUserIDV2
./ng net.accelbyte.sdk.cli.Main csm deleteSubscriptionAppNotificationByUserIDV2 \
    --app 'KoADkzJEN2VHzih3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bit0VWn3CO39PXDN' \
    > test.out 2>&1
eval_tap $? 53 'DeleteSubscriptionAppNotificationByUserIDV2' test.out

#- 54 DeleteSubscriptionAppNotificationV2
eval_tap 0 54 'DeleteSubscriptionAppNotificationV2 # SKIP deprecated' test.out

#- 55 GetListOfVariablesV2
./ng net.accelbyte.sdk.cli.Main csm getListOfVariablesV2 \
    --app 'xtXgeO3FgkXhjDza' \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 55 'GetListOfVariablesV2' test.out

#- 56 SaveVariableV2
./ng net.accelbyte.sdk.cli.Main csm saveVariableV2 \
    --app 'Y3snn2ZkP7cFdP43' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": false, "configName": "Y9eKa699bRVhyaKw", "description": "wrAP2aMlu7WtjCto", "source": "YetOO847g8OudOfj", "value": "nCuHZ3c46IjGa23Y"}' \
    > test.out 2>&1
eval_tap $? 56 'SaveVariableV2' test.out

#- 57 UpdateVariableV2
./ng net.accelbyte.sdk.cli.Main csm updateVariableV2 \
    --app 'vYmmDg7VYPXIuvUY' \
    --configId 'TZBRujIUE1Tq5jyA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": true, "description": "hUJkETAsSp7gh4Te", "value": "UTkOkAYfJB8AT9t4"}' \
    > test.out 2>&1
eval_tap $? 57 'UpdateVariableV2' test.out

#- 58 DeleteVariableV2
./ng net.accelbyte.sdk.cli.Main csm deleteVariableV2 \
    --app 'Tv207Y2QD3oD5fLC' \
    --configId 'r3OOlXVv8ZGF7uYn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'DeleteVariableV2' test.out

#- 59 ListTopicsHandler
./ng net.accelbyte.sdk.cli.Main csm listTopicsHandler \
    --namespace "$AB_NAMESPACE" \
    --fuzzyTopicName 'GzpipNDigNJma1Mb' \
    --isSubscribedByAppName 'qqZtfNWql4nmwAft' \
    --isUnsubscribedByAppName '4gqkNNlWkD9eOziY' \
    --limit '89' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 59 'ListTopicsHandler' test.out

#- 60 CreateTopicHandler
./ng net.accelbyte.sdk.cli.Main csm createTopicHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "FOn0jJLHC9LxhvNX", "topicName": "TwGBCtohLtl9Zuhy"}' \
    > test.out 2>&1
eval_tap $? 60 'CreateTopicHandler' test.out

#- 61 DeleteTopicHandler
./ng net.accelbyte.sdk.cli.Main csm deleteTopicHandler \
    --namespace "$AB_NAMESPACE" \
    --topicName 'tm5UDrT6QXCs5SPB' \
    > test.out 2>&1
eval_tap $? 61 'DeleteTopicHandler' test.out

#- 62 GetListOfDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm getListOfDeploymentV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '89' \
    --body '{"appIds": ["38HGS6rDgMdIIlhS", "1fSiM9331m7Ta1Ps", "Kc50Kv6ecnEevcAx"], "deploymentIds": ["2K2zkRenmPZnGBt4", "P7WnbdSJtjX7ZshZ", "yZl5x4bRXBHUTrDz"], "statuses": ["ZSKscfOcYu3dpCRO", "YqUiGKXVFCmpo6sP", "wVOEDSJsEK5QpNhl"]}' \
    > test.out 2>&1
eval_tap $? 62 'GetListOfDeploymentV2' test.out

#- 63 GetDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm getDeploymentV2 \
    --deploymentId 'I2iS5EpGhhvXYck0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'GetDeploymentV2' test.out

#- 64 DeleteDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm deleteDeploymentV2 \
    --deploymentId 'upMzUYnb76tFkEOR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'DeleteDeploymentV2' test.out

#- 65 GetNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'GetNoSQLClusterV2' test.out

#- 66 UpdateNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm updateNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"maxDCU": 0.768867296775785, "minDCU": 0.8951022615410027, "profileName": "bu1bNCtX7W40V6Do"}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateNoSQLClusterV2' test.out

#- 67 CreateNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm createNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"maxDCU": 0.9291584331264411, "minDCU": 0.2912685314424328, "profileName": "YadCCFrHHC3DpZxk"}' \
    > test.out 2>&1
eval_tap $? 67 'CreateNoSQLClusterV2' test.out

#- 68 DeleteNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm deleteNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 68 'DeleteNoSQLClusterV2' test.out

#- 69 StartNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm startNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'StartNoSQLClusterV2' test.out

#- 70 StopNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm stopNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 70 'StopNoSQLClusterV2' test.out

#- 71 GetNoSQLAccessTunnelV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLAccessTunnelV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'GetNoSQLAccessTunnelV2' test.out

#- 72 GetResourcesLimits
./ng net.accelbyte.sdk.cli.Main csm getResourcesLimits \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 72 'GetResourcesLimits' test.out

#- 73 GetNotificationSubscriberListV3
./ng net.accelbyte.sdk.cli.Main csm getNotificationSubscriberListV3 \
    --app 'rQDXuNFviMarv8mn' \
    --namespace "$AB_NAMESPACE" \
    --notificationType 'fHK8CCmE2lPnsbD3' \
    > test.out 2>&1
eval_tap $? 73 'GetNotificationSubscriberListV3' test.out

#- 74 DeleteSubscriptionAppNotificationV3
./ng net.accelbyte.sdk.cli.Main csm deleteSubscriptionAppNotificationV3 \
    --app 'SGEdlwuUccE536ug' \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'Bp3HBvepnDCjgyJl' \
    --userId 'Xe36mgWjLfFmteue' \
    > test.out 2>&1
eval_tap $? 74 'DeleteSubscriptionAppNotificationV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE