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
echo "1..104"

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
./ng net.accelbyte.sdk.cli.Main csm createAppV2 \
    --app 'Havj7AorKsxwkosA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 97}, "cpu": {"requestCPU": 80}, "description": "erXpc1C8XfwHuKeb", "memory": {"requestMemory": 53}, "replica": {"maxReplica": 23, "minReplica": 39}, "scenario": "3rGN9A3sNm84hddS", "vmSharingConfiguration": "pHt0P7MIIR7CkyF6"}' \
    > test.out 2>&1
eval_tap $? 32 'CreateAppV2' test.out

#- 33 DeleteAppV2
./ng net.accelbyte.sdk.cli.Main csm deleteAppV2 \
    --app 'C7duuyZ0GhDogqrh' \
    --namespace "$AB_NAMESPACE" \
    --forced 'BRd8lDR6qVNPRZYd' \
    > test.out 2>&1
eval_tap $? 33 'DeleteAppV2' test.out

#- 34 UpdateAppV2
./ng net.accelbyte.sdk.cli.Main csm updateAppV2 \
    --app 'FLIAjGGJddVCvu9v' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "x5KQ7KYnIuMBvaO3"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateAppV2' test.out

#- 35 ApplyAppConfigV2
./ng net.accelbyte.sdk.cli.Main csm applyAppConfigV2 \
    --app '5llzQRaT5kPxUfof' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 45}, "cpu": {"requestCPU": 28}, "description": "6UpOXGSLmCVuHOPl", "memory": {"requestMemory": 78}, "permissions": [{"action": 81, "resource": "lkvR8sKgnuRkgghG"}, {"action": 30, "resource": "GCiljvjKoyD6SCwG"}, {"action": 36, "resource": "hFjkQsfCaTmt1d67"}], "replica": {"maxReplica": 65, "minReplica": 24}, "scenario": "XGk2s9Q0mPVo3twu", "secrets": [{"name": "0MesTCf9x4rt69ln", "value": "a7qxNeIxPz6MbwL6"}, {"name": "IY69z1UaLqYSYWyt", "value": "LPziZMdjxcBZufQx"}, {"name": "GiHPllG4cYEzfTD1", "value": "ZBm3MqHcUmLZZbSq"}], "variables": [{"name": "b8RwNmn9HrNQy4uZ", "value": "AAiE0mit9RGCCHYz"}, {"name": "UOcEdscKHPEqgA8y", "value": "u7Vk6Jt4Ymos9Jcd"}, {"name": "os4fYcTVU6RBt0zY", "value": "oMcHyCUEXlAvxJMd"}], "vmSharingConfiguration": "alwSyliWMNW5NyLu"}' \
    > test.out 2>&1
eval_tap $? 35 'ApplyAppConfigV2' test.out

#- 36 CreateSubscriptionHandler
./ng net.accelbyte.sdk.cli.Main csm createSubscriptionHandler \
    --app '0M3VHh2EI8JlDbPW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"topicNames": ["bQ6Q9lNmqRBaAkLn", "vxkT1X68cmDc3fxU", "8MyKrQpM4hkkK6KK"]}' \
    > test.out 2>&1
eval_tap $? 36 'CreateSubscriptionHandler' test.out

#- 37 UnsubscribeTopicHandler
./ng net.accelbyte.sdk.cli.Main csm unsubscribeTopicHandler \
    --app 'XNB3Gv0IqmF51Tkh' \
    --namespace "$AB_NAMESPACE" \
    --topicName 'jYnaq6foWvXa3bMr' \
    > test.out 2>&1
eval_tap $? 37 'UnsubscribeTopicHandler' test.out

#- 38 CreateDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm createDeploymentV2 \
    --app 'XsDr6kILsSSyDdmy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"imageTag": "kmoPYgc2L4jk4Lo0"}' \
    > test.out 2>&1
eval_tap $? 38 'CreateDeploymentV2' test.out

#- 39 GetAppImageListV2
./ng net.accelbyte.sdk.cli.Main csm getAppImageListV2 \
    --app 'LSP0pf4IxjUkl535' \
    --namespace "$AB_NAMESPACE" \
    --cached 'X3ateEKDpADz1x3p' \
    > test.out 2>&1
eval_tap $? 39 'GetAppImageListV2' test.out

#- 40 DeleteAppImagesV2
./ng net.accelbyte.sdk.cli.Main csm deleteAppImagesV2 \
    --app 'oD3Qgb3boLQQ1MzH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"imageTags": ["7Qm8bwbmXgdAPh1E", "ThG96gAFKK2WDgCc", "xvONZm3EeERmDnye"]}' \
    > test.out 2>&1
eval_tap $? 40 'DeleteAppImagesV2' test.out

#- 41 CreateKeyValueCredentialV2
./ng net.accelbyte.sdk.cli.Main csm createKeyValueCredentialV2 \
    --app 'FoF7VSZ6pf3vneSD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"password": "2Tb3g7mSQUhAEtrm", "username": "jqU6YE3p4lSck0ZH"}' \
    > test.out 2>&1
eval_tap $? 41 'CreateKeyValueCredentialV2' test.out

#- 42 GetIntegrationAppKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm getIntegrationAppKeyValueClusterV2 \
    --app 'n5GI39YBHqaTHeKt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'GetIntegrationAppKeyValueClusterV2' test.out

#- 43 IntegrateAppKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm integrateAppKeyValueClusterV2 \
    --app 'W18iGeUlc9d9sogW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acknowledgements": {"acceptKeyValueSecureCredentialHandling": false}, "password": "w5D2L7vIYhGGSyEW", "resourceId": "4ZJJ42d3PBddN8S4", "username": "8l9lyNApflxqMrj3"}' \
    > test.out 2>&1
eval_tap $? 43 'IntegrateAppKeyValueClusterV2' test.out

#- 44 RemoveIntegrationAppKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm removeIntegrationAppKeyValueClusterV2 \
    --app 'oZk03QXcKMDYDDxH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'RemoveIntegrationAppKeyValueClusterV2' test.out

#- 45 CreateNewNoSQLDatabaseCredentialV2
./ng net.accelbyte.sdk.cli.Main csm createNewNoSQLDatabaseCredentialV2 \
    --app 'SZjtqXyJ58f7Gc26' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acknowledgements": {"acceptNosqlSecureCredentialHandling": true}, "password": "aiGVkydwYWQG26yU", "username": "ZNmTBcvrbYCwZtxF"}' \
    > test.out 2>&1
eval_tap $? 45 'CreateNewNoSQLDatabaseCredentialV2' test.out

#- 46 CreateNoSQLDatabaseCredentialV2
eval_tap 0 46 'CreateNoSQLDatabaseCredentialV2 # SKIP deprecated' test.out

#- 47 GetNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLDatabaseV2 \
    --app 'HyPLtI8ilbyDPUIj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'GetNoSQLDatabaseV2' test.out

#- 48 CreateNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm createNoSQLDatabaseV2 \
    --app '88cekdqCt81P1ktf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acknowledgements": {"acceptNosqlSecureCredentialHandling": true}, "dbName": "ovmv9gsR5cJcHm3S", "password": "ZLxoRDFuuuySj29a", "username": "9LJE8HoRS1X2PFAA"}' \
    > test.out 2>&1
eval_tap $? 48 'CreateNoSQLDatabaseV2' test.out

#- 49 DeleteNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm deleteNoSQLDatabaseV2 \
    --app 'MwzHPxB1UskYs4Yw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'DeleteNoSQLDatabaseV2' test.out

#- 50 UpdateAppResourcesV2
./ng net.accelbyte.sdk.cli.Main csm updateAppResourcesV2 \
    --app '20DOqOBSC2DKHRuP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 79}, "cpu": {"requestCPU": 48}, "memory": {"requestMemory": 80}, "replica": {"maxReplica": 22, "minReplica": 99}, "vmSharingConfiguration": "fUcmqRRbceJ5i0Ee"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateAppResourcesV2' test.out

#- 51 UpdateAppResourcesResourceLimitFormV2
./ng net.accelbyte.sdk.cli.Main csm updateAppResourcesResourceLimitFormV2 \
    --app 'DxOgBnhhqElIaDml' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientEmail": "48wdNFLTm5T50x9W", "preferredLimitReplica": 94, "requestReason": "3biBfsu4jmsRE2w1"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateAppResourcesResourceLimitFormV2' test.out

#- 52 GetListOfSecretsV2
./ng net.accelbyte.sdk.cli.Main csm getListOfSecretsV2 \
    --app 'yEkLgh3tIYt4SqYU' \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 52 'GetListOfSecretsV2' test.out

#- 53 SaveSecretV2
./ng net.accelbyte.sdk.cli.Main csm saveSecretV2 \
    --app 'lbGL8QOxtjzm8y2w' \
    --namespace "$AB_NAMESPACE" \
    --body '{"configName": "NhmwoYZyI4EFZKBc", "description": "YrCEAE7WIsfmx40N", "source": "LRc6m8heKnWhzfe2", "value": "NubeoKFeIaFQCYoD"}' \
    > test.out 2>&1
eval_tap $? 53 'SaveSecretV2' test.out

#- 54 UpdateSecretV2
./ng net.accelbyte.sdk.cli.Main csm updateSecretV2 \
    --app 'PICpnduEEQlULdJz' \
    --configId '4mnRBkMNxvvKgAT8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "mJrYq6hRkloqxM3g", "value": "pwxcfMy9XzjjI5Yb"}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateSecretV2' test.out

#- 55 DeleteSecretV2
./ng net.accelbyte.sdk.cli.Main csm deleteSecretV2 \
    --app 'sKoADkzJEN2VHzih' \
    --configId '3bit0VWn3CO39PXD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'DeleteSecretV2' test.out

#- 56 CreateSQLDatabaseCredentialV2
./ng net.accelbyte.sdk.cli.Main csm createSQLDatabaseCredentialV2 \
    --app 'NxtXgeO3FgkXhjDz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"password": "aQY3snn2ZkP7cFdP", "username": "43e5dC9XIBudfZgr"}' \
    > test.out 2>&1
eval_tap $? 56 'CreateSQLDatabaseCredentialV2' test.out

#- 57 GetSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm getSQLDatabaseV2 \
    --app 'bHDIDm4hMzF4Txod' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'GetSQLDatabaseV2' test.out

#- 58 CreateSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm createSQLDatabaseV2 \
    --app 'enSrUTvfqU0bfoMm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acknowledgements": {"acceptSQLSecureCredentialHandling": false}, "dbName": "cTtFWbotQyXJRcQW", "password": "smqPNs92epxk0i8V", "username": "xsZNereSvf9699mC"}' \
    > test.out 2>&1
eval_tap $? 58 'CreateSQLDatabaseV2' test.out

#- 59 DeleteSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm deleteSQLDatabaseV2 \
    --app 'EHThUJkETAsSp7gh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'DeleteSQLDatabaseV2' test.out

#- 60 StartAppV2
./ng net.accelbyte.sdk.cli.Main csm startAppV2 \
    --app '4TeUTkOkAYfJB8AT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'StartAppV2' test.out

#- 61 StopAppV2
./ng net.accelbyte.sdk.cli.Main csm stopAppV2 \
    --app '9t4Tv207Y2QD3oD5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'StopAppV2' test.out

#- 62 GetNotificationSubscriberListV2
./ng net.accelbyte.sdk.cli.Main csm getNotificationSubscriberListV2 \
    --app 'fLCr3OOlXVv8ZGF7' \
    --namespace "$AB_NAMESPACE" \
    --notificationType 'uYnGzpipNDigNJma' \
    > test.out 2>&1
eval_tap $? 62 'GetNotificationSubscriberListV2' test.out

#- 63 BulkSaveSubscriptionAppNotificationV2
./ng net.accelbyte.sdk.cli.Main csm bulkSaveSubscriptionAppNotificationV2 \
    --app '1MbqqZtfNWql4nmw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"subscribers": [{"emailAddress": "Aft4gqkNNlWkD9eO", "notificationType": {"ziYRFOn0jJLHC9Lx": false, "x0KOww3HICQLfl7M": true, "BG7qtPu64yAtURKL": false}, "userId": "BbRPZTF6oQAXVG7t"}, {"emailAddress": "nsZg5QgXjvyGJPN4", "notificationType": {"eXbJE5Vs2GcyomQo": true, "XimBJehyxlNsjUgx": true, "4P7WnbdSJtjX7Zsh": false}, "userId": "yZl5x4bRXBHUTrDz"}, {"emailAddress": "ZSKscfOcYu3dpCRO", "notificationType": {"YqUiGKXVFCmpo6sP": true, "t2ujQSa3Zdb65UXm": true, "2iS5EpGhhvXYck0u": true}, "userId": "QM0NBMA9ORxpzwLR"}]}' \
    > test.out 2>&1
eval_tap $? 63 'BulkSaveSubscriptionAppNotificationV2' test.out

#- 64 SubscribeAppNotificationV2
./ng net.accelbyte.sdk.cli.Main csm subscribeAppNotificationV2 \
    --app '2AK6eXUGPJsw1fiP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"notificationType": "80G9Pclxcft2ulIJ", "subscribers": [{"emailAddress": "zPyrVEiOG4UcqsuG", "userId": "KHhMRWLVd3DlhLuI"}, {"emailAddress": "pomM8sm1MiaI1mX2", "userId": "tJoARtdbBe7udsMr"}, {"emailAddress": "ok0WvGYYnx4V709x", "userId": "bnGezKsDwG2omOR2"}]}' \
    > test.out 2>&1
eval_tap $? 64 'SubscribeAppNotificationV2' test.out

#- 65 GetSubscriptionV2Handler
./ng net.accelbyte.sdk.cli.Main csm getSubscriptionV2Handler \
    --app 'nvYI9TVqJdvzcWbf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'GetSubscriptionV2Handler' test.out

#- 66 SubscribeV2Handler
./ng net.accelbyte.sdk.cli.Main csm subscribeV2Handler \
    --app 'UpaXp5JMl5LL4bTx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"notificationType": "BmZjdrrIxsB0NRsB"}' \
    > test.out 2>&1
eval_tap $? 66 'SubscribeV2Handler' test.out

#- 67 UnsubscribeV2Handler
./ng net.accelbyte.sdk.cli.Main csm unsubscribeV2Handler \
    --app '1fPqqRRulpqpymDk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'UnsubscribeV2Handler' test.out

#- 68 DeleteSubscriptionAppNotificationByUserIDV2
./ng net.accelbyte.sdk.cli.Main csm deleteSubscriptionAppNotificationByUserIDV2 \
    --app 'QhtrHWwRVnwVBOqO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hi8pWGd1juYhiqjR' \
    > test.out 2>&1
eval_tap $? 68 'DeleteSubscriptionAppNotificationByUserIDV2' test.out

#- 69 DeleteSubscriptionAppNotificationV2
eval_tap 0 69 'DeleteSubscriptionAppNotificationV2 # SKIP deprecated' test.out

#- 70 GetListOfVariablesV2
./ng net.accelbyte.sdk.cli.Main csm getListOfVariablesV2 \
    --app 'JOqB5F93zFQbJndU' \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 70 'GetListOfVariablesV2' test.out

#- 71 SaveVariableV2
./ng net.accelbyte.sdk.cli.Main csm saveVariableV2 \
    --app 'pdONneAczbBdHb2s' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": false, "configName": "AQUoY1GjlIIk0iKo", "description": "TTS1j02o7JjTXAQN", "source": "0qdskdQV0TqI8EFn", "value": "mDbxIxi4YKlONk2Q"}' \
    > test.out 2>&1
eval_tap $? 71 'SaveVariableV2' test.out

#- 72 UpdateVariableV2
./ng net.accelbyte.sdk.cli.Main csm updateVariableV2 \
    --app '5Y4JvaizwiilatuU' \
    --configId 'jjt9lIMGql5ElEa9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": true, "description": "VHfPEspxwhRON0bc", "value": "1eMbEIjowLqc3ecj"}' \
    > test.out 2>&1
eval_tap $? 72 'UpdateVariableV2' test.out

#- 73 DeleteVariableV2
./ng net.accelbyte.sdk.cli.Main csm deleteVariableV2 \
    --app 'XJbZDKKoxLE1Y3Dy' \
    --configId 'mtj3giPg4x4yiPX6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'DeleteVariableV2' test.out

#- 74 ListTopicsHandler
./ng net.accelbyte.sdk.cli.Main csm listTopicsHandler \
    --namespace "$AB_NAMESPACE" \
    --fuzzyTopicName 'ues1Hhhkg1yLVbLF' \
    --isSubscribedByAppName 'zHEP8cM4NTwr0KHa' \
    --isUnsubscribedByAppName 'AsmTej52WKi6tArA' \
    --limit '96' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 74 'ListTopicsHandler' test.out

#- 75 CreateTopicHandler
./ng net.accelbyte.sdk.cli.Main csm createTopicHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Rt9plCSVq8PdH6hJ", "topicName": "PUAc0RVwXgAgntLM"}' \
    > test.out 2>&1
eval_tap $? 75 'CreateTopicHandler' test.out

#- 76 DeleteTopicHandler
./ng net.accelbyte.sdk.cli.Main csm deleteTopicHandler \
    --namespace "$AB_NAMESPACE" \
    --topicName 'CuaXBWQi6BqPg4xr' \
    > test.out 2>&1
eval_tap $? 76 'DeleteTopicHandler' test.out

#- 77 GetListOfDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm getListOfDeploymentV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '22' \
    --body '{"appIds": ["rciYNEzvSZIPkhSg", "ORcz5S5BvmgBLxh4", "ijFnE3Tam69qSZ7P"], "deploymentIds": ["C6f6QkmZXElW9YfR", "Sse6AAz3S4czz0QK", "FlAVmVLu4AOec0z8"], "statuses": ["eBeeoip68J1nsv4W", "2OJhtafxMSJlHeb3", "4sZKHcl5LLLOexL4"]}' \
    > test.out 2>&1
eval_tap $? 77 'GetListOfDeploymentV2' test.out

#- 78 GetDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm getDeploymentV2 \
    --deploymentId 'fZvWtND2tcBFpX8l' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'GetDeploymentV2' test.out

#- 79 DeleteDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm deleteDeploymentV2 \
    --deploymentId 'NtFEJ7tnkY6Mca5a' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'DeleteDeploymentV2' test.out

#- 80 GetKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm getKeyValueClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --resourceId 'fj12K2IzrBvvWm4u' \
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
    --body '{"clusterName": "dE0OXudXgNne8kJA", "maxDataStorageGB": 94, "maxECPUPerSecond": 41, "profileName": "wlc6esUp6Sw1I98j"}' \
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
    --resourceId 'eZQ7hfxnhLd3Knak' \
    --body '{"maxDataStorageGB": 27, "maxECPUPerSecond": 84, "profileName": "oed9DHhLOqQGhCUr"}' \
    > test.out 2>&1
eval_tap $? 84 'UpdateKeyValueClusterV2' test.out

#- 85 DeleteKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm deleteKeyValueClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --resourceId '6iTrjyEgarAdNJOI' \
    > test.out 2>&1
eval_tap $? 85 'DeleteKeyValueClusterV2' test.out

#- 86 GetListIntegratedAppKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm getListIntegratedAppKeyValueClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --resourceId 'G36I6tRbRcrEveMd' \
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
    --body '{"maxDCU": 0.4272803715009188, "minDCU": 0.05719020349699522, "profileName": "iPKDUVSC00PYeDca"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateNoSQLClusterV2' test.out

#- 89 CreateNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm createNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"maxDCU": 0.09679243322154896, "minDCU": 0.11188314786345477, "profileName": "inxnFIna3yddcbsP"}' \
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
    --body '{"maxACU": 0.12276387416169887, "minACU": 0.06592508897660809, "multiAZ": true, "profileName": "H26IUJNvYuGRUvpZ"}' \
    > test.out 2>&1
eval_tap $? 96 'UpdateSQLClusterV2' test.out

#- 97 CreateSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm createSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"maxACU": 0.010544701389554323, "minACU": 0.540828395105691, "multiAZ": true, "profileName": "3PrIfapq5AAeMe4L"}' \
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
    --resourceId '3mDWORBVXTIIJM9X' \
    --appName 'sYIIZxiXNMR9BgaW' \
    --gameNamespace 'cFX3SUBhyoTsMWPA' \
    --limit '48' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 101 'GetSQLAppListV2' test.out

#- 102 GetNoSQLAppListV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLAppListV2 \
    --resourceId 'UMkawaGpAyrIwMif' \
    --studioName '3BOdkocVTd4BxqGW' \
    --appName 'V6mTJ0sQs6XNbjvq' \
    --limit '15' \
    --namespace "$AB_NAMESPACE" \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 102 'GetNoSQLAppListV2' test.out

#- 103 GetNotificationSubscriberListV3
./ng net.accelbyte.sdk.cli.Main csm getNotificationSubscriberListV3 \
    --app 'nUVLWu8olKdxL6oz' \
    --namespace "$AB_NAMESPACE" \
    --notificationType 'RmDD0jJvlfV5OemP' \
    > test.out 2>&1
eval_tap $? 103 'GetNotificationSubscriberListV3' test.out

#- 104 DeleteSubscriptionAppNotificationV3
./ng net.accelbyte.sdk.cli.Main csm deleteSubscriptionAppNotificationV3 \
    --app 'YdYT7DROCjtuzFMb' \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'AG9YI89hmguB8FOT' \
    --userId 'jMLo4b9rIzqYkEps' \
    > test.out 2>&1
eval_tap $? 104 'DeleteSubscriptionAppNotificationV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE