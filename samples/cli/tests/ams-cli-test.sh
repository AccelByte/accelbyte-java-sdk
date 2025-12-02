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
echo "1..48"

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
    --imageId 'gGVbMqSszE8GHavj' \
    --name '7AorKsxwkosAVerX' \
    --offset '31' \
    --sortBy 'name' \
    --sortDirection 'asc' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "i5r6QEa1ysLEzth6", "expiresAt": "1977-11-23T00:00:00Z", "imageId": "XhzkzWkFeZSoEAcB", "name": "dW19m4eu6d5tA5jU"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID 'miTqpyhPFdxLzFQN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID '05MYzYiKWe5dNRlj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DevelopmentServerConfigurationDelete' test.out

#- 17 DevelopmentServerConfigurationPatch
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationPatch \
    --developmentServerConfigID 'v7IPrDQQRgat0Sev' \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "kLGMS0lyuI9a2I9u", "expiresAt": "1992-12-18T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 17 'DevelopmentServerConfigurationPatch' test.out

#- 18 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    --active  \
    --count '31' \
    --name 'aT5kPxUfofvnnSuB' \
    --offset '66' \
    --region 'y5WUlrMdI4sNveab' \
    --sortBy 'active' \
    --sortDirection 'desc' \
    > test.out 2>&1
eval_tap $? 18 'FleetList' test.out

#- 19 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["KgnuRkgghGoYupD3", "91C2qtPYokahFjkQ", "sfCaTmt1d67FXGk2"], "dsHostConfiguration": {"instanceId": "s9Q0mPVo3twu0Mes", "serversPerVm": 93}, "fallbackFleet": "I3lMjGSWN2laRlxf", "hibernateAfterPeriod": "cjHfYakUCTqGkE7w", "imageDeploymentProfile": {"commandLine": "cWfDslpJSqGAXQ0y", "imageId": "YoNRKd3IL5TAQ6ii", "portConfigurations": [{"name": "PlSC2uE4o5Vwdo3f", "protocol": "ePqIJA8IHtrkmu0h"}, {"name": "pDDWVAla2l5BYNtI", "protocol": "uS5S5XUdjsoqwGyz"}, {"name": "zWi9gwQYv7t1o7TT", "protocol": "r1DmrhZv15T7quIO"}], "timeout": {"claim": 44, "creation": 5, "drain": 57, "session": 94, "unresponsive": 80}}, "name": "VU6RBt0zYoMcHyCU", "onDemand": true, "regions": [{"bufferSize": 55, "dynamicBuffer": false, "maxServerCount": 25, "minServerCount": 55, "region": "aLoxozr6wfNPX2bO"}, {"bufferSize": 70, "dynamicBuffer": true, "maxServerCount": 81, "minServerCount": 90, "region": "yLu0M3VHh2EI8JlD"}, {"bufferSize": 3, "dynamicBuffer": false, "maxServerCount": 86, "minServerCount": 66, "region": "6Q9lNmqRBaAkLnvx"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 29}}, "logs": {"crashed": {"collect": true, "percentage": 31}, "success": {"collect": true, "percentage": 5}, "unclaimed": {"collect": true, "percentage": 25}}}}' \
    > test.out 2>&1
eval_tap $? 19 'FleetCreate' test.out

#- 20 BulkFleetDelete
./ng net.accelbyte.sdk.cli.Main ams bulkFleetDelete \
    --namespace "$AB_NAMESPACE" \
    --body '{"fleetIds": ["BU5SepjChB3V0v52", "Dlym6puQ23xoJ8ae", "CnaLpUKp44YUDjas"]}' \
    > test.out 2>&1
eval_tap $? 20 'BulkFleetDelete' test.out

#- 21 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'WIPUvmEejtGeoyIP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetGet' test.out

#- 22 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'a8ZRrvjj7il35MXb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["9oCMNqq98SjTvhZN", "kSQ70D0H6BXksUC9", "b6i5lZC9xv32e8c5"], "dsHostConfiguration": {"instanceId": "csSovoqsZNBdte9N", "serversPerVm": 60}, "fallbackFleet": "APh1EThG96gAFKK2", "hibernateAfterPeriod": "WDgCcxvONZm3EeER", "imageDeploymentProfile": {"commandLine": "mDnyeFoF7VSZ6pf3", "imageId": "vneSD2Tb3g7mSQUh", "portConfigurations": [{"name": "AEtrmjqU6YE3p4lS", "protocol": "ck0ZHn5GI39YBHqa"}, {"name": "THeKtW18iGeUlc9d", "protocol": "9sogWa24CKNS0GqV"}, {"name": "vUfHQvsHXNUNe4mh", "protocol": "go5QB65lSAiYnNjk"}], "timeout": {"claim": 11, "creation": 33, "drain": 79, "session": 36, "unresponsive": 35}}, "name": "QvGgbLdLsFzHkBMr", "onDemand": true, "regions": [{"bufferSize": 50, "dynamicBuffer": true, "maxServerCount": 92, "minServerCount": 83, "region": "ZjtqXyJ58f7Gc26S"}, {"bufferSize": 0, "dynamicBuffer": false, "maxServerCount": 18, "minServerCount": 72, "region": "GVkydwYWQG26yUZN"}, {"bufferSize": 25, "dynamicBuffer": false, "maxServerCount": 93, "minServerCount": 39, "region": "BcvrbYCwZtxFHyPL"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 81}}, "logs": {"crashed": {"collect": true, "percentage": 61}, "success": {"collect": false, "percentage": 18}, "unclaimed": {"collect": false, "percentage": 34}}}}' \
    > test.out 2>&1
eval_tap $? 22 'FleetUpdate' test.out

#- 23 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'byDPUIj88cekdqCt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'FleetDelete' test.out

#- 24 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID '81P1ktfIovmv9gsR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'FleetArtifactSamplingRulesGet' test.out

#- 25 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID '5cJcHm3SZLxoRDFu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": true, "percentage": 11}}, "logs": {"crashed": {"collect": true, "percentage": 89}, "success": {"collect": true, "percentage": 56}, "unclaimed": {"collect": true, "percentage": 18}}}' \
    > test.out 2>&1
eval_tap $? 25 'FleetArtifactSamplingRulesSet' test.out

#- 26 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'jlBiuFM3FIoVk8T3' \
    --namespace "$AB_NAMESPACE" \
    --count '67' \
    --offset '64' \
    --region 'pAnkCmBUqg2SCnqn' \
    --serverId 'tX9y1aZSWMiVi10s' \
    --sortBy 'G6vxkfUcmqRRbceJ' \
    --sortDirection 'desc' \
    --status 'claiming' \
    > test.out 2>&1
eval_tap $? 26 'FleetServers' test.out

#- 27 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'jfcnLRfxeCSz9WEi' \
    --namespace "$AB_NAMESPACE" \
    --count '60' \
    --offset '75' \
    --reason 'ml48wdNFLTm5T50x' \
    --region '9WT0GfH2rtOa4EXs' \
    --serverId 'XzOXQAk4mqrxzTtu' \
    --sortDirection 'Ll4XlbGL8QOxtjzm' \
    --status '8y2wNhmwoYZyI4EF' \
    > test.out 2>&1
eval_tap $? 27 'FleetServerHistory' test.out

#- 28 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '69' \
    --inUse 'KBcYrCEAE7WIsfmx' \
    --isProtected  \
    --name '40NLRc6m8heKnWhz' \
    --offset '11' \
    --sortBy '6z3LNUj7fdgLA84Z' \
    --sortDirection '8YYk6QEgJjBbEDoN' \
    --status 'f3n0hEoRCAcf80zf' \
    --tag 'FyabWAgIUXiI07A6' \
    --targetArchitecture '8eaqC2J9jyEW6GLb' \
    > test.out 2>&1
eval_tap $? 28 'ImageList' test.out

#- 29 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImagesStorage' test.out

#- 30 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'c0NaKDUL3sa13lk1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'ImageGet' test.out

#- 31 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'dQBHO86IlBhnetU4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ImageMarkForDeletion' test.out

#- 32 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'RwTqUXlTDBzOuYsa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["ZA2yyd4mbqoOfADM", "MAXFaY9eKa699bRV", "hyaKwwrAP2aMlu7W"], "isProtected": true, "name": "odenSrUTvfqU0bfo", "removedTags": ["Mm5cTtFWbotQyXJR", "cQWsmqPNs92epxk0", "i8VxsZNereSvf969"]}' \
    > test.out 2>&1
eval_tap $? 32 'ImagePatch' test.out

#- 33 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID '9mCEHThUJkETAsSp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'ImageUnmarkForDeletion' test.out

#- 34 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status '7gh4TeUTkOkAYfJB' \
    > test.out 2>&1
eval_tap $? 34 'QoSRegionsGet' test.out

#- 35 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region '8AT9t4Tv207Y2QD3' \
    --body '{"status": "oD5fLCr3OOlXVv8Z"}' \
    > test.out 2>&1
eval_tap $? 35 'QoSRegionsUpdate' test.out

#- 36 InfoRegions
./ng net.accelbyte.sdk.cli.Main ams infoRegions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'InfoRegions' test.out

#- 37 FleetServerInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'GF7uYnGzpipNDigN' \
    > test.out 2>&1
eval_tap $? 37 'FleetServerInfo' test.out

#- 38 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'Jma1MbqqZtfNWql4' \
    > test.out 2>&1
eval_tap $? 38 'FleetServerConnectionInfo' test.out

#- 39 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'nmwAft4gqkNNlWkD' \
    > test.out 2>&1
eval_tap $? 39 'ServerHistory' test.out

#- 40 InfoSupportedInstances
./ng net.accelbyte.sdk.cli.Main ams infoSupportedInstances \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'InfoSupportedInstances' test.out

#- 41 AccountGet
./ng net.accelbyte.sdk.cli.Main ams accountGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 41 'AccountGet' test.out

#- 42 FleetClaimByID
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByID \
    --fleetID '9eOziYRFOn0jJLHC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "9LxhvNXTwGBCtohL", "sessionId": "tl9Zuhytm5UDrT6Q"}' \
    > test.out 2>&1
eval_tap $? 42 'FleetClaimByID' test.out

#- 43 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'XCs5SPBbRPZTF6oQ' \
    > test.out 2>&1
eval_tap $? 43 'LocalWatchdogConnect' test.out

#- 44 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["AXVG7tnsZg5QgXjv", "yGJPN4eXbJE5Vs2G", "cyomQoIXimBJehyx"], "regions": ["lNsjUgxBkF6wFPoJ", "eQediogEhhM2rIiz", "GdKvOPdq5xrgxSmy"], "sessionId": "1DN9LFkYW5DQyj4b"}' \
    > test.out 2>&1
eval_tap $? 44 'FleetClaimByKeys' test.out

#- 45 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'j5Ro2ogaKt2ujQSa' \
    > test.out 2>&1
eval_tap $? 45 'WatchdogConnect' test.out

#- 46 UploadURLGet
./ng net.accelbyte.sdk.cli.Main ams uploadURLGet \
    > test.out 2>&1
eval_tap $? 46 'UploadURLGet' test.out

#- 47 Func1
./ng net.accelbyte.sdk.cli.Main ams func1 \
    > test.out 2>&1
eval_tap $? 47 'Func1' test.out

#- 48 BasicHealthCheck
./ng net.accelbyte.sdk.cli.Main ams basicHealthCheck \
    > test.out 2>&1
eval_tap $? 48 'BasicHealthCheck' test.out


rm -f "tmp.dat"

exit $EXIT_CODE