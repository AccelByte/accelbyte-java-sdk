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
    --name 'uuyZ0GhDogqrhBRd' \
    --offset '23' \
    --region '5MYzYiKWe5dNRljv' \
    --sortBy 'name' \
    --sortDirection 'asc' \
    > test.out 2>&1
eval_tap $? 17 'FleetList' test.out

#- 18 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["dVCvu9vx5KQ7KYnI", "uMBvaO35llzQRaT5", "kPxUfofvnnSuB0y5"], "dsHostConfiguration": {"instanceId": "WUlrMdI4sNveabnt", "serversPerVm": 57}, "fallbackFleet": "gnuRkgghGoYupD39", "imageDeploymentProfile": {"commandLine": "1C2qtPYokahFjkQs", "imageId": "fCaTmt1d67FXGk2s", "portConfigurations": [{"name": "9Q0mPVo3twu0MesT", "protocol": "Cf9x4rt69lna7qxN"}, {"name": "eIxPz6MbwL6IY69z", "protocol": "1UaLqYSYWytLPziZ"}, {"name": "MdjxcBZufQxGiHPl", "protocol": "lG4cYEzfTD1ZBm3M"}], "timeout": {"claim": 33, "creation": 84, "drain": 68, "session": 33, "unresponsive": 4}}, "name": "IJA8IHtrkmu0hpDD", "onDemand": true, "regions": [{"bufferSize": 54, "dynamicBuffer": false, "maxServerCount": 88, "minServerCount": 1, "region": "y4uZAAiE0mit9RGC"}, {"bufferSize": 57, "dynamicBuffer": false, "maxServerCount": 69, "minServerCount": 37, "region": "YzUOcEdscKHPEqgA"}, {"bufferSize": 39, "dynamicBuffer": true, "maxServerCount": 42, "minServerCount": 30, "region": "7Vk6Jt4Ymos9Jcdo"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 42}}, "logs": {"crashed": {"collect": false, "percentage": 83}, "success": {"collect": true, "percentage": 5}, "unclaimed": {"collect": true, "percentage": 94}}}}' \
    > test.out 2>&1
eval_tap $? 18 'FleetCreate' test.out

#- 19 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'McaYmvCkGZ5dAgqx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'FleetGet' test.out

#- 20 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'pBFmaLoxozr6wfNP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["NW5NyLu0M3VHh2EI", "8JlDbPWbQ6Q9lNmq", "RBaAkLnvxkT1X68c"], "dsHostConfiguration": {"instanceId": "mDc3fxU8MyKrQpM4", "serversPerVm": 16}, "fallbackFleet": "Dlym6puQ23xoJ8ae", "imageDeploymentProfile": {"commandLine": "CnaLpUKp44YUDjas", "imageId": "WIPUvmEejtGeoyIP", "portConfigurations": [{"name": "a8ZRrvjj7il35MXb", "protocol": "N9oCMNqq98SjTvhZ"}, {"name": "NkSQ70D0H6BXksUC", "protocol": "9b6i5lZC9xv32e8c"}, {"name": "5csSovoqsZNBdte9", "protocol": "NDUPVJf6c2Z0QZxf"}], "timeout": {"claim": 12, "creation": 86, "drain": 100, "session": 41, "unresponsive": 60}}, "name": "bTDIHrvqAThuwjRH", "onDemand": true, "regions": [{"bufferSize": 28, "dynamicBuffer": true, "maxServerCount": 74, "minServerCount": 9, "region": "TlmVr9XuoJbRFQSK"}, {"bufferSize": 98, "dynamicBuffer": false, "maxServerCount": 3, "minServerCount": 27, "region": "g7mSQUhAEtrmjqU6"}, {"bufferSize": 47, "dynamicBuffer": true, "maxServerCount": 99, "minServerCount": 31, "region": "sYSiZqan0nSBJroa"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 69}}, "logs": {"crashed": {"collect": true, "percentage": 1}, "success": {"collect": false, "percentage": 8}, "unclaimed": {"collect": true, "percentage": 75}}}}' \
    > test.out 2>&1
eval_tap $? 20 'FleetUpdate' test.out

#- 21 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'PG6bFYReVHQipcCx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetDelete' test.out

#- 22 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID '9Zw5D2L7vIYhGGSy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetArtifactSamplingRulesGet' test.out

#- 23 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'EW4ZJJ42d3PBddN8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": true, "percentage": 23}}, "logs": {"crashed": {"collect": false, "percentage": 92}, "success": {"collect": false, "percentage": 55}, "unclaimed": {"collect": true, "percentage": 17}}}' \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesSet' test.out

#- 24 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'NApflxqMrj3oZk03' \
    --namespace "$AB_NAMESPACE" \
    --count '88' \
    --offset '39' \
    --region 'XcKMDYDDxHSZjtqX' \
    --serverId 'yJ58f7Gc26SaiGVk' \
    --sortBy 'ydwYWQG26yUZNmTB' \
    --sortDirection 'asc' \
    --status 'claiming' \
    > test.out 2>&1
eval_tap $? 24 'FleetServers' test.out

#- 25 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'vrbYCwZtxFHyPLtI' \
    --namespace "$AB_NAMESPACE" \
    --count '61' \
    --offset '17' \
    --reason 'jqoxcwgGLXpUL4pp' \
    --region '2ncYAHdNzDmeIP6r' \
    --serverId 'OvDz9KOsb392k6Ym' \
    --sortDirection 'JFfRByjlBiuFM3FI' \
    --status 'oVk8T3GpAnkCmBUq' \
    > test.out 2>&1
eval_tap $? 25 'FleetServerHistory' test.out

#- 26 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '12' \
    --inUse '1UskYs4Yw20DOqOB' \
    --isProtected  \
    --name 'SC2DKHRuPMMWH8Yb' \
    --offset '90' \
    --sortBy '3T5UBJCjfcnLRfxe' \
    --sortDirection 'CSz9WEi8KlloeH0J' \
    --status 'T1yduat2vQR3biBf' \
    --tag 'su4jmsRE2w1yEkLg' \
    > test.out 2>&1
eval_tap $? 26 'ImageList' test.out

#- 27 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'ImagesStorage' test.out

#- 28 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'h3tIYt4SqYUTLDx9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImageGet' test.out

#- 29 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'gIiDandpGT2t24aO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImageMarkForDeletion' test.out

#- 30 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'Mh5eC3IHeHSKLCa3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["xreNDUWehwH3q31A", "806DJgas4b6z3LNU", "j7fdgLA84Z8YYk6Q"], "isProtected": true, "name": "nduEEQlULdJz4mnR", "removedTags": ["BkMNxvvKgAT8mJrY", "q6hRkloqxM3gpwxc", "fMy9XzjjI5YbsKoA"]}' \
    > test.out 2>&1
eval_tap $? 30 'ImagePatch' test.out

#- 31 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'DkzJEN2VHzih3bit' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ImageUnmarkForDeletion' test.out

#- 32 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status '0VWn3CO39PXDNxtX' \
    > test.out 2>&1
eval_tap $? 32 'QoSRegionsGet' test.out

#- 33 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'geO3FgkXhjDzaQY3' \
    --body '{"status": "snn2ZkP7cFdP43e5"}' \
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
    --serverID 'dC9XIBudfZgrbHDI' \
    > test.out 2>&1
eval_tap $? 35 'FleetServerInfo' test.out

#- 36 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'Dm4hMzF4TxodenSr' \
    > test.out 2>&1
eval_tap $? 36 'FleetServerConnectionInfo' test.out

#- 37 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'UTvfqU0bfoMm5cTt' \
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
    --fleetID 'FWbotQyXJRcQWsmq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "PNs92epxk0i8VxsZ", "sessionId": "NereSvf9699mCEHT"}' \
    > test.out 2>&1
eval_tap $? 40 'FleetClaimByID' test.out

#- 41 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'hUJkETAsSp7gh4Te' \
    > test.out 2>&1
eval_tap $? 41 'LocalWatchdogConnect' test.out

#- 42 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["UTkOkAYfJB8AT9t4", "Tv207Y2QD3oD5fLC", "r3OOlXVv8ZGF7uYn"], "regions": ["GzpipNDigNJma1Mb", "qqZtfNWql4nmwAft", "4gqkNNlWkD9eOziY"], "sessionId": "RFOn0jJLHC9LxhvN"}' \
    > test.out 2>&1
eval_tap $? 42 'FleetClaimByKeys' test.out

#- 43 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'XTwGBCtohLtl9Zuh' \
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