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
    --body '{"active": false, "claimKeys": ["T5kPxUfofvnnSuB0", "y5WUlrMdI4sNveab", "ntBSxTeIv53HGCil"], "dsHostConfiguration": {"instanceId": "jvjKoyD6SCwGrncq", "serversPerVm": 25}, "fallbackFleet": "QsfCaTmt1d67FXGk", "hibernateAfterPeriod": "2s9Q0mPVo3twu0Me", "imageDeploymentProfile": {"commandLine": "sTCf9x4rt69lna7q", "imageId": "xNeIxPz6MbwL6IY6", "portConfigurations": [{"name": "9z1UaLqYSYWytLPz", "protocol": "iZMdjxcBZufQxGiH"}, {"name": "PllG4cYEzfTD1ZBm", "protocol": "3MqHcUmLZZbSqb8R"}, {"name": "wNmn9HrNQy4uZAAi", "protocol": "E0mit9RGCCHYzUOc"}], "timeout": {"claim": 62, "creation": 52, "drain": 6, "session": 52, "unresponsive": 38}}, "name": "Wi9gwQYv7t1o7TTr", "onDemand": true, "regions": [{"bufferSize": 61, "dynamicBuffer": false, "maxServerCount": 36, "minServerCount": 25, "region": "hZv15T7quIOvBMca"}, {"bufferSize": 90, "dynamicBuffer": false, "maxServerCount": 56, "minServerCount": 44, "region": "t0zYoMcHyCUEXlAv"}, {"bufferSize": 48, "dynamicBuffer": false, "maxServerCount": 73, "minServerCount": 49, "region": "MdalwSyliWMNW5Ny"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 41}}, "logs": {"crashed": {"collect": true, "percentage": 39}, "success": {"collect": false, "percentage": 56}, "unclaimed": {"collect": false, "percentage": 16}}}}' \
    > test.out 2>&1
eval_tap $? 19 'FleetCreate' test.out

#- 20 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'JCSQT279ZZPYGu0r' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'FleetGet' test.out

#- 21 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'dlgdWyOtXi3choQr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["68cmDc3fxU8MyKrQ", "pM4hkkK6KKXNB3Gv", "0IqmF51TkhjYnaq6"], "dsHostConfiguration": {"instanceId": "foWvXa3bMrXsDr6k", "serversPerVm": 71}, "fallbackFleet": "yIPa8ZRrvjj7il35", "hibernateAfterPeriod": "MXbN9oCMNqq98SjT", "imageDeploymentProfile": {"commandLine": "vhZNkSQ70D0H6BXk", "imageId": "sUC9b6i5lZC9xv32", "portConfigurations": [{"name": "e8c5csSovoqsZNBd", "protocol": "te9NDUPVJf6c2Z0Q"}, {"name": "ZxfgPubTDIHrvqAT", "protocol": "huwjRHpKKTlmVr9X"}, {"name": "uoJbRFQSKVPHbn4X", "protocol": "xtu7LQRENjEEztx1"}], "timeout": {"claim": 99, "creation": 31, "drain": 38, "session": 23, "unresponsive": 91}}, "name": "Sck0ZHn5GI39YBHq", "onDemand": false, "regions": [{"bufferSize": 66, "dynamicBuffer": false, "maxServerCount": 8, "minServerCount": 44, "region": "KtW18iGeUlc9d9so"}, {"bufferSize": 13, "dynamicBuffer": false, "maxServerCount": 46, "minServerCount": 61, "region": "CKNS0GqVvUfHQvsH"}, {"bufferSize": 74, "dynamicBuffer": false, "maxServerCount": 8, "minServerCount": 85, "region": "mhgo5QB65lSAiYnN"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 23}}, "logs": {"crashed": {"collect": false, "percentage": 47}, "success": {"collect": false, "percentage": 33}, "unclaimed": {"collect": true, "percentage": 35}}}}' \
    > test.out 2>&1
eval_tap $? 21 'FleetUpdate' test.out

#- 22 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'QvGgbLdLsFzHkBMr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetDelete' test.out

#- 23 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID '1yrOMlNFSrUEirnj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesGet' test.out

#- 24 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'X9fDmIbeZxzfTcyi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": true, "percentage": 54}}, "logs": {"crashed": {"collect": true, "percentage": 94}, "success": {"collect": true, "percentage": 39}, "unclaimed": {"collect": false, "percentage": 14}}}' \
    > test.out 2>&1
eval_tap $? 24 'FleetArtifactSamplingRulesSet' test.out

#- 25 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'TBcvrbYCwZtxFHyP' \
    --namespace "$AB_NAMESPACE" \
    --count '77' \
    --offset '57' \
    --region 'tI8ilbyDPUIj88ce' \
    --serverId 'kdqCt81P1ktfIovm' \
    --sortBy 'v9gsR5cJcHm3SZLx' \
    --sortDirection 'asc' \
    --status 'ready' \
    > test.out 2>&1
eval_tap $? 25 'FleetServers' test.out

#- 26 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'YmJFfRByjlBiuFM3' \
    --namespace "$AB_NAMESPACE" \
    --count '65' \
    --offset '70' \
    --reason 'IoVk8T3GpAnkCmBU' \
    --region 'qg2SCnqntX9y1aZS' \
    --serverId 'WMiVi10sG6vxkfUc' \
    --sortDirection 'mqRRbceJ5i0EeDxO' \
    --status 'gBnhhqElIaDml48w' \
    > test.out 2>&1
eval_tap $? 26 'FleetServerHistory' test.out

#- 27 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '7' \
    --inUse '0JT1yduat2vQR3bi' \
    --isProtected  \
    --name 'Bfsu4jmsRE2w1yEk' \
    --offset '78' \
    --sortBy 'k4mqrxzTtuLl4Xlb' \
    --sortDirection 'GL8QOxtjzm8y2wNh' \
    --status 'mwoYZyI4EFZKBcYr' \
    --tag 'CEAE7WIsfmx40NLR' \
    > test.out 2>&1
eval_tap $? 27 'ImageList' test.out

#- 28 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImagesStorage' test.out

#- 29 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'c6m8heKnWhzfe2Nu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImageGet' test.out

#- 30 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'beoKFeIaFQCYoDPI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'ImageMarkForDeletion' test.out

#- 31 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'CpnduEEQlULdJz4m' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["nRBkMNxvvKgAT8mJ", "rYq6hRkloqxM3gpw", "xcfMy9XzjjI5YbsK"], "isProtected": false, "name": "DUL3sa13lk1dQBHO", "removedTags": ["86IlBhnetU4RwTqU", "XlTDBzOuYsaZA2yy", "d4mbqoOfADMMAXFa"]}' \
    > test.out 2>&1
eval_tap $? 31 'ImagePatch' test.out

#- 32 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'Y9eKa699bRVhyaKw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'ImageUnmarkForDeletion' test.out

#- 33 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'wrAP2aMlu7WtjCto' \
    > test.out 2>&1
eval_tap $? 33 'QoSRegionsGet' test.out

#- 34 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'YetOO847g8OudOfj' \
    --body '{"status": "nCuHZ3c46IjGa23Y"}' \
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
    --serverID 'vYmmDg7VYPXIuvUY' \
    > test.out 2>&1
eval_tap $? 36 'FleetServerInfo' test.out

#- 37 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'TZBRujIUE1Tq5jyA' \
    > test.out 2>&1
eval_tap $? 37 'FleetServerConnectionInfo' test.out

#- 38 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'ZvkRCMNFIurjh2im' \
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
    --fleetID 'db4rbkXj0ZwsVC0g' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "L97ZVJSPqJiwv1ql", "sessionId": "YB1RSKs6gQxC3Gb7"}' \
    > test.out 2>&1
eval_tap $? 41 'FleetClaimByID' test.out

#- 42 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'S0o4zGYY7KQI1AeF' \
    > test.out 2>&1
eval_tap $? 42 'LocalWatchdogConnect' test.out

#- 43 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["gPqaOkvo1aolB4lk", "KB4EYOkQ1jMD3cym", "8xIfkOVW2grREOLx"], "regions": ["0KOww3HICQLfl7MU", "BG7qtPu64yAtURKL", "Rkb738HGS6rDgMdI"], "sessionId": "IlhS1fSiM9331m7T"}' \
    > test.out 2>&1
eval_tap $? 43 'FleetClaimByKeys' test.out

#- 44 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'a1PsKc50Kv6ecnEe' \
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