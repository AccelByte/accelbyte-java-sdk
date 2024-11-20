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
echo "1..46"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AuthCheck
./ng net.accelbyte.sdk.cli.Main ams authCheck \
    > test.out 2>&1
eval_tap $? 2 'AuthCheck' test.out

#- 3 PortalHealthCheck
./ng net.accelbyte.sdk.cli.Main ams portalHealthCheck \
    > test.out 2>&1
eval_tap $? 3 'PortalHealthCheck' test.out

#- 4 AdminAccountGet
./ng net.accelbyte.sdk.cli.Main ams adminAccountGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminAccountGet' test.out

#- 5 AdminAccountCreate
./ng net.accelbyte.sdk.cli.Main ams adminAccountCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "EAxcVpFrttufHIRd"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminAccountCreate' test.out

#- 6 AdminAccountLinkTokenGet
./ng net.accelbyte.sdk.cli.Main ams adminAccountLinkTokenGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminAccountLinkTokenGet' test.out

#- 7 AdminAccountLink
./ng net.accelbyte.sdk.cli.Main ams adminAccountLink \
    --namespace "$AB_NAMESPACE" \
    --body '{"token": "H9UzVRiXbqlAw7r6"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLink' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'W2ktQG0h5JAav5kR' \
    --count '0' \
    --endDate '4n8mzZ0m8SAMTwE6' \
    --fleetID 'I56IaRDBXxyaNoMR' \
    --imageID '6hkspInrAip6lyzS' \
    --maxSize '47' \
    --minSize '7' \
    --offset '46' \
    --region 'wpzS6DaDpv8N7ZQV' \
    --serverId 'qGj6oDLjWjkY1aXl' \
    --sortBy 'FcDtgOjchIua5tWE' \
    --sortDirection 'desc' \
    --startDate 'JSDgY1TXp38zsCTC' \
    --status 'rbCbPOyNQkT7NvyE' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactBulkDelete
./ng net.accelbyte.sdk.cli.Main ams artifactBulkDelete \
    --namespace "$AB_NAMESPACE" \
    --artifactType '3cwyALczNIicXm7a' \
    --fleetId 'gSrjJW2OQNOs1PXh' \
    --uploadedBefore '1994-10-20' \
    > test.out 2>&1
eval_tap $? 9 'ArtifactBulkDelete' test.out

#- 10 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactUsageGet' test.out

#- 11 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID 'FvdiRilZ7oFgx4c8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactDelete' test.out

#- 12 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'OumKtPDKJDXn7Z4U' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ArtifactGetURL' test.out

#- 13 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '490' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "8su8XfqlqNiTvB6S", "expiresAt": "1972-08-11T00:00:00Z", "imageId": "AdIhUDrwoZ5MecdK", "name": "i5r6QEa1ysLEzth6"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID 'mXhzkzWkFeZSoEAc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID 'BdW19m4eu6d5tA5j' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DevelopmentServerConfigurationDelete' test.out

#- 17 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    --active  \
    --name 'UmiTqpyhPFdxLzFQ' \
    --region 'N05MYzYiKWe5dNRl' \
    > test.out 2>&1
eval_tap $? 17 'FleetList' test.out

#- 18 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["AjGGJddVCvu9vx5K", "Q7KYnIuMBvaO35ll", "zQRaT5kPxUfofvnn"], "dsHostConfiguration": {"instanceId": "SuB0y5WUlrMdI4sN", "serversPerVm": 43}, "imageDeploymentProfile": {"commandLine": "kvR8sKgnuRkgghGo", "imageId": "YupD391C2qtPYoka", "portConfigurations": [{"name": "hFjkQsfCaTmt1d67", "protocol": "FXGk2s9Q0mPVo3tw"}, {"name": "u0MesTCf9x4rt69l", "protocol": "na7qxNeIxPz6MbwL"}, {"name": "6IY69z1UaLqYSYWy", "protocol": "tLPziZMdjxcBZufQ"}], "timeout": {"claim": 48, "creation": 54, "drain": 66, "session": 87, "unresponsive": 18}}, "name": "6iiPlSC2uE4o5Vwd", "onDemand": false, "regions": [{"bufferSize": 24, "dynamicBuffer": false, "maxServerCount": 80, "minServerCount": 8, "region": "qHcUmLZZbSqb8RwN"}, {"bufferSize": 25, "dynamicBuffer": true, "maxServerCount": 27, "minServerCount": 59, "region": "9HrNQy4uZAAiE0mi"}, {"bufferSize": 39, "dynamicBuffer": true, "maxServerCount": 6, "minServerCount": 57, "region": "jsoqwGyzzWi9gwQY"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 54}}, "logs": {"crashed": {"collect": true, "percentage": 50}, "success": {"collect": true, "percentage": 30}, "unclaimed": {"collect": false, "percentage": 94}}}}' \
    > test.out 2>&1
eval_tap $? 18 'FleetCreate' test.out

#- 19 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID '6Jt4Ymos9Jcdos4f' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'FleetGet' test.out

#- 20 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'YcTVU6RBt0zYoMcH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["qxpBFmaLoxozr6wf", "NPX2bOItRMvqtlB2", "jJCSQT279ZZPYGu0"], "dsHostConfiguration": {"instanceId": "rdlgdWyOtXi3choQ", "serversPerVm": 35}, "imageDeploymentProfile": {"commandLine": "X68cmDc3fxU8MyKr", "imageId": "QpM4hkkK6KKXNB3G", "portConfigurations": [{"name": "v0IqmF51TkhjYnaq", "protocol": "6foWvXa3bMrXsDr6"}, {"name": "kILsSSyDdmykmoPY", "protocol": "gc2L4jk4Lo0LSP0p"}, {"name": "f4IxjUkl535X3ate", "protocol": "EKDpADz1x3poD3Qg"}], "timeout": {"claim": 2, "creation": 9, "drain": 3, "session": 30, "unresponsive": 5}}, "name": "LQQ1MzH7Qm8bwbmX", "onDemand": false, "regions": [{"bufferSize": 80, "dynamicBuffer": false, "maxServerCount": 60, "minServerCount": 55, "region": "UPVJf6c2Z0QZxfgP"}, {"bufferSize": 41, "dynamicBuffer": true, "maxServerCount": 2, "minServerCount": 12, "region": "TDIHrvqAThuwjRHp"}, {"bufferSize": 74, "dynamicBuffer": true, "maxServerCount": 74, "minServerCount": 9, "region": "TlmVr9XuoJbRFQSK"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 3}}, "logs": {"crashed": {"collect": false, "percentage": 14}, "success": {"collect": false, "percentage": 48}, "unclaimed": {"collect": true, "percentage": 87}}}}' \
    > test.out 2>&1
eval_tap $? 20 'FleetUpdate' test.out

#- 21 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'u7LQRENjEEztx1Ws' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetDelete' test.out

#- 22 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'YSiZqan0nSBJroav' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetArtifactSamplingRulesGet' test.out

#- 23 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID '91GXlvPG6bFYReVH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": false, "percentage": 6}}, "logs": {"crashed": {"collect": true, "percentage": 5}, "success": {"collect": true, "percentage": 59}, "unclaimed": {"collect": false, "percentage": 48}}}' \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesSet' test.out

#- 24 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'gWa24CKNS0GqVvUf' \
    --namespace "$AB_NAMESPACE" \
    --count '70' \
    --offset '62' \
    --region 'QvsHXNUNe4mhgo5Q' \
    --serverId 'B65lSAiYnNjkfZrQ' \
    --sortBy 'vGgbLdLsFzHkBMr1' \
    --sortDirection 'desc' \
    --status 'draining' \
    > test.out 2>&1
eval_tap $? 24 'FleetServers' test.out

#- 25 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'rOMlNFSrUEirnjX9' \
    --namespace "$AB_NAMESPACE" \
    --count '11' \
    --offset '92' \
    --reason 'DmIbeZxzfTcyiuAT' \
    --region 'us9hsfpFDcSDG8aM' \
    --serverId 'VGLiBNrDjqoxcwgG' \
    --sortDirection 'LXpUL4pp2ncYAHdN' \
    --status 'zDmeIP6rOvDz9KOs' \
    > test.out 2>&1
eval_tap $? 25 'FleetServerHistory' test.out

#- 26 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '3' \
    --inUse 'SZLxoRDFuuuySj29' \
    --isProtected  \
    --name 'a9LJE8HoRS1X2PFA' \
    --offset '54' \
    --sortBy 'nkCmBUqg2SCnqntX' \
    --sortDirection '9y1aZSWMiVi10sG6' \
    --status 'vxkfUcmqRRbceJ5i' \
    --tag '0EeDxOgBnhhqElIa' \
    > test.out 2>&1
eval_tap $? 26 'ImageList' test.out

#- 27 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'ImagesStorage' test.out

#- 28 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'Dml48wdNFLTm5T50' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImageGet' test.out

#- 29 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'x9WT0GfH2rtOa4EX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImageMarkForDeletion' test.out

#- 30 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'sXzOXQAk4mqrxzTt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["uLl4XlbGL8QOxtjz", "m8y2wNhmwoYZyI4E", "FZKBcYrCEAE7WIsf"], "isProtected": false, "name": "hwH3q31A806DJgas", "removedTags": ["4b6z3LNUj7fdgLA8", "4Z8YYk6QEgJjBbED", "oNf3n0hEoRCAcf80"]}' \
    > test.out 2>&1
eval_tap $? 30 'ImagePatch' test.out

#- 31 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'zfFyabWAgIUXiI07' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ImageUnmarkForDeletion' test.out

#- 32 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'A68eaqC2J9jyEW6G' \
    > test.out 2>&1
eval_tap $? 32 'QoSRegionsGet' test.out

#- 33 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'Lbc0NaKDUL3sa13l' \
    --body '{"status": "k1dQBHO86IlBhnet"}' \
    > test.out 2>&1
eval_tap $? 33 'QoSRegionsUpdate' test.out

#- 34 InfoRegions
./ng net.accelbyte.sdk.cli.Main ams infoRegions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'InfoRegions' test.out

#- 35 FleetServerInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'U4RwTqUXlTDBzOuY' \
    > test.out 2>&1
eval_tap $? 35 'FleetServerInfo' test.out

#- 36 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'saZA2yyd4mbqoOfA' \
    > test.out 2>&1
eval_tap $? 36 'FleetServerConnectionInfo' test.out

#- 37 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'DMMAXFaY9eKa699b' \
    > test.out 2>&1
eval_tap $? 37 'ServerHistory' test.out

#- 38 InfoSupportedInstances
./ng net.accelbyte.sdk.cli.Main ams infoSupportedInstances \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'InfoSupportedInstances' test.out

#- 39 AccountGet
./ng net.accelbyte.sdk.cli.Main ams accountGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'AccountGet' test.out

#- 40 FleetClaimByID
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByID \
    --fleetID 'RVhyaKwwrAP2aMlu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "7WtjCtoYetOO847g", "sessionId": "8OudOfjnCuHZ3c46"}' \
    > test.out 2>&1
eval_tap $? 40 'FleetClaimByID' test.out

#- 41 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'IjGa23YvYmmDg7VY' \
    > test.out 2>&1
eval_tap $? 41 'LocalWatchdogConnect' test.out

#- 42 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["PXIuvUYTZBRujIUE", "1Tq5jyAZvkRCMNFI", "urjh2imdb4rbkXj0"], "regions": ["ZwsVC0gL97ZVJSPq", "Jiwv1qlYB1RSKs6g", "QxC3Gb7S0o4zGYY7"], "sessionId": "KQI1AeFgPqaOkvo1"}' \
    > test.out 2>&1
eval_tap $? 42 'FleetClaimByKeys' test.out

#- 43 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'aolB4lkKB4EYOkQ1' \
    > test.out 2>&1
eval_tap $? 43 'WatchdogConnect' test.out

#- 44 UploadURLGet
./ng net.accelbyte.sdk.cli.Main ams uploadURLGet \
    > test.out 2>&1
eval_tap $? 44 'UploadURLGet' test.out

#- 45 Func1
./ng net.accelbyte.sdk.cli.Main ams func1 \
    > test.out 2>&1
eval_tap $? 45 'Func1' test.out

#- 46 BasicHealthCheck
./ng net.accelbyte.sdk.cli.Main ams basicHealthCheck \
    > test.out 2>&1
eval_tap $? 46 'BasicHealthCheck' test.out


rm -f "tmp.dat"

exit $EXIT_CODE