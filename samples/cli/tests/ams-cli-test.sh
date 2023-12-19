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
echo "1..35"

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

#- 4 AccountGet
./ng net.accelbyte.sdk.cli.Main ams accountGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AccountGet' test.out

#- 5 AccountCreate
./ng net.accelbyte.sdk.cli.Main ams accountCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "EAxcVpFrttufHIRd"}' \
    > test.out 2>&1
eval_tap $? 5 'AccountCreate' test.out

#- 6 AccountLinkTokenGet
./ng net.accelbyte.sdk.cli.Main ams accountLinkTokenGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AccountLinkTokenGet' test.out

#- 7 AccountLink
./ng net.accelbyte.sdk.cli.Main ams accountLink \
    --namespace "$AB_NAMESPACE" \
    --body '{"token": "H9UzVRiXbqlAw7r6"}' \
    > test.out 2>&1
eval_tap $? 7 'AccountLink' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'W2ktQG0h5JAav5kR' \
    --endDate 'a62WopBJHPtcDs8b' \
    --fleetID 'BZLCXLx8bbgorQeF' \
    --imageID 'bQ1g7qbPngUNB1vR' \
    --maxSize '29' \
    --minSize '47' \
    --region 'dwpzS6DaDpv8N7ZQ' \
    --startDate 'VqGj6oDLjWjkY1aX' \
    --status 'lFcDtgOjchIua5tW' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'ArtifactUsageGet' test.out

#- 10 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID 'EIC32ogW7olvbTgr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactDelete' test.out

#- 11 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'hRTcPiSuL0Sly6XM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactGetURL' test.out

#- 12 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'FleetList' test.out

#- 13 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["OI18mAQLnzjMf8GZ", "2WBZqxYG3aREAu2D", "6QVKNCWP75TB0i7p"], "dsHostConfiguration": {"instanceId": "KxR8dl0zRVW4EZG9", "instanceType": "m0XcgGVbMqSszE8G", "serversPerVm": 68}, "imageDeploymentProfile": {"commandLine": "vB6SdAdIhUDrwoZ5", "imageId": "MecdKi5r6QEa1ysL", "portConfigurations": [{"name": "Ezth6mXhzkzWkFeZ", "protocol": "SoEAcBdW19m4eu6d"}, {"name": "5tA5jUmiTqpyhPFd", "protocol": "xLzFQN05MYzYiKWe"}, {"name": "5dNRljv7IPrDQQRg", "protocol": "at0SevkLGMS0lyuI"}], "timeout": {"creation": 84, "drain": 0, "session": 71, "unresponsive": 23}}, "name": "9u6Vpbsx5w8hqUI0", "regions": [{"bufferSize": 28, "maxServerCount": 96, "minServerCount": 92, "region": "pOXGSLmCVuHOPlLl"}, {"bufferSize": 20, "maxServerCount": 10, "minServerCount": 45, "region": "abntBSxTeIv53HGC"}, {"bufferSize": 17, "maxServerCount": 31, "minServerCount": 23, "region": "D391C2qtPYokahFj"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 25}, "success": {"collect": true, "percentage": 39}}, "logs": {"crashed": {"collect": false, "percentage": 19}, "success": {"collect": true, "percentage": 88}}}}' \
    > test.out 2>&1
eval_tap $? 13 'FleetCreate' test.out

#- 14 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'aTmt1d67FXGk2s9Q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'FleetGet' test.out

#- 15 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID '0mPVo3twu0MesTCf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["jGSWN2laRlxfcjHf", "YakUCTqGkE7wcWfD", "slpJSqGAXQ0yYoNR"], "dsHostConfiguration": {"instanceId": "Kd3IL5TAQ6iiPlSC", "instanceType": "2uE4o5Vwdo3fePqI", "serversPerVm": 73}, "imageDeploymentProfile": {"commandLine": "mLZZbSqb8RwNmn9H", "imageId": "rNQy4uZAAiE0mit9", "portConfigurations": [{"name": "RGCCHYzUOcEdscKH", "protocol": "PEqgA8yu7Vk6Jt4Y"}, {"name": "mos9Jcdos4fYcTVU", "protocol": "6RBt0zYoMcHyCUEX"}, {"name": "lAvxJMdalwSyliWM", "protocol": "NW5NyLu0M3VHh2EI"}], "timeout": {"creation": 94, "drain": 72, "session": 22, "unresponsive": 60}}, "name": "9ZZPYGu0rdlgdWyO", "regions": [{"bufferSize": 39, "maxServerCount": 20, "minServerCount": 76, "region": "i3choQrpOsDBU5Se"}, {"bufferSize": 31, "maxServerCount": 96, "minServerCount": 19, "region": "8MyKrQpM4hkkK6KK"}, {"bufferSize": 86, "maxServerCount": 81, "minServerCount": 57, "region": "3xoJ8aeCnaLpUKp4"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 34}, "success": {"collect": true, "percentage": 11}}, "logs": {"crashed": {"collect": false, "percentage": 30}, "success": {"collect": false, "percentage": 99}}}}' \
    > test.out 2>&1
eval_tap $? 15 'FleetUpdate' test.out

#- 16 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'sWIPUvmEejtGeoyI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'FleetDelete' test.out

#- 17 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'Pa8ZRrvjj7il35MX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'FleetArtifactSamplingRulesGet' test.out

#- 18 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'bN9oCMNqq98SjTvh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": false, "percentage": 81}, "success": {"collect": false, "percentage": 20}}, "logs": {"crashed": {"collect": false, "percentage": 88}, "success": {"collect": true, "percentage": 69}}}' \
    > test.out 2>&1
eval_tap $? 18 'FleetArtifactSamplingRulesSet' test.out

#- 19 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'ateEKDpADz1x3poD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'FleetServers' test.out

#- 20 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID '3Qgb3boLQQ1MzH7Q' \
    --namespace "$AB_NAMESPACE" \
    --count '26' \
    --offset '82' \
    --reason 'bwbmXgdAPh1EThG9' \
    --region '6gAFKK2WDgCcxvON' \
    --serverId 'Zm3EeERmDnyeFoF7' \
    --sortDirection 'VSZ6pf3vneSD2Tb3' \
    --status 'g7mSQUhAEtrmjqU6' \
    > test.out 2>&1
eval_tap $? 20 'FleetServerHistory' test.out

#- 21 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'ImageList' test.out

#- 22 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'YE3p4lSck0ZHn5GI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'ImageGet' test.out

#- 23 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID '39YBHqaTHeKtW18i' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["GeUlc9d9sogWa24C", "KNS0GqVvUfHQvsHX", "NUNe4mhgo5QB65lS"], "isProtected": true, "name": "yNApflxqMrj3oZk0", "removedTags": ["3QXcKMDYDDxHSZjt", "qXyJ58f7Gc26SaiG", "VkydwYWQG26yUZNm"]}' \
    > test.out 2>&1
eval_tap $? 23 'ImagePatch' test.out

#- 24 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'TBcvrbYCwZtxFHyP' \
    > test.out 2>&1
eval_tap $? 24 'QoSRegionsGet' test.out

#- 25 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'LtI8ilbyDPUIj88c' \
    --body '{"status": "ekdqCt81P1ktfIov"}' \
    > test.out 2>&1
eval_tap $? 25 'QoSRegionsUpdate' test.out

#- 26 InfoRegions
./ng net.accelbyte.sdk.cli.Main ams infoRegions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'InfoRegions' test.out

#- 27 FleetServerInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'mv9gsR5cJcHm3SZL' \
    > test.out 2>&1
eval_tap $? 27 'FleetServerInfo' test.out

#- 28 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'xoRDFuuuySj29a9L' \
    > test.out 2>&1
eval_tap $? 28 'ServerHistory' test.out

#- 29 InfoSupportedInstances
./ng net.accelbyte.sdk.cli.Main ams infoSupportedInstances \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'InfoSupportedInstances' test.out

#- 30 FleetClaimByID
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByID \
    --fleetID 'JE8HoRS1X2PFAAMw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "zHPxB1UskYs4Yw20"}' \
    > test.out 2>&1
eval_tap $? 30 'FleetClaimByID' test.out

#- 31 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'DOqOBSC2DKHRuPMM' \
    > test.out 2>&1
eval_tap $? 31 'LocalWatchdogConnect' test.out

#- 32 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["WH8Yb33T5UBJCjfc", "nLRfxeCSz9WEi8Kl", "loeH0JT1yduat2vQ"], "regions": ["R3biBfsu4jmsRE2w", "1yEkLgh3tIYt4SqY", "UTLDx9gIiDandpGT"]}' \
    > test.out 2>&1
eval_tap $? 32 'FleetClaimByKeys' test.out

#- 33 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID '2t24aOMh5eC3IHeH' \
    > test.out 2>&1
eval_tap $? 33 'WatchdogConnect' test.out

#- 34 Func1
./ng net.accelbyte.sdk.cli.Main ams func1 \
    > test.out 2>&1
eval_tap $? 34 'Func1' test.out

#- 35 BasicHealthCheck
./ng net.accelbyte.sdk.cli.Main ams basicHealthCheck \
    > test.out 2>&1
eval_tap $? 35 'BasicHealthCheck' test.out


rm -f "tmp.dat"

exit $EXIT_CODE