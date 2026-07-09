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
echo "1..108"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 ListAppUI
./ng net.accelbyte.sdk.cli.Main csm listAppUI \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --name 'twYCA9kPI6LZrkq6' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 2 'ListAppUI' test.out

#- 3 CreateAppUI
./ng net.accelbyte.sdk.cli.Main csm createAppUI \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "9UzVRiXbqlAw7r6W"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateAppUI' test.out

#- 4 DeleteAppUI
./ng net.accelbyte.sdk.cli.Main csm deleteAppUI \
    --appUiName '2ktQG0h5JAav5kRa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'DeleteAppUI' test.out

#- 5 UploadAppUIFile
./ng net.accelbyte.sdk.cli.Main csm uploadAppUIFile \
    --appUiName '62WopBJHPtcDs8bB' \
    --namespace "$AB_NAMESPACE" \
    --version 'ZLCXLx8bbgorQeFb' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 5 'UploadAppUIFile' test.out

#- 6 GetAppListV1
eval_tap 0 6 'GetAppListV1 # SKIP deprecated' test.out

#- 7 GetAppV1
eval_tap 0 7 'GetAppV1 # SKIP deprecated' test.out

#- 8 CreateAppV1
eval_tap 0 8 'CreateAppV1 # SKIP deprecated' test.out

#- 9 DeleteAppV1
eval_tap 0 9 'DeleteAppV1 # SKIP deprecated' test.out

#- 10 UpdateAppV1
eval_tap 0 10 'UpdateAppV1 # SKIP deprecated' test.out

#- 11 CreateDeploymentV1
eval_tap 0 11 'CreateDeploymentV1 # SKIP deprecated' test.out

#- 12 GetAppImageListV1
eval_tap 0 12 'GetAppImageListV1 # SKIP deprecated' test.out

#- 13 DeleteAppImagesV1
eval_tap 0 13 'DeleteAppImagesV1 # SKIP deprecated' test.out

#- 14 GetAppReleaseV1
./ng net.accelbyte.sdk.cli.Main csm getAppReleaseV1 \
    --app 'Q1g7qbPngUNB1vRo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'GetAppReleaseV1' test.out

#- 15 GetListOfSecretsV1
eval_tap 0 15 'GetListOfSecretsV1 # SKIP deprecated' test.out

#- 16 SaveSecretV1
eval_tap 0 16 'SaveSecretV1 # SKIP deprecated' test.out

#- 17 UpdateSecretV1
eval_tap 0 17 'UpdateSecretV1 # SKIP deprecated' test.out

#- 18 DeleteSecretV1
eval_tap 0 18 'DeleteSecretV1 # SKIP deprecated' test.out

#- 19 StartAppV1
eval_tap 0 19 'StartAppV1 # SKIP deprecated' test.out

#- 20 StopAppV1
eval_tap 0 20 'StopAppV1 # SKIP deprecated' test.out

#- 21 GetListOfVariablesV1
eval_tap 0 21 'GetListOfVariablesV1 # SKIP deprecated' test.out

#- 22 SaveVariableV1
eval_tap 0 22 'SaveVariableV1 # SKIP deprecated' test.out

#- 23 UpdateVariableV1
eval_tap 0 23 'UpdateVariableV1 # SKIP deprecated' test.out

#- 24 DeleteVariableV1
eval_tap 0 24 'DeleteVariableV1 # SKIP deprecated' test.out

#- 25 GetListOfDeploymentV1
eval_tap 0 25 'GetListOfDeploymentV1 # SKIP deprecated' test.out

#- 26 GetDeploymentV1
eval_tap 0 26 'GetDeploymentV1 # SKIP deprecated' test.out

#- 27 DeleteDeploymentV1
eval_tap 0 27 'DeleteDeploymentV1 # SKIP deprecated' test.out

#- 28 GetExtendFile
./ng net.accelbyte.sdk.cli.Main csm getExtendFile \
    --filePath 'dwpzS6DaDpv8N7ZQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetExtendFile' test.out

#- 29 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main csm publicGetMessages \
    > test.out 2>&1
eval_tap $? 29 'PublicGetMessages' test.out

#- 30 GetAppListV2
./ng net.accelbyte.sdk.cli.Main csm getAppListV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '59' \
    --body '{"appNames": ["qGj6oDLjWjkY1aXl", "FcDtgOjchIua5tWE", "IC32ogW7olvbTgrh"], "appStatuses": ["RTcPiSuL0Sly6XM4", "OI18mAQLnzjMf8GZ", "2WBZqxYG3aREAu2D"], "fuzzyAppName": "6QVKNCWP75TB0i7p", "scenario": "KxR8dl0zRVW4EZG9"}' \
    > test.out 2>&1
eval_tap $? 30 'GetAppListV2' test.out

#- 31 GetAppV2
./ng net.accelbyte.sdk.cli.Main csm getAppV2 \
    --app 'm0XcgGVbMqSszE8G' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'GetAppV2' test.out

#- 32 CreateAppV2
eval_tap 0 32 'CreateAppV2 # SKIP deprecated' test.out

#- 33 DeleteAppV2
./ng net.accelbyte.sdk.cli.Main csm deleteAppV2 \
    --app 'Havj7AorKsxwkosA' \
    --namespace "$AB_NAMESPACE" \
    --forced 'VerXpc1C8XfwHuKe' \
    > test.out 2>&1
eval_tap $? 33 'DeleteAppV2' test.out

#- 34 UpdateAppV2
./ng net.accelbyte.sdk.cli.Main csm updateAppV2 \
    --app 'b9l3rGN9A3sNm84h' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ddSpHt0P7MIIR7Ck", "enableDebugMode": true}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateAppV2' test.out

#- 35 ApplyAppConfigV2
./ng net.accelbyte.sdk.cli.Main csm applyAppConfigV2 \
    --app '5tA5jUmiTqpyhPFd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 49}, "cpu": {"requestCPU": 36}, "description": "LzFQN05MYzYiKWe5", "memory": {"requestMemory": 7}, "permissions": [{"action": 6, "resource": "NRljv7IPrDQQRgat"}, {"action": 47, "resource": "SevkLGMS0lyuI9a2"}, {"action": 71, "resource": "llzQRaT5kPxUfofv"}], "replica": {"maxReplica": 28, "minReplica": 28}, "scenario": "UpOXGSLmCVuHOPlL", "secrets": [{"name": "lkvR8sKgnuRkgghG", "value": "oYupD391C2qtPYok"}, {"name": "ahFjkQsfCaTmt1d6", "value": "7FXGk2s9Q0mPVo3t"}, {"name": "wu0MesTCf9x4rt69", "value": "lna7qxNeIxPz6Mbw"}], "variables": [{"name": "L6IY69z1UaLqYSYW", "value": "ytLPziZMdjxcBZuf"}, {"name": "QxGiHPllG4cYEzfT", "value": "D1ZBm3MqHcUmLZZb"}, {"name": "Sqb8RwNmn9HrNQy4", "value": "uZAAiE0mit9RGCCH"}], "vmSharingConfiguration": "YzUOcEdscKHPEqgA"}' \
    > test.out 2>&1
eval_tap $? 35 'ApplyAppConfigV2' test.out

#- 36 CreateSubscriptionHandler
./ng net.accelbyte.sdk.cli.Main csm createSubscriptionHandler \
    --app '8yu7Vk6Jt4Ymos9J' \
    --namespace "$AB_NAMESPACE" \
    --body '{"topicNames": ["cdos4fYcTVU6RBt0", "zYoMcHyCUEXlAvxJ", "MdalwSyliWMNW5Ny"]}' \
    > test.out 2>&1
eval_tap $? 36 'CreateSubscriptionHandler' test.out

#- 37 UnsubscribeTopicHandler
./ng net.accelbyte.sdk.cli.Main csm unsubscribeTopicHandler \
    --app 'Lu0M3VHh2EI8JlDb' \
    --namespace "$AB_NAMESPACE" \
    --topicName 'PWbQ6Q9lNmqRBaAk' \
    > test.out 2>&1
eval_tap $? 37 'UnsubscribeTopicHandler' test.out

#- 38 CreateDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm createDeploymentV2 \
    --app 'LnvxkT1X68cmDc3f' \
    --namespace "$AB_NAMESPACE" \
    --body '{"imageTag": "xU8MyKrQpM4hkkK6"}' \
    > test.out 2>&1
eval_tap $? 38 'CreateDeploymentV2' test.out

#- 39 GetAppImageListV2
./ng net.accelbyte.sdk.cli.Main csm getAppImageListV2 \
    --app 'KKXNB3Gv0IqmF51T' \
    --namespace "$AB_NAMESPACE" \
    --cached 'khjYnaq6foWvXa3b' \
    > test.out 2>&1
eval_tap $? 39 'GetAppImageListV2' test.out

#- 40 DeleteAppImagesV2
./ng net.accelbyte.sdk.cli.Main csm deleteAppImagesV2 \
    --app 'MrXsDr6kILsSSyDd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"imageTags": ["mykmoPYgc2L4jk4L", "o0LSP0pf4IxjUkl5", "35X3ateEKDpADz1x"]}' \
    > test.out 2>&1
eval_tap $? 40 'DeleteAppImagesV2' test.out

#- 41 CreateKeyValueCredentialV2
./ng net.accelbyte.sdk.cli.Main csm createKeyValueCredentialV2 \
    --app '3poD3Qgb3boLQQ1M' \
    --namespace "$AB_NAMESPACE" \
    --body '{"password": "zH7Qm8bwbmXgdAPh", "username": "1EThG96gAFKK2WDg"}' \
    > test.out 2>&1
eval_tap $? 41 'CreateKeyValueCredentialV2' test.out

#- 42 GetIntegrationAppKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm getIntegrationAppKeyValueClusterV2 \
    --app 'CcxvONZm3EeERmDn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'GetIntegrationAppKeyValueClusterV2' test.out

#- 43 IntegrateAppKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm integrateAppKeyValueClusterV2 \
    --app 'yeFoF7VSZ6pf3vne' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acknowledgements": {"acceptKeyValueSecureCredentialHandling": true}, "password": "VPHbn4Xxtu7LQREN", "resourceId": "jEEztx1WsYSiZqan", "username": "0nSBJroav91GXlvP"}' \
    > test.out 2>&1
eval_tap $? 43 'IntegrateAppKeyValueClusterV2' test.out

#- 44 RemoveIntegrationAppKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm removeIntegrationAppKeyValueClusterV2 \
    --app 'G6bFYReVHQipcCx9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'RemoveIntegrationAppKeyValueClusterV2' test.out

#- 45 CreateNewNoSQLDatabaseCredentialV2
./ng net.accelbyte.sdk.cli.Main csm createNewNoSQLDatabaseCredentialV2 \
    --app 'Zw5D2L7vIYhGGSyE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acknowledgements": {"acceptNosqlSecureCredentialHandling": true}, "password": "4ZJJ42d3PBddN8S4", "username": "8l9lyNApflxqMrj3"}' \
    > test.out 2>&1
eval_tap $? 45 'CreateNewNoSQLDatabaseCredentialV2' test.out

#- 46 CreateNoSQLDatabaseCredentialV2
eval_tap 0 46 'CreateNoSQLDatabaseCredentialV2 # SKIP deprecated' test.out

#- 47 GetNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLDatabaseV2 \
    --app 'oZk03QXcKMDYDDxH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'GetNoSQLDatabaseV2' test.out

#- 48 CreateNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm createNoSQLDatabaseV2 \
    --app 'SZjtqXyJ58f7Gc26' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acknowledgements": {"acceptNosqlSecureCredentialHandling": true}, "dbName": "aiGVkydwYWQG26yU", "password": "ZNmTBcvrbYCwZtxF", "username": "HyPLtI8ilbyDPUIj"}' \
    > test.out 2>&1
eval_tap $? 48 'CreateNoSQLDatabaseV2' test.out

#- 49 DeleteNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm deleteNoSQLDatabaseV2 \
    --app '88cekdqCt81P1ktf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'DeleteNoSQLDatabaseV2' test.out

#- 50 UpdateAppResourcesV2
./ng net.accelbyte.sdk.cli.Main csm updateAppResourcesV2 \
    --app 'Iovmv9gsR5cJcHm3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 91}, "cpu": {"requestCPU": 77}, "memory": {"requestMemory": 49}, "replica": {"maxReplica": 21, "minReplica": 29}, "vmSharingConfiguration": "6YmJFfRByjlBiuFM"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateAppResourcesV2' test.out

#- 51 UpdateAppResourcesResourceLimitFormV2
./ng net.accelbyte.sdk.cli.Main csm updateAppResourcesResourceLimitFormV2 \
    --app '3FIoVk8T3GpAnkCm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientEmail": "BUqg2SCnqntX9y1a", "preferredLimitReplica": 34, "requestReason": "SWMiVi10sG6vxkfU"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateAppResourcesResourceLimitFormV2' test.out

#- 52 GetListOfSecretsV2
./ng net.accelbyte.sdk.cli.Main csm getListOfSecretsV2 \
    --app 'cmqRRbceJ5i0EeDx' \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 52 'GetListOfSecretsV2' test.out

#- 53 SaveSecretV2
./ng net.accelbyte.sdk.cli.Main csm saveSecretV2 \
    --app 'gBnhhqElIaDml48w' \
    --namespace "$AB_NAMESPACE" \
    --body '{"configName": "dNFLTm5T50x9WT0G", "description": "fH2rtOa4EXsXzOXQ", "source": "Ak4mqrxzTtuLl4Xl", "value": "bGL8QOxtjzm8y2wN"}' \
    > test.out 2>&1
eval_tap $? 53 'SaveSecretV2' test.out

#- 54 UpdateSecretV2
./ng net.accelbyte.sdk.cli.Main csm updateSecretV2 \
    --app 'hmwoYZyI4EFZKBcY' \
    --configId 'rCEAE7WIsfmx40NL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Rc6m8heKnWhzfe2N", "value": "ubeoKFeIaFQCYoDP"}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateSecretV2' test.out

#- 55 DeleteSecretV2
./ng net.accelbyte.sdk.cli.Main csm deleteSecretV2 \
    --app 'ICpnduEEQlULdJz4' \
    --configId 'mnRBkMNxvvKgAT8m' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'DeleteSecretV2' test.out

#- 56 CreateSQLDatabaseCredentialV2
./ng net.accelbyte.sdk.cli.Main csm createSQLDatabaseCredentialV2 \
    --app 'JrYq6hRkloqxM3gp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"password": "wxcfMy9XzjjI5Ybs", "username": "KoADkzJEN2VHzih3"}' \
    > test.out 2>&1
eval_tap $? 56 'CreateSQLDatabaseCredentialV2' test.out

#- 57 GetSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm getSQLDatabaseV2 \
    --app 'bit0VWn3CO39PXDN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'GetSQLDatabaseV2' test.out

#- 58 CreateSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm createSQLDatabaseV2 \
    --app 'xtXgeO3FgkXhjDza' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acknowledgements": {"acceptSQLSecureCredentialHandling": true}, "dbName": "Y3snn2ZkP7cFdP43", "password": "e5dC9XIBudfZgrbH", "username": "DIDm4hMzF4Txoden"}' \
    > test.out 2>&1
eval_tap $? 58 'CreateSQLDatabaseV2' test.out

#- 59 DeleteSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm deleteSQLDatabaseV2 \
    --app 'SrUTvfqU0bfoMm5c' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'DeleteSQLDatabaseV2' test.out

#- 60 StartAppV2
./ng net.accelbyte.sdk.cli.Main csm startAppV2 \
    --app 'TtFWbotQyXJRcQWs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'StartAppV2' test.out

#- 61 StopAppV2
./ng net.accelbyte.sdk.cli.Main csm stopAppV2 \
    --app 'mqPNs92epxk0i8Vx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'StopAppV2' test.out

#- 62 GetNotificationSubscriberListV2
./ng net.accelbyte.sdk.cli.Main csm getNotificationSubscriberListV2 \
    --app 'sZNereSvf9699mCE' \
    --namespace "$AB_NAMESPACE" \
    --notificationType 'HThUJkETAsSp7gh4' \
    > test.out 2>&1
eval_tap $? 62 'GetNotificationSubscriberListV2' test.out

#- 63 BulkSaveSubscriptionAppNotificationV2
./ng net.accelbyte.sdk.cli.Main csm bulkSaveSubscriptionAppNotificationV2 \
    --app 'TeUTkOkAYfJB8AT9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"subscribers": [{"emailAddress": "t4Tv207Y2QD3oD5f", "notificationType": {"LCr3OOlXVv8ZGF7u": false, "0o4zGYY7KQI1AeFg": true, "qaOkvo1aolB4lkKB": false}, "userId": "EYOkQ1jMD3cym8xI"}, {"emailAddress": "fkOVW2grREOLx0KO", "notificationType": {"ww3HICQLfl7MUBG7": true, "m5UDrT6QXCs5SPBb": false, "rDgMdIIlhS1fSiM9": true}, "userId": "31m7Ta1PsKc50Kv6"}, {"emailAddress": "ecnEevcAx2K2zkRe", "notificationType": {"nmPZnGBt4P7WnbdS": false, "tjX7ZshZyZl5x4bR": false, "BHUTrDzZSKscfOcY": true}, "userId": "N9LFkYW5DQyj4bj5"}]}' \
    > test.out 2>&1
eval_tap $? 63 'BulkSaveSubscriptionAppNotificationV2' test.out

#- 64 SubscribeAppNotificationV2
./ng net.accelbyte.sdk.cli.Main csm subscribeAppNotificationV2 \
    --app 'Ro2ogaKt2ujQSa3Z' \
    --namespace "$AB_NAMESPACE" \
    --body '{"notificationType": "db65UXmy0Zp6iIaT", "subscribers": [{"emailAddress": "IKUkmkk9QM0NBMA9", "userId": "ORxpzwLR2AK6eXUG"}, {"emailAddress": "PJsw1fiP80G9Pclx", "userId": "cft2ulIJzPyrVEiO"}, {"emailAddress": "G4UcqsuGKHhMRWLV", "userId": "d3DlhLuIpomM8sm1"}]}' \
    > test.out 2>&1
eval_tap $? 64 'SubscribeAppNotificationV2' test.out

#- 65 GetSubscriptionV2Handler
./ng net.accelbyte.sdk.cli.Main csm getSubscriptionV2Handler \
    --app 'MiaI1mX2tJoARtdb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'GetSubscriptionV2Handler' test.out

#- 66 SubscribeV2Handler
./ng net.accelbyte.sdk.cli.Main csm subscribeV2Handler \
    --app 'Be7udsMrok0WvGYY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"notificationType": "nx4V709xbnGezKsD"}' \
    > test.out 2>&1
eval_tap $? 66 'SubscribeV2Handler' test.out

#- 67 UnsubscribeV2Handler
./ng net.accelbyte.sdk.cli.Main csm unsubscribeV2Handler \
    --app 'wG2omOR2nvYI9TVq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'UnsubscribeV2Handler' test.out

#- 68 DeleteSubscriptionAppNotificationByUserIDV2
./ng net.accelbyte.sdk.cli.Main csm deleteSubscriptionAppNotificationByUserIDV2 \
    --app 'JdvzcWbfUpaXp5JM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'l5LL4bTxBmZjdrrI' \
    > test.out 2>&1
eval_tap $? 68 'DeleteSubscriptionAppNotificationByUserIDV2' test.out

#- 69 DeleteSubscriptionAppNotificationV2
eval_tap 0 69 'DeleteSubscriptionAppNotificationV2 # SKIP deprecated' test.out

#- 70 GetListOfVariablesV2
./ng net.accelbyte.sdk.cli.Main csm getListOfVariablesV2 \
    --app 'xsB0NRsB1fPqqRRu' \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 70 'GetListOfVariablesV2' test.out

#- 71 SaveVariableV2
./ng net.accelbyte.sdk.cli.Main csm saveVariableV2 \
    --app 'pqpymDkQhtrHWwRV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": false, "configName": "ng5BLy8wbhMssAHj", "description": "apIkY9Rf4wP57dBZ", "source": "NR88YbCtmKy8M9zV", "value": "rjfGXZnqAQUoY1Gj"}' \
    > test.out 2>&1
eval_tap $? 71 'SaveVariableV2' test.out

#- 72 UpdateVariableV2
./ng net.accelbyte.sdk.cli.Main csm updateVariableV2 \
    --app 'lIIk0iKoTTS1j02o' \
    --configId '7JjTXAQN0qdskdQV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": true, "description": "k0eaKQDOJvrTefgl", "value": "Ss6g4iY9u02aCNYI"}' \
    > test.out 2>&1
eval_tap $? 72 'UpdateVariableV2' test.out

#- 73 DeleteVariableV2
./ng net.accelbyte.sdk.cli.Main csm deleteVariableV2 \
    --app 'Wekp18lOC3mNqF7B' \
    --configId 'l0LcghVHfPEspxwh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'DeleteVariableV2' test.out

#- 74 ListTopicsHandler
./ng net.accelbyte.sdk.cli.Main csm listTopicsHandler \
    --namespace "$AB_NAMESPACE" \
    --fuzzyTopicName 'RON0bc1eMbEIjowL' \
    --isSubscribedByAppName 'qc3ecjXJbZDKKoxL' \
    --isUnsubscribedByAppName 'E1Y3Dymtj3giPg4x' \
    --limit '16' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 74 'ListTopicsHandler' test.out

#- 75 CreateTopicHandler
./ng net.accelbyte.sdk.cli.Main csm createTopicHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "OPjaf3H0tYighU0V", "topicName": "UfcYHJbBfAKSiPW3"}' \
    > test.out 2>&1
eval_tap $? 75 'CreateTopicHandler' test.out

#- 76 DeleteTopicHandler
./ng net.accelbyte.sdk.cli.Main csm deleteTopicHandler \
    --namespace "$AB_NAMESPACE" \
    --topicName 'VgsZXiR1DJ7HVWqM' \
    > test.out 2>&1
eval_tap $? 76 'DeleteTopicHandler' test.out

#- 77 GetListOfDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm getListOfDeploymentV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '39' \
    --body '{"appIds": ["NSawQUWDFJvJBWic", "7UkBeIXuqDuAXI66", "bQ71w0deoV9Lx5RD"], "deploymentIds": ["A1l2XcrciYNEzvSZ", "IPkhSgORcz5S5Bvm", "gBLxh4ijFnE3Tam6"], "statuses": ["9qSZ7PC6f6QkmZXE", "lW9YfRSse6AAz3S4", "czz0QKFlAVmVLu4A"]}' \
    > test.out 2>&1
eval_tap $? 77 'GetListOfDeploymentV2' test.out

#- 78 GetDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm getDeploymentV2 \
    --deploymentId 'Oec0z8eBeeoip68J' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'GetDeploymentV2' test.out

#- 79 DeleteDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm deleteDeploymentV2 \
    --deploymentId '1nsv4W2OJhtafxMS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'DeleteDeploymentV2' test.out

#- 80 GetKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm getKeyValueClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --resourceId 'JlHeb34sZKHcl5LL' \
    > test.out 2>&1
eval_tap $? 80 'GetKeyValueClusterV2' test.out

#- 81 ListKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm listKeyValueClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --refresh  \
    > test.out 2>&1
eval_tap $? 81 'ListKeyValueClusterV2' test.out

#- 82 CreateKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm createKeyValueClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clusterName": "LOexL4fZvWtND2tc", "maxDataStorageGB": 57, "maxECPUPerSecond": 88, "profileName": "FpX8lNtFEJ7tnkY6"}' \
    > test.out 2>&1
eval_tap $? 82 'CreateKeyValueClusterV2' test.out

#- 83 GetKeyValueClusterLimitConfigV2
./ng net.accelbyte.sdk.cli.Main csm getKeyValueClusterLimitConfigV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 83 'GetKeyValueClusterLimitConfigV2' test.out

#- 84 UpdateKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm updateKeyValueClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --resourceId 'Mca5afj12K2IzrBv' \
    --body '{"maxDataStorageGB": 43, "maxECPUPerSecond": 74, "profileName": "Wm4udE0OXudXgNne"}' \
    > test.out 2>&1
eval_tap $? 84 'UpdateKeyValueClusterV2' test.out

#- 85 DeleteKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm deleteKeyValueClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --resourceId '8kJATwlc6esUp6Sw' \
    > test.out 2>&1
eval_tap $? 85 'DeleteKeyValueClusterV2' test.out

#- 86 GetListIntegratedAppKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm getListIntegratedAppKeyValueClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --resourceId '1I98jeZQ7hfxnhLd' \
    > test.out 2>&1
eval_tap $? 86 'GetListIntegratedAppKeyValueClusterV2' test.out

#- 87 GetNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 87 'GetNoSQLClusterV2' test.out

#- 88 UpdateNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm updateNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"maxDCU": 0.8890255150166623, "minDCU": 0.5870119596251794, "profileName": "naknoed9DHhLOqQG"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateNoSQLClusterV2' test.out

#- 89 CreateNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm createNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"maxDCU": 0.11923214518473202, "minDCU": 0.45358361466867825, "profileName": "Ur6iTrjyEgarAdNJ"}' \
    > test.out 2>&1
eval_tap $? 89 'CreateNoSQLClusterV2' test.out

#- 90 DeleteNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm deleteNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'DeleteNoSQLClusterV2' test.out

#- 91 StartNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm startNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 91 'StartNoSQLClusterV2' test.out

#- 92 StopNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm stopNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'StopNoSQLClusterV2' test.out

#- 93 GetNoSQLAccessTunnelV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLAccessTunnelV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 93 'GetNoSQLAccessTunnelV2' test.out

#- 94 GetResourcesLimits
./ng net.accelbyte.sdk.cli.Main csm getResourcesLimits \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 94 'GetResourcesLimits' test.out

#- 95 GetSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm getSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'GetSQLClusterV2' test.out

#- 96 UpdateSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm updateSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"maxACU": 0.6491219154630121, "minACU": 0.5574021455786695, "multiAZ": false, "profileName": "36I6tRbRcrEveMdA"}' \
    > test.out 2>&1
eval_tap $? 96 'UpdateSQLClusterV2' test.out

#- 97 CreateSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm createSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"maxACU": 0.05719020349699522, "minACU": 0.13517117864932882, "multiAZ": true, "profileName": "yTlUrwDTnoujQD4I"}' \
    > test.out 2>&1
eval_tap $? 97 'CreateSQLClusterV2' test.out

#- 98 DeleteSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm deleteSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 98 'DeleteSQLClusterV2' test.out

#- 99 StartSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm startSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 99 'StartSQLClusterV2' test.out

#- 100 StopSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm stopSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 100 'StopSQLClusterV2' test.out

#- 101 GetSQLAppListV2
./ng net.accelbyte.sdk.cli.Main csm getSQLAppListV2 \
    --namespace "$AB_NAMESPACE" \
    --resourceId 'EiH9Z5qXn3aoRtlq' \
    --appName 'OECohViHA5CzgFSy' \
    --gameNamespace '8X1A3PrIfapq5AAe' \
    --limit '78' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 101 'GetSQLAppListV2' test.out

#- 102 GetNoSQLAppListV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLAppListV2 \
    --resourceId 'H3mtgWgU4pCAKxeE' \
    --studioName '70CaunQNxot371W9' \
    --appName 'G4AvQkqsGnmyo5JJ' \
    --gameNamespace 'TUVmb8GEXFTlEMEs' \
    --limit '64' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 102 'GetNoSQLAppListV2' test.out

#- 103 GetNotificationSubscriberListV3
./ng net.accelbyte.sdk.cli.Main csm getNotificationSubscriberListV3 \
    --app 'zYqwgK1Np5nodqpL' \
    --namespace "$AB_NAMESPACE" \
    --notificationType 'm7FhJBNXzAFdO0Kh' \
    > test.out 2>&1
eval_tap $? 103 'GetNotificationSubscriberListV3' test.out

#- 104 DeleteSubscriptionAppNotificationV3
./ng net.accelbyte.sdk.cli.Main csm deleteSubscriptionAppNotificationV3 \
    --app 'qf6kiTdSGv2LFjAK' \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'Y7CbgsWqFWZX7kPB' \
    --userId 'om8F9GLLTG8phc3n' \
    > test.out 2>&1
eval_tap $? 104 'DeleteSubscriptionAppNotificationV3' test.out

#- 105 GetAppDebugInfoV4
./ng net.accelbyte.sdk.cli.Main csm getAppDebugInfoV4 \
    --app '4iLoIllKlpO2pqiX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 105 'GetAppDebugInfoV4' test.out

#- 106 UpdateAppDebugModeV4
./ng net.accelbyte.sdk.cli.Main csm updateAppDebugModeV4 \
    --app 'JF3WGRaoQomSJC4D' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enableDebugMode": false}' \
    > test.out 2>&1
eval_tap $? 106 'UpdateAppDebugModeV4' test.out

#- 107 GetAppStatusProgressV4
./ng net.accelbyte.sdk.cli.Main csm getAppStatusProgressV4 \
    --app 'EpstyVTBcrM8rG0r' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 107 'GetAppStatusProgressV4' test.out

#- 108 CreateAppV5
./ng net.accelbyte.sdk.cli.Main csm createAppV5 \
    --app 'H0zcswwVeMK6MbGI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 97}, "cpu": {"requestCPU": 16}, "description": "Iu8vvwLc7KY3uVoJ", "memory": {"requestMemory": 9}, "preferred_k8s_namespace": "TIMtpgkieDyF97lG", "replica": {"maxReplica": 7, "minReplica": 48}, "scenario": "MiHKxbWCYzo8yO2K", "vmSharingConfiguration": "TK9tmmOnYnOpas6g"}' \
    > test.out 2>&1
eval_tap $? 108 'CreateAppV5' test.out


rm -f "tmp.dat"

exit $EXIT_CODE