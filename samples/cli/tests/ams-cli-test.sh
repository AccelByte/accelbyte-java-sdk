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
    --count '96' \
    --desc 'desc' \
    --name 'miTqpyhPFdxLzFQN' \
    --offset '23' \
    --region '5MYzYiKWe5dNRljv' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 17 'FleetList' test.out

#- 18 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["DQQRgat0SevkLGMS", "0lyuI9a2I9u6Vpbs", "x5w8hqUI06UpOXGS"], "dsHostConfiguration": {"instanceId": "LmCVuHOPlLlkvR8s", "serversPerVm": 74}, "imageDeploymentProfile": {"commandLine": "BSxTeIv53HGCiljv", "imageId": "jKoyD6SCwGrncqmL", "portConfigurations": [{"name": "tjQHAf8TgoNm03VL", "protocol": "isV6zwPuo3td6TC6"}, {"name": "I3lMjGSWN2laRlxf", "protocol": "cjHfYakUCTqGkE7w"}, {"name": "cWfDslpJSqGAXQ0y", "protocol": "YoNRKd3IL5TAQ6ii"}], "timeout": {"claim": 86, "creation": 23, "drain": 23, "session": 67, "unresponsive": 91}}, "name": "4cYEzfTD1ZBm3MqH", "onDemand": false, "regions": [{"bufferSize": 70, "dynamicBuffer": false, "maxServerCount": 55, "minServerCount": 76, "region": "8IHtrkmu0hpDDWVA"}, {"bufferSize": 22, "dynamicBuffer": false, "maxServerCount": 49, "minServerCount": 24, "region": "uZAAiE0mit9RGCCH"}, {"bufferSize": 29, "dynamicBuffer": true, "maxServerCount": 34, "minServerCount": 96, "region": "wGyzzWi9gwQYv7t1"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 98}}, "logs": {"crashed": {"collect": false, "percentage": 94}, "success": {"collect": true, "percentage": 72}, "unclaimed": {"collect": true, "percentage": 61}}}}' \
    > test.out 2>&1
eval_tap $? 18 'FleetCreate' test.out

#- 19 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID '4Ymos9Jcdos4fYcT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'FleetGet' test.out

#- 20 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'VU6RBt0zYoMcHyCU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["BFmaLoxozr6wfNPX", "2bOItRMvqtlB2jJC", "SQT279ZZPYGu0rdl"], "dsHostConfiguration": {"instanceId": "gdWyOtXi3choQrpO", "serversPerVm": 38}, "imageDeploymentProfile": {"commandLine": "cmDc3fxU8MyKrQpM", "imageId": "4hkkK6KKXNB3Gv0I", "portConfigurations": [{"name": "qmF51TkhjYnaq6fo", "protocol": "WvXa3bMrXsDr6kIL"}, {"name": "sSSyDdmykmoPYgc2", "protocol": "L4jk4Lo0LSP0pf4I"}, {"name": "xjUkl535X3ateEKD", "protocol": "pADz1x3poD3Qgb3b"}], "timeout": {"claim": 30, "creation": 5, "drain": 77, "session": 88, "unresponsive": 4}}, "name": "Q1MzH7Qm8bwbmXgd", "onDemand": true, "regions": [{"bufferSize": 96, "dynamicBuffer": false, "maxServerCount": 97, "minServerCount": 73, "region": "EThG96gAFKK2WDgC"}, {"bufferSize": 4, "dynamicBuffer": true, "maxServerCount": 69, "minServerCount": 43, "region": "rvqAThuwjRHpKKTl"}, {"bufferSize": 25, "dynamicBuffer": true, "maxServerCount": 98, "minServerCount": 90, "region": "XuoJbRFQSKVPHbn4"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 48}}, "logs": {"crashed": {"collect": true, "percentage": 87}, "success": {"collect": true, "percentage": 96}, "unclaimed": {"collect": false, "percentage": 78}}}}' \
    > test.out 2>&1
eval_tap $? 20 'FleetUpdate' test.out

#- 21 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'AEtrmjqU6YE3p4lS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetDelete' test.out

#- 22 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'ck0ZHn5GI39YBHqa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetArtifactSamplingRulesGet' test.out

#- 23 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'THeKtW18iGeUlc9d' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": false, "percentage": 39}}, "logs": {"crashed": {"collect": true, "percentage": 30}, "success": {"collect": true, "percentage": 13}, "unclaimed": {"collect": false, "percentage": 46}}}' \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesSet' test.out

#- 24 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID '24CKNS0GqVvUfHQv' \
    --namespace "$AB_NAMESPACE" \
    --count '38' \
    --offset '68' \
    --region 'JJ42d3PBddN8S48l' \
    --serverId '9lyNApflxqMrj3oZ' \
    --sortBy 'k03QXcKMDYDDxHSZ' \
    --sortDirection 'asc' \
    --status 'claiming' \
    > test.out 2>&1
eval_tap $? 24 'FleetServers' test.out

#- 25 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'tqXyJ58f7Gc26Sai' \
    --namespace "$AB_NAMESPACE" \
    --count '67' \
    --offset '3' \
    --reason 'VkydwYWQG26yUZNm' \
    --region 'TBcvrbYCwZtxFHyP' \
    --serverId 'LtI8ilbyDPUIj88c' \
    --sortDirection 'ekdqCt81P1ktfIov' \
    --status 'mv9gsR5cJcHm3SZL' \
    > test.out 2>&1
eval_tap $? 25 'FleetServerHistory' test.out

#- 26 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '49' \
    --inUse 'k6YmJFfRByjlBiuF' \
    --isProtected  \
    --name 'M3FIoVk8T3GpAnkC' \
    --offset '26' \
    --sortBy 'HPxB1UskYs4Yw20D' \
    --sortDirection 'OqOBSC2DKHRuPMMW' \
    --status 'H8Yb33T5UBJCjfcn' \
    --tag 'LRfxeCSz9WEi8Kll' \
    > test.out 2>&1
eval_tap $? 26 'ImageList' test.out

#- 27 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'ImagesStorage' test.out

#- 28 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'oeH0JT1yduat2vQR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImageGet' test.out

#- 29 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID '3biBfsu4jmsRE2w1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImageMarkForDeletion' test.out

#- 30 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'yEkLgh3tIYt4SqYU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["TLDx9gIiDandpGT2", "t24aOMh5eC3IHeHS", "KLCa3xreNDUWehwH"], "isProtected": true, "name": "LRc6m8heKnWhzfe2", "removedTags": ["NubeoKFeIaFQCYoD", "PICpnduEEQlULdJz", "4mnRBkMNxvvKgAT8"]}' \
    > test.out 2>&1
eval_tap $? 30 'ImagePatch' test.out

#- 31 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'mJrYq6hRkloqxM3g' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ImageUnmarkForDeletion' test.out

#- 32 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'pwxcfMy9XzjjI5Yb' \
    > test.out 2>&1
eval_tap $? 32 'QoSRegionsGet' test.out

#- 33 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'sKoADkzJEN2VHzih' \
    --body '{"status": "3bit0VWn3CO39PXD"}' \
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
    --serverID 'NxtXgeO3FgkXhjDz' \
    > test.out 2>&1
eval_tap $? 35 'FleetServerInfo' test.out

#- 36 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'aQY3snn2ZkP7cFdP' \
    > test.out 2>&1
eval_tap $? 36 'FleetServerConnectionInfo' test.out

#- 37 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID '43e5dC9XIBudfZgr' \
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
    --fleetID 'bHDIDm4hMzF4Txod' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "enSrUTvfqU0bfoMm", "sessionId": "5cTtFWbotQyXJRcQ"}' \
    > test.out 2>&1
eval_tap $? 40 'FleetClaimByID' test.out

#- 41 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'WsmqPNs92epxk0i8' \
    > test.out 2>&1
eval_tap $? 41 'LocalWatchdogConnect' test.out

#- 42 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["VxsZNereSvf9699m", "CEHThUJkETAsSp7g", "h4TeUTkOkAYfJB8A"], "regions": ["T9t4Tv207Y2QD3oD", "5fLCr3OOlXVv8ZGF", "7uYnGzpipNDigNJm"], "sessionId": "a1MbqqZtfNWql4nm"}' \
    > test.out 2>&1
eval_tap $? 42 'FleetClaimByKeys' test.out

#- 43 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'wAft4gqkNNlWkD9e' \
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