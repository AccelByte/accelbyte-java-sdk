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
    --body '{"commandLineArguments": "R8dl0zRVW4EZG9m0", "expiresAt": "1996-01-14T00:00:00Z", "imageId": "68su8XfqlqNiTvB6", "name": "SdAdIhUDrwoZ5Mec"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID 'dKi5r6QEa1ysLEzt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID 'h6mXhzkzWkFeZSoE' \
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
    --body '{"active": true, "claimKeys": ["Ht0P7MIIR7CkyF6C", "7duuyZ0GhDogqrhB", "Rd8lDR6qVNPRZYdF"], "dsHostConfiguration": {"instanceId": "LIAjGGJddVCvu9vx", "serversPerVm": 9}, "imageDeploymentProfile": {"commandLine": "KQ7KYnIuMBvaO35l", "imageId": "lzQRaT5kPxUfofvn", "portConfigurations": [{"name": "nSuB0y5WUlrMdI4s", "protocol": "NveabntBSxTeIv53"}, {"name": "HGCiljvjKoyD6SCw", "protocol": "GrncqmLtjQHAf8Tg"}, {"name": "oNm03VLisV6zwPuo", "protocol": "3td6TC6I3lMjGSWN"}], "timeout": {"creation": 23, "drain": 23, "session": 27, "unresponsive": 0}}, "name": "a7qxNeIxPz6MbwL6", "onDemand": false, "regions": [{"bufferSize": 62, "dynamicBuffer": true, "maxServerCount": 52, "minServerCount": 5, "region": "1UaLqYSYWytLPziZ"}, {"bufferSize": 80, "dynamicBuffer": false, "maxServerCount": 7, "minServerCount": 81, "region": "jxcBZufQxGiHPllG"}, {"bufferSize": 59, "dynamicBuffer": false, "maxServerCount": 42, "minServerCount": 62, "region": "E4o5Vwdo3fePqIJA"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 40}, "success": {"collect": true, "percentage": 34}}, "logs": {"crashed": {"collect": false, "percentage": 2}, "success": {"collect": false, "percentage": 41}}}}' \
    > test.out 2>&1
eval_tap $? 18 'FleetCreate' test.out

#- 19 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'RwNmn9HrNQy4uZAA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'FleetGet' test.out

#- 20 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'iE0mit9RGCCHYzUO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["yzzWi9gwQYv7t1o7", "TTr1DmrhZv15T7qu", "IOvBMcaYmvCkGZ5d"], "dsHostConfiguration": {"instanceId": "AgqxpBFmaLoxozr6", "serversPerVm": 45}, "imageDeploymentProfile": {"commandLine": "SyliWMNW5NyLu0M3", "imageId": "VHh2EI8JlDbPWbQ6", "portConfigurations": [{"name": "Q9lNmqRBaAkLnvxk", "protocol": "T1X68cmDc3fxU8My"}, {"name": "KrQpM4hkkK6KKXNB", "protocol": "3Gv0IqmF51TkhjYn"}, {"name": "aq6foWvXa3bMrXsD", "protocol": "r6kILsSSyDdmykmo"}], "timeout": {"creation": 84, "drain": 22, "session": 13, "unresponsive": 4}}, "name": "MXbN9oCMNqq98SjT", "onDemand": true, "regions": [{"bufferSize": 70, "dynamicBuffer": false, "maxServerCount": 49, "minServerCount": 19, "region": "NkSQ70D0H6BXksUC"}, {"bufferSize": 61, "dynamicBuffer": false, "maxServerCount": 52, "minServerCount": 18, "region": "x3poD3Qgb3boLQQ1"}, {"bufferSize": 80, "dynamicBuffer": false, "maxServerCount": 53, "minServerCount": 44, "region": "H7Qm8bwbmXgdAPh1"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 11}, "success": {"collect": false, "percentage": 5}}, "logs": {"crashed": {"collect": false, "percentage": 87}, "success": {"collect": true, "percentage": 64}}}}' \
    > test.out 2>&1
eval_tap $? 20 'FleetUpdate' test.out

#- 21 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'xfgPubTDIHrvqATh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetDelete' test.out

#- 22 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'uwjRHpKKTlmVr9Xu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetArtifactSamplingRulesGet' test.out

#- 23 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'oJbRFQSKVPHbn4Xx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": true, "percentage": 87}, "success": {"collect": true, "percentage": 96}}, "logs": {"crashed": {"collect": false, "percentage": 78}, "success": {"collect": true, "percentage": 88}}}' \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesSet' test.out

#- 24 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'EtrmjqU6YE3p4lSc' \
    --namespace "$AB_NAMESPACE" \
    --count '21' \
    --offset '34' \
    --region '0ZHn5GI39YBHqaTH' \
    --serverId 'eKtW18iGeUlc9d9s' \
    --sortBy 'ogWa24CKNS0GqVvU' \
    --sortDirection 'asc' \
    --status 'creating' \
    > test.out 2>&1
eval_tap $? 24 'FleetServers' test.out

#- 25 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'HQvsHXNUNe4mhgo5' \
    --namespace "$AB_NAMESPACE" \
    --count '87' \
    --offset '91' \
    --reason 'B65lSAiYnNjkfZrQ' \
    --region 'vGgbLdLsFzHkBMr1' \
    --serverId 'yrOMlNFSrUEirnjX' \
    --sortDirection '9fDmIbeZxzfTcyiu' \
    --status 'ATus9hsfpFDcSDG8' \
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
    --imageID 'aMVGLiBNrDjqoxcw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImageGet' test.out

#- 29 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'gGLXpUL4pp2ncYAH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImageMarkForDeletion' test.out

#- 30 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'dNzDmeIP6rOvDz9K' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["Osb392k6YmJFfRBy", "jlBiuFM3FIoVk8T3", "GpAnkCmBUqg2SCnq"], "isProtected": false, "name": "4Yw20DOqOBSC2DKH", "removedTags": ["RuPMMWH8Yb33T5UB", "JCjfcnLRfxeCSz9W", "Ei8KlloeH0JT1ydu"]}' \
    > test.out 2>&1
eval_tap $? 30 'ImagePatch' test.out

#- 31 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'at2vQR3biBfsu4jm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ImageUnmarkForDeletion' test.out

#- 32 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'sRE2w1yEkLgh3tIY' \
    > test.out 2>&1
eval_tap $? 32 'QoSRegionsGet' test.out

#- 33 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 't4SqYUTLDx9gIiDa' \
    --body '{"status": "ndpGT2t24aOMh5eC"}' \
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
    --serverID '3IHeHSKLCa3xreND' \
    > test.out 2>&1
eval_tap $? 35 'FleetServerInfo' test.out

#- 36 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'UWehwH3q31A806DJ' \
    > test.out 2>&1
eval_tap $? 36 'FleetServerConnectionInfo' test.out

#- 37 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'gas4b6z3LNUj7fdg' \
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
    --fleetID 'LA84Z8YYk6QEgJjB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "bEDoNf3n0hEoRCAc", "sessionId": "f80zfFyabWAgIUXi"}' \
    > test.out 2>&1
eval_tap $? 40 'FleetClaimByID' test.out

#- 41 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'I07A68eaqC2J9jyE' \
    > test.out 2>&1
eval_tap $? 41 'LocalWatchdogConnect' test.out

#- 42 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["W6GLbc0NaKDUL3sa", "13lk1dQBHO86IlBh", "netU4RwTqUXlTDBz"], "regions": ["OuYsaZA2yyd4mbqo", "OfADMMAXFaY9eKa6", "99bRVhyaKwwrAP2a"], "sessionId": "Mlu7WtjCtoYetOO8"}' \
    > test.out 2>&1
eval_tap $? 42 'FleetClaimByKeys' test.out

#- 43 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID '47g8OudOfjnCuHZ3' \
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