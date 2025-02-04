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
echo "1..56"

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

#- 30 CreateDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm createDeploymentV2 \
    --app 'l3rGN9A3sNm84hdd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"imageTag": "SpHt0P7MIIR7CkyF"}' \
    > test.out 2>&1
eval_tap $? 30 'CreateDeploymentV2' test.out

#- 31 GetAppImageListV2
./ng net.accelbyte.sdk.cli.Main csm getAppImageListV2 \
    --app '6C7duuyZ0GhDogqr' \
    --namespace "$AB_NAMESPACE" \
    --cached 'hBRd8lDR6qVNPRZY' \
    > test.out 2>&1
eval_tap $? 31 'GetAppImageListV2' test.out

#- 32 DeleteAppImagesV2
./ng net.accelbyte.sdk.cli.Main csm deleteAppImagesV2 \
    --app 'dFLIAjGGJddVCvu9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"imageTags": ["vx5KQ7KYnIuMBvaO", "35llzQRaT5kPxUfo", "fvnnSuB0y5WUlrMd"]}' \
    > test.out 2>&1
eval_tap $? 32 'DeleteAppImagesV2' test.out

#- 33 UpdateAppResourcesV2
./ng net.accelbyte.sdk.cli.Main csm updateAppResourcesV2 \
    --app 'I4sNveabntBSxTeI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 43}, "cpu": {"requestCPU": 13}, "memory": {"requestMemory": 15}, "replica": {"maxReplica": 67, "minReplica": 68}, "vmSharingConfiguration": "oYupD391C2qtPYok"}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateAppResourcesV2' test.out

#- 34 UpdateAppResourcesResourceLimitFormV2
./ng net.accelbyte.sdk.cli.Main csm updateAppResourcesResourceLimitFormV2 \
    --app 'ahFjkQsfCaTmt1d6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientEmail": "7FXGk2s9Q0mPVo3t", "preferredLimitReplica": 47, "requestReason": "td6TC6I3lMjGSWN2"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateAppResourcesResourceLimitFormV2' test.out

#- 35 GetListOfSecretsV2
./ng net.accelbyte.sdk.cli.Main csm getListOfSecretsV2 \
    --app 'laRlxfcjHfYakUCT' \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 35 'GetListOfSecretsV2' test.out

#- 36 SaveSecretV2
./ng net.accelbyte.sdk.cli.Main csm saveSecretV2 \
    --app 'IY69z1UaLqYSYWyt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": true, "configName": "0yYoNRKd3IL5TAQ6", "description": "iiPlSC2uE4o5Vwdo", "source": "3fePqIJA8IHtrkmu", "value": "0hpDDWVAla2l5BYN"}' \
    > test.out 2>&1
eval_tap $? 36 'SaveSecretV2' test.out

#- 37 UpdateSecretV2
./ng net.accelbyte.sdk.cli.Main csm updateSecretV2 \
    --app 'tIuS5S5XUdjsoqwG' \
    --configId 'yzzWi9gwQYv7t1o7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": false, "description": "Tr1DmrhZv15T7quI", "value": "OvBMcaYmvCkGZ5dA"}' \
    > test.out 2>&1
eval_tap $? 37 'UpdateSecretV2' test.out

#- 38 DeleteSecretV2
./ng net.accelbyte.sdk.cli.Main csm deleteSecretV2 \
    --app 'gqxpBFmaLoxozr6w' \
    --configId 'fNPX2bOItRMvqtlB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'DeleteSecretV2' test.out

#- 39 StartAppV2
./ng net.accelbyte.sdk.cli.Main csm startAppV2 \
    --app '2jJCSQT279ZZPYGu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'StartAppV2' test.out

#- 40 StopAppV2
./ng net.accelbyte.sdk.cli.Main csm stopAppV2 \
    --app '0rdlgdWyOtXi3cho' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'StopAppV2' test.out

#- 41 GetNotificationSubscriberListV2
./ng net.accelbyte.sdk.cli.Main csm getNotificationSubscriberListV2 \
    --app 'QrpOsDBU5SepjChB' \
    --namespace "$AB_NAMESPACE" \
    --notificationType '3V0v52Dlym6puQ23' \
    > test.out 2>&1
eval_tap $? 41 'GetNotificationSubscriberListV2' test.out

#- 42 BulkSaveSubscriptionAppNotificationV2
./ng net.accelbyte.sdk.cli.Main csm bulkSaveSubscriptionAppNotificationV2 \
    --app 'xoJ8aeCnaLpUKp44' \
    --namespace "$AB_NAMESPACE" \
    --body '{"subscribers": [{"notificationType": {"YUDjasWIPUvmEejt": false, "kILsSSyDdmykmoPY": false, "5MXbN9oCMNqq98Sj": true}, "userId": "IxjUkl535X3ateEK"}, {"notificationType": {"DpADz1x3poD3Qgb3": false, "8c5csSovoqsZNBdt": false, "XgdAPh1EThG96gAF": false}, "userId": "K2WDgCcxvONZm3Ee"}, {"notificationType": {"ERmDnyeFoF7VSZ6p": false, "bRFQSKVPHbn4Xxtu": false, "LQRENjEEztx1WsYS": false}, "userId": "ck0ZHn5GI39YBHqa"}]}' \
    > test.out 2>&1
eval_tap $? 42 'BulkSaveSubscriptionAppNotificationV2' test.out

#- 43 SubscribeAppNotificationV2
./ng net.accelbyte.sdk.cli.Main csm subscribeAppNotificationV2 \
    --app 'THeKtW18iGeUlc9d' \
    --namespace "$AB_NAMESPACE" \
    --body '{"notificationType": "9sogWa24CKNS0GqV", "subscribers": [{"userId": "vUfHQvsHXNUNe4mh"}, {"userId": "go5QB65lSAiYnNjk"}, {"userId": "fZrQvGgbLdLsFzHk"}]}' \
    > test.out 2>&1
eval_tap $? 43 'SubscribeAppNotificationV2' test.out

#- 44 GetSubscriptionV2Handler
./ng net.accelbyte.sdk.cli.Main csm getSubscriptionV2Handler \
    --app 'BMr1yrOMlNFSrUEi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'GetSubscriptionV2Handler' test.out

#- 45 SubscribeV2Handler
./ng net.accelbyte.sdk.cli.Main csm subscribeV2Handler \
    --app 'rnjX9fDmIbeZxzfT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"notificationType": "cyiuATus9hsfpFDc"}' \
    > test.out 2>&1
eval_tap $? 45 'SubscribeV2Handler' test.out

#- 46 UnsubscribeV2Handler
./ng net.accelbyte.sdk.cli.Main csm unsubscribeV2Handler \
    --app 'SDG8aMVGLiBNrDjq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'UnsubscribeV2Handler' test.out

#- 47 DeleteSubscriptionAppNotificationByUserIDV2
./ng net.accelbyte.sdk.cli.Main csm deleteSubscriptionAppNotificationByUserIDV2 \
    --app 'oxcwgGLXpUL4pp2n' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cYAHdNzDmeIP6rOv' \
    > test.out 2>&1
eval_tap $? 47 'DeleteSubscriptionAppNotificationByUserIDV2' test.out

#- 48 DeleteSubscriptionAppNotificationV2
eval_tap 0 48 'DeleteSubscriptionAppNotificationV2 # SKIP deprecated' test.out

#- 49 GetListOfVariablesV2
./ng net.accelbyte.sdk.cli.Main csm getListOfVariablesV2 \
    --app 'Dz9KOsb392k6YmJF' \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 49 'GetListOfVariablesV2' test.out

#- 50 SaveVariableV2
./ng net.accelbyte.sdk.cli.Main csm saveVariableV2 \
    --app 'RByjlBiuFM3FIoVk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": false, "configName": "AAMwzHPxB1UskYs4", "description": "Yw20DOqOBSC2DKHR", "source": "uPMMWH8Yb33T5UBJ", "value": "CjfcnLRfxeCSz9WE"}' \
    > test.out 2>&1
eval_tap $? 50 'SaveVariableV2' test.out

#- 51 UpdateVariableV2
./ng net.accelbyte.sdk.cli.Main csm updateVariableV2 \
    --app 'i8KlloeH0JT1ydua' \
    --configId 't2vQR3biBfsu4jms' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": true, "description": "sXzOXQAk4mqrxzTt", "value": "uLl4XlbGL8QOxtjz"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateVariableV2' test.out

#- 52 DeleteVariableV2
./ng net.accelbyte.sdk.cli.Main csm deleteVariableV2 \
    --app 'm8y2wNhmwoYZyI4E' \
    --configId 'FZKBcYrCEAE7WIsf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteVariableV2' test.out

#- 53 GetListOfDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm getListOfDeploymentV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '15' \
    --body '{"appIds": ["x40NLRc6m8heKnWh", "zfe2NubeoKFeIaFQ", "CYoDPICpnduEEQlU"], "deploymentIds": ["LdJz4mnRBkMNxvvK", "gAT8mJrYq6hRkloq", "xM3gpwxcfMy9Xzjj"], "statuses": ["I5YbsKoADkzJEN2V", "Hzih3bit0VWn3CO3", "9PXDNxtXgeO3FgkX"]}' \
    > test.out 2>&1
eval_tap $? 53 'GetListOfDeploymentV2' test.out

#- 54 GetDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm getDeploymentV2 \
    --deploymentId 'hjDzaQY3snn2ZkP7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'GetDeploymentV2' test.out

#- 55 DeleteDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm deleteDeploymentV2 \
    --deploymentId 'cFdP43e5dC9XIBud' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'DeleteDeploymentV2' test.out

#- 56 GetResourcesLimits
./ng net.accelbyte.sdk.cli.Main csm getResourcesLimits \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'GetResourcesLimits' test.out


rm -f "tmp.dat"

exit $EXIT_CODE