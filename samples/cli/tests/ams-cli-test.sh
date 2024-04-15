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
echo "1..42"

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

#- 9 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'ArtifactUsageGet' test.out

#- 10 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID 'RTcPiSuL0Sly6XM4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactDelete' test.out

#- 11 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'OI18mAQLnzjMf8GZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactGetURL' test.out

#- 12 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '456' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 12 'DevelopmentServerConfigurationList' test.out

#- 13 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "WBZqxYG3aREAu2D6", "imageId": "QVKNCWP75TB0i7pK", "name": "xR8dl0zRVW4EZG9m"}' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationCreate' test.out

#- 14 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID '0XcgGVbMqSszE8GH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationGet' test.out

#- 15 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID 'avj7AorKsxwkosAV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationDelete' test.out

#- 16 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'FleetList' test.out

#- 17 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["ecdKi5r6QEa1ysLE", "zth6mXhzkzWkFeZS", "oEAcBdW19m4eu6d5"], "dsHostConfiguration": {"instanceId": "tA5jUmiTqpyhPFdx", "instanceType": "LzFQN05MYzYiKWe5", "serversPerVm": 7}, "imageDeploymentProfile": {"commandLine": "dFLIAjGGJddVCvu9", "imageId": "vx5KQ7KYnIuMBvaO", "portConfigurations": [{"name": "35llzQRaT5kPxUfo", "protocol": "fvnnSuB0y5WUlrMd"}, {"name": "I4sNveabntBSxTeI", "protocol": "v53HGCiljvjKoyD6"}, {"name": "SCwGrncqmLtjQHAf", "protocol": "8TgoNm03VLisV6zw"}], "timeout": {"creation": 86, "drain": 30, "session": 42, "unresponsive": 29}}, "name": "twu0MesTCf9x4rt6", "onDemand": false, "regions": [{"bufferSize": 23, "maxServerCount": 27, "minServerCount": 0, "region": "a7qxNeIxPz6MbwL6"}, {"bufferSize": 70, "maxServerCount": 21, "minServerCount": 62, "region": "69z1UaLqYSYWytLP"}, {"bufferSize": 52, "maxServerCount": 18, "minServerCount": 50, "region": "ZMdjxcBZufQxGiHP"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 86}, "success": {"collect": false, "percentage": 23}}, "logs": {"crashed": {"collect": true, "percentage": 5}, "success": {"collect": true, "percentage": 62}}}}' \
    > test.out 2>&1
eval_tap $? 17 'FleetCreate' test.out

#- 18 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'E4o5Vwdo3fePqIJA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'FleetGet' test.out

#- 19 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID '8IHtrkmu0hpDDWVA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["Qy4uZAAiE0mit9RG", "CCHYzUOcEdscKHPE", "qgA8yu7Vk6Jt4Ymo"], "dsHostConfiguration": {"instanceId": "s9Jcdos4fYcTVU6R", "instanceType": "Bt0zYoMcHyCUEXlA", "serversPerVm": 44}, "imageDeploymentProfile": {"commandLine": "Loxozr6wfNPX2bOI", "imageId": "tRMvqtlB2jJCSQT2", "portConfigurations": [{"name": "79ZZPYGu0rdlgdWy", "protocol": "OtXi3choQrpOsDBU"}, {"name": "5SepjChB3V0v52Dl", "protocol": "ym6puQ23xoJ8aeCn"}, {"name": "aLpUKp44YUDjasWI", "protocol": "PUvmEejtGeoyIPa8"}], "timeout": {"creation": 61, "drain": 90, "session": 7, "unresponsive": 37}}, "name": "mykmoPYgc2L4jk4L", "onDemand": false, "regions": [{"bufferSize": 82, "maxServerCount": 33, "minServerCount": 76, "region": "q98SjTvhZNkSQ70D"}, {"bufferSize": 69, "maxServerCount": 1, "minServerCount": 40, "region": "BXksUC9b6i5lZC9x"}, {"bufferSize": 44, "maxServerCount": 14, "minServerCount": 2, "region": "2e8c5csSovoqsZNB"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 2}, "success": {"collect": true, "percentage": 25}}, "logs": {"crashed": {"collect": false, "percentage": 13}, "success": {"collect": false, "percentage": 60}}}}' \
    > test.out 2>&1
eval_tap $? 19 'FleetUpdate' test.out

#- 20 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'APh1EThG96gAFKK2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'FleetDelete' test.out

#- 21 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'WDgCcxvONZm3EeER' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetArtifactSamplingRulesGet' test.out

#- 22 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'mDnyeFoF7VSZ6pf3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": true, "percentage": 64}, "success": {"collect": false, "percentage": 87}}, "logs": {"crashed": {"collect": false, "percentage": 92}, "success": {"collect": true, "percentage": 98}}}' \
    > test.out 2>&1
eval_tap $? 22 'FleetArtifactSamplingRulesSet' test.out

#- 23 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID '2Tb3g7mSQUhAEtrm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'FleetServers' test.out

#- 24 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'jqU6YE3p4lSck0ZH' \
    --namespace "$AB_NAMESPACE" \
    --count '28' \
    --offset '28' \
    --reason '5GI39YBHqaTHeKtW' \
    --region '18iGeUlc9d9sogWa' \
    --serverId '24CKNS0GqVvUfHQv' \
    --sortDirection 'sHXNUNe4mhgo5QB6' \
    --status '5lSAiYnNjkfZrQvG' \
    > test.out 2>&1
eval_tap $? 24 'FleetServerHistory' test.out

#- 25 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'ImageList' test.out

#- 26 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'gbLdLsFzHkBMr1yr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'ImageGet' test.out

#- 27 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'OMlNFSrUEirnjX9f' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["DmIbeZxzfTcyiuAT", "us9hsfpFDcSDG8aM", "VGLiBNrDjqoxcwgG"], "isProtected": true, "name": "cekdqCt81P1ktfIo", "removedTags": ["vmv9gsR5cJcHm3SZ", "LxoRDFuuuySj29a9", "LJE8HoRS1X2PFAAM"]}' \
    > test.out 2>&1
eval_tap $? 27 'ImagePatch' test.out

#- 28 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'wzHPxB1UskYs4Yw2' \
    > test.out 2>&1
eval_tap $? 28 'QoSRegionsGet' test.out

#- 29 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region '0DOqOBSC2DKHRuPM' \
    --body '{"status": "MWH8Yb33T5UBJCjf"}' \
    > test.out 2>&1
eval_tap $? 29 'QoSRegionsUpdate' test.out

#- 30 InfoRegions
./ng net.accelbyte.sdk.cli.Main ams infoRegions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'InfoRegions' test.out

#- 31 FleetServerInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'cnLRfxeCSz9WEi8K' \
    > test.out 2>&1
eval_tap $? 31 'FleetServerInfo' test.out

#- 32 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'lloeH0JT1yduat2v' \
    > test.out 2>&1
eval_tap $? 32 'FleetServerConnectionInfo' test.out

#- 33 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'QR3biBfsu4jmsRE2' \
    > test.out 2>&1
eval_tap $? 33 'ServerHistory' test.out

#- 34 InfoSupportedInstances
./ng net.accelbyte.sdk.cli.Main ams infoSupportedInstances \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'InfoSupportedInstances' test.out

#- 35 AccountGet
./ng net.accelbyte.sdk.cli.Main ams accountGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'AccountGet' test.out

#- 36 FleetClaimByID
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByID \
    --fleetID 'w1yEkLgh3tIYt4Sq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "YUTLDx9gIiDandpG", "sessionId": "T2t24aOMh5eC3IHe"}' \
    > test.out 2>&1
eval_tap $? 36 'FleetClaimByID' test.out

#- 37 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'HSKLCa3xreNDUWeh' \
    > test.out 2>&1
eval_tap $? 37 'LocalWatchdogConnect' test.out

#- 38 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["wH3q31A806DJgas4", "b6z3LNUj7fdgLA84", "Z8YYk6QEgJjBbEDo"], "regions": ["Nf3n0hEoRCAcf80z", "fFyabWAgIUXiI07A", "68eaqC2J9jyEW6GL"], "sessionId": "bc0NaKDUL3sa13lk"}' \
    > test.out 2>&1
eval_tap $? 38 'FleetClaimByKeys' test.out

#- 39 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID '1dQBHO86IlBhnetU' \
    > test.out 2>&1
eval_tap $? 39 'WatchdogConnect' test.out

#- 40 UploadURLGet
./ng net.accelbyte.sdk.cli.Main ams uploadURLGet \
    > test.out 2>&1
eval_tap $? 40 'UploadURLGet' test.out

#- 41 Func1
./ng net.accelbyte.sdk.cli.Main ams func1 \
    > test.out 2>&1
eval_tap $? 41 'Func1' test.out

#- 42 BasicHealthCheck
./ng net.accelbyte.sdk.cli.Main ams basicHealthCheck \
    > test.out 2>&1
eval_tap $? 42 'BasicHealthCheck' test.out


rm -f "tmp.dat"

exit $EXIT_CODE