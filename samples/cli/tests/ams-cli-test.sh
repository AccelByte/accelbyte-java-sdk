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

#- 7 AdminAccountLinkTokenPost
./ng net.accelbyte.sdk.cli.Main ams adminAccountLinkTokenPost \
    --namespace "$AB_NAMESPACE" \
    --body '{"token": "H9UzVRiXbqlAw7r6"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLinkTokenPost' test.out

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
    --startDate 'FcDtgOjchIua5tWE' \
    --status 'IC32ogW7olvbTgrh' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactBulkDelete
./ng net.accelbyte.sdk.cli.Main ams artifactBulkDelete \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'RTcPiSuL0Sly6XM4' \
    --fleetId 'OI18mAQLnzjMf8GZ' \
    --uploadedBefore '1997-12-26' \
    > test.out 2>&1
eval_tap $? 9 'ArtifactBulkDelete' test.out

#- 10 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactUsageGet' test.out

#- 11 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID 'WBZqxYG3aREAu2D6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactDelete' test.out

#- 12 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'QVKNCWP75TB0i7pK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ArtifactGetURL' test.out

#- 13 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '204' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "R8dl0zRVW4EZG9m0", "imageId": "XcgGVbMqSszE8GHa", "name": "vj7AorKsxwkosAVe"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID 'rXpc1C8XfwHuKeb9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID 'l3rGN9A3sNm84hdd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DevelopmentServerConfigurationDelete' test.out

#- 17 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'FleetList' test.out

#- 18 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["pHt0P7MIIR7CkyF6", "C7duuyZ0GhDogqrh", "BRd8lDR6qVNPRZYd"], "dsHostConfiguration": {"instanceId": "FLIAjGGJddVCvu9v", "instanceType": "x5KQ7KYnIuMBvaO3", "serversPerVm": 71}, "imageDeploymentProfile": {"commandLine": "llzQRaT5kPxUfofv", "imageId": "nnSuB0y5WUlrMdI4", "portConfigurations": [{"name": "sNveabntBSxTeIv5", "protocol": "3HGCiljvjKoyD6SC"}, {"name": "wGrncqmLtjQHAf8T", "protocol": "goNm03VLisV6zwPu"}, {"name": "o3td6TC6I3lMjGSW", "protocol": "N2laRlxfcjHfYakU"}], "timeout": {"creation": 59, "drain": 46, "session": 94, "unresponsive": 77}}, "name": "qGkE7wcWfDslpJSq", "onDemand": true, "regions": [{"bufferSize": 55, "dynamicBuffer": true, "maxServerCount": 18, "minServerCount": 50, "region": "ZMdjxcBZufQxGiHP"}, {"bufferSize": 24, "dynamicBuffer": false, "maxServerCount": 23, "minServerCount": 67, "region": "SC2uE4o5Vwdo3feP"}, {"bufferSize": 33, "dynamicBuffer": false, "maxServerCount": 70, "minServerCount": 95, "region": "JA8IHtrkmu0hpDDW"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 54}, "success": {"collect": false, "percentage": 88}}, "logs": {"crashed": {"collect": false, "percentage": 49}, "success": {"collect": false, "percentage": 43}}}}' \
    > test.out 2>&1
eval_tap $? 18 'FleetCreate' test.out

#- 19 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID '5BYNtIuS5S5XUdjs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'FleetGet' test.out

#- 20 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'oqwGyzzWi9gwQYv7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["yu7Vk6Jt4Ymos9Jc", "dos4fYcTVU6RBt0z", "YoMcHyCUEXlAvxJM"], "dsHostConfiguration": {"instanceId": "dalwSyliWMNW5NyL", "instanceType": "u0M3VHh2EI8JlDbP", "serversPerVm": 99}, "imageDeploymentProfile": {"commandLine": "PYGu0rdlgdWyOtXi", "imageId": "3choQrpOsDBU5Sep", "portConfigurations": [{"name": "jChB3V0v52Dlym6p", "protocol": "uQ23xoJ8aeCnaLpU"}, {"name": "Kp44YUDjasWIPUvm", "protocol": "EejtGeoyIPa8ZRrv"}, {"name": "jj7il35MXbN9oCMN", "protocol": "qq98SjTvhZNkSQ70"}], "timeout": {"creation": 60, "drain": 69, "session": 1, "unresponsive": 40}}, "name": "BXksUC9b6i5lZC9x", "onDemand": true, "regions": [{"bufferSize": 14, "dynamicBuffer": false, "maxServerCount": 9, "minServerCount": 3, "region": "8c5csSovoqsZNBdt"}, {"bufferSize": 9, "dynamicBuffer": false, "maxServerCount": 80, "minServerCount": 7, "region": "DUPVJf6c2Z0QZxfg"}, {"bufferSize": 86, "dynamicBuffer": true, "maxServerCount": 60, "minServerCount": 2, "region": "gCcxvONZm3EeERmD"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 74}, "success": {"collect": true, "percentage": 74}}, "logs": {"crashed": {"collect": false, "percentage": 93}, "success": {"collect": false, "percentage": 29}}}}' \
    > test.out 2>&1
eval_tap $? 20 'FleetUpdate' test.out

#- 21 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'mVr9XuoJbRFQSKVP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetDelete' test.out

#- 22 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'Hbn4Xxtu7LQRENjE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetArtifactSamplingRulesGet' test.out

#- 23 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'Eztx1WsYSiZqan0n' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": true, "percentage": 70}, "success": {"collect": true, "percentage": 30}}, "logs": {"crashed": {"collect": false, "percentage": 57}, "success": {"collect": true, "percentage": 69}}}' \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesSet' test.out

#- 24 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID '91GXlvPG6bFYReVH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'FleetServers' test.out

#- 25 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'QipcCx9Zw5D2L7vI' \
    --namespace "$AB_NAMESPACE" \
    --count '33' \
    --offset '15' \
    --reason 'VvUfHQvsHXNUNe4m' \
    --region 'hgo5QB65lSAiYnNj' \
    --serverId 'kfZrQvGgbLdLsFzH' \
    --sortDirection 'kBMr1yrOMlNFSrUE' \
    --status 'irnjX9fDmIbeZxzf' \
    > test.out 2>&1
eval_tap $? 25 'FleetServerHistory' test.out

#- 26 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'ImageList' test.out

#- 27 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'ImagesStorage' test.out

#- 28 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'TcyiuATus9hsfpFD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImageGet' test.out

#- 29 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'cSDG8aMVGLiBNrDj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImageMarkForDeletion' test.out

#- 30 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'qoxcwgGLXpUL4pp2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["ncYAHdNzDmeIP6rO", "vDz9KOsb392k6YmJ", "FfRByjlBiuFM3FIo"], "isProtected": false, "name": "1X2PFAAMwzHPxB1U", "removedTags": ["skYs4Yw20DOqOBSC", "2DKHRuPMMWH8Yb33", "T5UBJCjfcnLRfxeC"]}' \
    > test.out 2>&1
eval_tap $? 30 'ImagePatch' test.out

#- 31 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'Sz9WEi8KlloeH0JT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ImageUnmarkForDeletion' test.out

#- 32 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status '1yduat2vQR3biBfs' \
    > test.out 2>&1
eval_tap $? 32 'QoSRegionsGet' test.out

#- 33 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'u4jmsRE2w1yEkLgh' \
    --body '{"status": "3tIYt4SqYUTLDx9g"}' \
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
    --serverID 'IiDandpGT2t24aOM' \
    > test.out 2>&1
eval_tap $? 35 'FleetServerInfo' test.out

#- 36 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'h5eC3IHeHSKLCa3x' \
    > test.out 2>&1
eval_tap $? 36 'FleetServerConnectionInfo' test.out

#- 37 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'reNDUWehwH3q31A8' \
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
    --fleetID '06DJgas4b6z3LNUj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "7fdgLA84Z8YYk6QE", "sessionId": "gJjBbEDoNf3n0hEo"}' \
    > test.out 2>&1
eval_tap $? 40 'FleetClaimByID' test.out

#- 41 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'RCAcf80zfFyabWAg' \
    > test.out 2>&1
eval_tap $? 41 'LocalWatchdogConnect' test.out

#- 42 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["IUXiI07A68eaqC2J", "9jyEW6GLbc0NaKDU", "L3sa13lk1dQBHO86"], "regions": ["IlBhnetU4RwTqUXl", "TDBzOuYsaZA2yyd4", "mbqoOfADMMAXFaY9"], "sessionId": "eKa699bRVhyaKwwr"}' \
    > test.out 2>&1
eval_tap $? 42 'FleetClaimByKeys' test.out

#- 43 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'AP2aMlu7WtjCtoYe' \
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