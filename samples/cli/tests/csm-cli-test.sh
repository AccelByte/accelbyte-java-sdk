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
echo "1..67"

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

#- 33 CreateNoSQLDatabaseCredentialV2
./ng net.accelbyte.sdk.cli.Main csm createNoSQLDatabaseCredentialV2 \
    --app 'I4sNveabntBSxTeI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"password": "v53HGCiljvjKoyD6", "username": "SCwGrncqmLtjQHAf"}' \
    > test.out 2>&1
eval_tap $? 33 'CreateNoSQLDatabaseCredentialV2' test.out

#- 34 GetNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLDatabaseV2 \
    --app '8TgoNm03VLisV6zw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'GetNoSQLDatabaseV2' test.out

#- 35 CreateNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm createNoSQLDatabaseV2 \
    --app 'Puo3td6TC6I3lMjG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"dbName": "SWN2laRlxfcjHfYa", "password": "kUCTqGkE7wcWfDsl", "username": "pJSqGAXQ0yYoNRKd"}' \
    > test.out 2>&1
eval_tap $? 35 'CreateNoSQLDatabaseV2' test.out

#- 36 DeleteNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm deleteNoSQLDatabaseV2 \
    --app '3IL5TAQ6iiPlSC2u' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'DeleteNoSQLDatabaseV2' test.out

#- 37 UpdateAppResourcesV2
./ng net.accelbyte.sdk.cli.Main csm updateAppResourcesV2 \
    --app 'E4o5Vwdo3fePqIJA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 70}, "cpu": {"requestCPU": 69}, "memory": {"requestMemory": 2}, "replica": {"maxReplica": 40, "minReplica": 91}, "vmSharingConfiguration": "rkmu0hpDDWVAla2l"}' \
    > test.out 2>&1
eval_tap $? 37 'UpdateAppResourcesV2' test.out

#- 38 UpdateAppResourcesResourceLimitFormV2
./ng net.accelbyte.sdk.cli.Main csm updateAppResourcesResourceLimitFormV2 \
    --app '5BYNtIuS5S5XUdjs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientEmail": "oqwGyzzWi9gwQYv7", "preferredLimitReplica": 39, "requestReason": "yu7Vk6Jt4Ymos9Jc"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateAppResourcesResourceLimitFormV2' test.out

#- 39 GetListOfSecretsV2
./ng net.accelbyte.sdk.cli.Main csm getListOfSecretsV2 \
    --app 'dos4fYcTVU6RBt0z' \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 39 'GetListOfSecretsV2' test.out

#- 40 SaveSecretV2
./ng net.accelbyte.sdk.cli.Main csm saveSecretV2 \
    --app 'dAgqxpBFmaLoxozr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"configName": "6wfNPX2bOItRMvqt", "description": "lB2jJCSQT279ZZPY", "source": "Gu0rdlgdWyOtXi3c", "value": "hoQrpOsDBU5SepjC"}' \
    > test.out 2>&1
eval_tap $? 40 'SaveSecretV2' test.out

#- 41 UpdateSecretV2
./ng net.accelbyte.sdk.cli.Main csm updateSecretV2 \
    --app 'hB3V0v52Dlym6puQ' \
    --configId '23xoJ8aeCnaLpUKp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "44YUDjasWIPUvmEe", "value": "jtGeoyIPa8ZRrvjj"}' \
    > test.out 2>&1
eval_tap $? 41 'UpdateSecretV2' test.out

#- 42 DeleteSecretV2
./ng net.accelbyte.sdk.cli.Main csm deleteSecretV2 \
    --app '7il35MXbN9oCMNqq' \
    --configId '98SjTvhZNkSQ70D0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'DeleteSecretV2' test.out

#- 43 StartAppV2
./ng net.accelbyte.sdk.cli.Main csm startAppV2 \
    --app 'H6BXksUC9b6i5lZC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'StartAppV2' test.out

#- 44 StopAppV2
./ng net.accelbyte.sdk.cli.Main csm stopAppV2 \
    --app '9xv32e8c5csSovoq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'StopAppV2' test.out

#- 45 GetNotificationSubscriberListV2
./ng net.accelbyte.sdk.cli.Main csm getNotificationSubscriberListV2 \
    --app 'sZNBdte9NDUPVJf6' \
    --namespace "$AB_NAMESPACE" \
    --notificationType 'c2Z0QZxfgPubTDIH' \
    > test.out 2>&1
eval_tap $? 45 'GetNotificationSubscriberListV2' test.out

#- 46 BulkSaveSubscriptionAppNotificationV2
./ng net.accelbyte.sdk.cli.Main csm bulkSaveSubscriptionAppNotificationV2 \
    --app 'rvqAThuwjRHpKKTl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"subscribers": [{"emailAddress": "mVr9XuoJbRFQSKVP", "notificationType": {"Hbn4Xxtu7LQRENjE": true, "U6YE3p4lSck0ZHn5": true, "I39YBHqaTHeKtW18": false}, "userId": "YReVHQipcCx9Zw5D"}, {"emailAddress": "2L7vIYhGGSyEW4ZJ", "notificationType": {"J42d3PBddN8S48l9": false, "AiYnNjkfZrQvGgbL": false, "3QXcKMDYDDxHSZjt": true}, "userId": "FSrUEirnjX9fDmIb"}, {"emailAddress": "eZxzfTcyiuATus9h", "notificationType": {"sfpFDcSDG8aMVGLi": true, "tI8ilbyDPUIj88ce": false, "4pp2ncYAHdNzDmeI": false}, "userId": "rOvDz9KOsb392k6Y"}]}' \
    > test.out 2>&1
eval_tap $? 46 'BulkSaveSubscriptionAppNotificationV2' test.out

#- 47 SubscribeAppNotificationV2
./ng net.accelbyte.sdk.cli.Main csm subscribeAppNotificationV2 \
    --app 'mJFfRByjlBiuFM3F' \
    --namespace "$AB_NAMESPACE" \
    --body '{"notificationType": "IoVk8T3GpAnkCmBU", "subscribers": [{"emailAddress": "qg2SCnqntX9y1aZS", "userId": "WMiVi10sG6vxkfUc"}, {"emailAddress": "mqRRbceJ5i0EeDxO", "userId": "gBnhhqElIaDml48w"}, {"emailAddress": "dNFLTm5T50x9WT0G", "userId": "fH2rtOa4EXsXzOXQ"}]}' \
    > test.out 2>&1
eval_tap $? 47 'SubscribeAppNotificationV2' test.out

#- 48 GetSubscriptionV2Handler
./ng net.accelbyte.sdk.cli.Main csm getSubscriptionV2Handler \
    --app 'Ak4mqrxzTtuLl4Xl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'GetSubscriptionV2Handler' test.out

#- 49 SubscribeV2Handler
./ng net.accelbyte.sdk.cli.Main csm subscribeV2Handler \
    --app 'bGL8QOxtjzm8y2wN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"notificationType": "hmwoYZyI4EFZKBcY"}' \
    > test.out 2>&1
eval_tap $? 49 'SubscribeV2Handler' test.out

#- 50 UnsubscribeV2Handler
./ng net.accelbyte.sdk.cli.Main csm unsubscribeV2Handler \
    --app 'rCEAE7WIsfmx40NL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'UnsubscribeV2Handler' test.out

#- 51 DeleteSubscriptionAppNotificationByUserIDV2
./ng net.accelbyte.sdk.cli.Main csm deleteSubscriptionAppNotificationByUserIDV2 \
    --app 'Rc6m8heKnWhzfe2N' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ubeoKFeIaFQCYoDP' \
    > test.out 2>&1
eval_tap $? 51 'DeleteSubscriptionAppNotificationByUserIDV2' test.out

#- 52 DeleteSubscriptionAppNotificationV2
eval_tap 0 52 'DeleteSubscriptionAppNotificationV2 # SKIP deprecated' test.out

#- 53 GetListOfVariablesV2
./ng net.accelbyte.sdk.cli.Main csm getListOfVariablesV2 \
    --app 'ICpnduEEQlULdJz4' \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 53 'GetListOfVariablesV2' test.out

#- 54 SaveVariableV2
./ng net.accelbyte.sdk.cli.Main csm saveVariableV2 \
    --app 'nRBkMNxvvKgAT8mJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": true, "configName": "AgIUXiI07A68eaqC", "description": "2J9jyEW6GLbc0NaK", "source": "DUL3sa13lk1dQBHO", "value": "86IlBhnetU4RwTqU"}' \
    > test.out 2>&1
eval_tap $? 54 'SaveVariableV2' test.out

#- 55 UpdateVariableV2
./ng net.accelbyte.sdk.cli.Main csm updateVariableV2 \
    --app 'XlTDBzOuYsaZA2yy' \
    --configId 'd4mbqoOfADMMAXFa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": false, "description": "eKa699bRVhyaKwwr", "value": "AP2aMlu7WtjCtoYe"}' \
    > test.out 2>&1
eval_tap $? 55 'UpdateVariableV2' test.out

#- 56 DeleteVariableV2
./ng net.accelbyte.sdk.cli.Main csm deleteVariableV2 \
    --app 'tOO847g8OudOfjnC' \
    --configId 'uHZ3c46IjGa23YvY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'DeleteVariableV2' test.out

#- 57 GetListOfDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm getListOfDeploymentV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '81' \
    --body '{"appIds": ["mDg7VYPXIuvUYTZB", "RujIUE1Tq5jyAZvk", "RCMNFIurjh2imdb4"], "deploymentIds": ["rbkXj0ZwsVC0gL97", "ZVJSPqJiwv1qlYB1", "RSKs6gQxC3Gb7S0o"], "statuses": ["4zGYY7KQI1AeFgPq", "aOkvo1aolB4lkKB4", "EYOkQ1jMD3cym8xI"]}' \
    > test.out 2>&1
eval_tap $? 57 'GetListOfDeploymentV2' test.out

#- 58 GetDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm getDeploymentV2 \
    --deploymentId 'fkOVW2grREOLx0KO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'GetDeploymentV2' test.out

#- 59 DeleteDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm deleteDeploymentV2 \
    --deploymentId 'ww3HICQLfl7MUBG7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'DeleteDeploymentV2' test.out

#- 60 GetNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'GetNoSQLClusterV2' test.out

#- 61 UpdateNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm updateNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"maxDCU": 0.2682708218826877, "minDCU": 0.3086752439679066, "profileName": "Pu64yAtURKLRkb73"}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateNoSQLClusterV2' test.out

#- 62 CreateNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm createNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"maxDCU": 0.9829409631506866, "minDCU": 0.5424495692271428, "profileName": "GS6rDgMdIIlhS1fS"}' \
    > test.out 2>&1
eval_tap $? 62 'CreateNoSQLClusterV2' test.out

#- 63 DeleteNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm deleteNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteNoSQLClusterV2' test.out

#- 64 GetNoSQLAccessTunnelV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLAccessTunnelV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetNoSQLAccessTunnelV2' test.out

#- 65 GetResourcesLimits
./ng net.accelbyte.sdk.cli.Main csm getResourcesLimits \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'GetResourcesLimits' test.out

#- 66 GetNotificationSubscriberListV3
./ng net.accelbyte.sdk.cli.Main csm getNotificationSubscriberListV3 \
    --app 'iM9331m7Ta1PsKc5' \
    --namespace "$AB_NAMESPACE" \
    --notificationType '0Kv6ecnEevcAx2K2' \
    > test.out 2>&1
eval_tap $? 66 'GetNotificationSubscriberListV3' test.out

#- 67 DeleteSubscriptionAppNotificationV3
./ng net.accelbyte.sdk.cli.Main csm deleteSubscriptionAppNotificationV3 \
    --app 'zkRenmPZnGBt4P7W' \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'nbdSJtjX7ZshZyZl' \
    --userId '5x4bRXBHUTrDzZSK' \
    > test.out 2>&1
eval_tap $? 67 'DeleteSubscriptionAppNotificationV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE