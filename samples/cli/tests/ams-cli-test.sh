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
echo "1..47"

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

#- 17 DevelopmentServerConfigurationPatch
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationPatch \
    --developmentServerConfigID 'UmiTqpyhPFdxLzFQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "N05MYzYiKWe5dNRl", "expiresAt": "1975-08-05T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 17 'DevelopmentServerConfigurationPatch' test.out

#- 18 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    --active  \
    --count '45' \
    --name 'jGGJddVCvu9vx5KQ' \
    --offset '76' \
    --region 'KYnIuMBvaO35llzQ' \
    --sortBy 'active' \
    --sortDirection 'asc' \
    > test.out 2>&1
eval_tap $? 18 'FleetList' test.out

#- 19 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["T5kPxUfofvnnSuB0", "y5WUlrMdI4sNveab", "ntBSxTeIv53HGCil"], "dsHostConfiguration": {"instanceId": "jvjKoyD6SCwGrncq", "serversPerVm": 25}, "fallbackFleet": "QsfCaTmt1d67FXGk", "imageDeploymentProfile": {"commandLine": "2s9Q0mPVo3twu0Me", "imageId": "sTCf9x4rt69lna7q", "portConfigurations": [{"name": "xNeIxPz6MbwL6IY6", "protocol": "9z1UaLqYSYWytLPz"}, {"name": "iZMdjxcBZufQxGiH", "protocol": "PllG4cYEzfTD1ZBm"}, {"name": "3MqHcUmLZZbSqb8R", "protocol": "wNmn9HrNQy4uZAAi"}], "timeout": {"claim": 63, "creation": 70, "drain": 42, "session": 25, "unresponsive": 91}}, "name": "it9RGCCHYzUOcEds", "onDemand": false, "regions": [{"bufferSize": 17, "dynamicBuffer": false, "maxServerCount": 86, "minServerCount": 45, "region": "EqgA8yu7Vk6Jt4Ym"}, {"bufferSize": 30, "dynamicBuffer": true, "maxServerCount": 44, "minServerCount": 74, "region": "5T7quIOvBMcaYmvC"}, {"bufferSize": 22, "dynamicBuffer": true, "maxServerCount": 67, "minServerCount": 29, "region": "5dAgqxpBFmaLoxoz"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 24}}, "logs": {"crashed": {"collect": true, "percentage": 45}, "success": {"collect": false, "percentage": 50}, "unclaimed": {"collect": false, "percentage": 85}}}}' \
    > test.out 2>&1
eval_tap $? 19 'FleetCreate' test.out

#- 20 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'iWMNW5NyLu0M3VHh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'FleetGet' test.out

#- 21 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID '2EI8JlDbPWbQ6Q9l' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["mqRBaAkLnvxkT1X6", "8cmDc3fxU8MyKrQp", "M4hkkK6KKXNB3Gv0"], "dsHostConfiguration": {"instanceId": "IqmF51TkhjYnaq6f", "serversPerVm": 30}, "fallbackFleet": "asWIPUvmEejtGeoy", "imageDeploymentProfile": {"commandLine": "IPa8ZRrvjj7il35M", "imageId": "XbN9oCMNqq98SjTv", "portConfigurations": [{"name": "hZNkSQ70D0H6BXks", "protocol": "UC9b6i5lZC9xv32e"}, {"name": "8c5csSovoqsZNBdt", "protocol": "e9NDUPVJf6c2Z0QZ"}, {"name": "xfgPubTDIHrvqATh", "protocol": "uwjRHpKKTlmVr9Xu"}], "timeout": {"claim": 30, "creation": 32, "drain": 74, "session": 11, "unresponsive": 4}}, "name": "3vneSD2Tb3g7mSQU", "onDemand": false, "regions": [{"bufferSize": 78, "dynamicBuffer": true, "maxServerCount": 88, "minServerCount": 62, "region": "RENjEEztx1WsYSiZ"}, {"bufferSize": 34, "dynamicBuffer": false, "maxServerCount": 27, "minServerCount": 69, "region": "0nSBJroav91GXlvP"}, {"bufferSize": 67, "dynamicBuffer": false, "maxServerCount": 64, "minServerCount": 18, "region": "YReVHQipcCx9Zw5D"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 70}}, "logs": {"crashed": {"collect": true, "percentage": 15}, "success": {"collect": true, "percentage": 67}, "unclaimed": {"collect": false, "percentage": 50}}}}' \
    > test.out 2>&1
eval_tap $? 21 'FleetUpdate' test.out

#- 22 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'HQvsHXNUNe4mhgo5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetDelete' test.out

#- 23 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'QB65lSAiYnNjkfZr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesGet' test.out

#- 24 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'QvGgbLdLsFzHkBMr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": true, "percentage": 50}}, "logs": {"crashed": {"collect": true, "percentage": 92}, "success": {"collect": false, "percentage": 23}, "unclaimed": {"collect": true, "percentage": 81}}}' \
    > test.out 2>&1
eval_tap $? 24 'FleetArtifactSamplingRulesSet' test.out

#- 25 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'qXyJ58f7Gc26SaiG' \
    --namespace "$AB_NAMESPACE" \
    --count '98' \
    --offset '10' \
    --region 'kydwYWQG26yUZNmT' \
    --serverId 'BcvrbYCwZtxFHyPL' \
    --sortBy 'tI8ilbyDPUIj88ce' \
    --sortDirection 'asc' \
    --status 'claimed' \
    > test.out 2>&1
eval_tap $? 25 'FleetServers' test.out

#- 26 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'pp2ncYAHdNzDmeIP' \
    --namespace "$AB_NAMESPACE" \
    --count '13' \
    --offset '35' \
    --reason 'sR5cJcHm3SZLxoRD' \
    --region 'FuuuySj29a9LJE8H' \
    --serverId 'oRS1X2PFAAMwzHPx' \
    --sortDirection 'B1UskYs4Yw20DOqO' \
    --status 'BSC2DKHRuPMMWH8Y' \
    > test.out 2>&1
eval_tap $? 26 'FleetServerHistory' test.out

#- 27 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '4' \
    --inUse 'qRRbceJ5i0EeDxOg' \
    --isProtected  \
    --name 'BnhhqElIaDml48wd' \
    --offset '81' \
    --sortBy 'JT1yduat2vQR3biB' \
    --sortDirection 'fsu4jmsRE2w1yEkL' \
    --status 'gh3tIYt4SqYUTLDx' \
    --tag '9gIiDandpGT2t24a' \
    > test.out 2>&1
eval_tap $? 27 'ImageList' test.out

#- 28 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImagesStorage' test.out

#- 29 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'OMh5eC3IHeHSKLCa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImageGet' test.out

#- 30 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID '3xreNDUWehwH3q31' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'ImageMarkForDeletion' test.out

#- 31 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'A806DJgas4b6z3LN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["Uj7fdgLA84Z8YYk6", "QEgJjBbEDoNf3n0h", "EoRCAcf80zfFyabW"], "isProtected": true, "name": "Yq6hRkloqxM3gpwx", "removedTags": ["cfMy9XzjjI5YbsKo", "ADkzJEN2VHzih3bi", "t0VWn3CO39PXDNxt"]}' \
    > test.out 2>&1
eval_tap $? 31 'ImagePatch' test.out

#- 32 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'XgeO3FgkXhjDzaQY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'ImageUnmarkForDeletion' test.out

#- 33 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status '3snn2ZkP7cFdP43e' \
    > test.out 2>&1
eval_tap $? 33 'QoSRegionsGet' test.out

#- 34 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region '5dC9XIBudfZgrbHD' \
    --body '{"status": "IDm4hMzF4TxodenS"}' \
    > test.out 2>&1
eval_tap $? 34 'QoSRegionsUpdate' test.out

#- 35 InfoRegions
./ng net.accelbyte.sdk.cli.Main ams infoRegions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'InfoRegions' test.out

#- 36 FleetServerInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'rUTvfqU0bfoMm5cT' \
    > test.out 2>&1
eval_tap $? 36 'FleetServerInfo' test.out

#- 37 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'tFWbotQyXJRcQWsm' \
    > test.out 2>&1
eval_tap $? 37 'FleetServerConnectionInfo' test.out

#- 38 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'qPNs92epxk0i8Vxs' \
    > test.out 2>&1
eval_tap $? 38 'ServerHistory' test.out

#- 39 InfoSupportedInstances
./ng net.accelbyte.sdk.cli.Main ams infoSupportedInstances \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'InfoSupportedInstances' test.out

#- 40 AccountGet
./ng net.accelbyte.sdk.cli.Main ams accountGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'AccountGet' test.out

#- 41 FleetClaimByID
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByID \
    --fleetID 'ZNereSvf9699mCEH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "ThUJkETAsSp7gh4T", "sessionId": "eUTkOkAYfJB8AT9t"}' \
    > test.out 2>&1
eval_tap $? 41 'FleetClaimByID' test.out

#- 42 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID '4Tv207Y2QD3oD5fL' \
    > test.out 2>&1
eval_tap $? 42 'LocalWatchdogConnect' test.out

#- 43 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["Cr3OOlXVv8ZGF7uY", "nGzpipNDigNJma1M", "bqqZtfNWql4nmwAf"], "regions": ["t4gqkNNlWkD9eOzi", "YRFOn0jJLHC9Lxhv", "NXTwGBCtohLtl9Zu"], "sessionId": "hytm5UDrT6QXCs5S"}' \
    > test.out 2>&1
eval_tap $? 43 'FleetClaimByKeys' test.out

#- 44 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'PBbRPZTF6oQAXVG7' \
    > test.out 2>&1
eval_tap $? 44 'WatchdogConnect' test.out

#- 45 UploadURLGet
./ng net.accelbyte.sdk.cli.Main ams uploadURLGet \
    > test.out 2>&1
eval_tap $? 45 'UploadURLGet' test.out

#- 46 Func1
./ng net.accelbyte.sdk.cli.Main ams func1 \
    > test.out 2>&1
eval_tap $? 46 'Func1' test.out

#- 47 BasicHealthCheck
./ng net.accelbyte.sdk.cli.Main ams basicHealthCheck \
    > test.out 2>&1
eval_tap $? 47 'BasicHealthCheck' test.out


rm -f "tmp.dat"

exit $EXIT_CODE