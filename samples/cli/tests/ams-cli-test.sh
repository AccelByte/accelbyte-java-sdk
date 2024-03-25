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
    > test.out 2>&1
eval_tap $? 12 'DevelopmentServerConfigurationList' test.out

#- 13 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLine": "2WBZqxYG3aREAu2D", "imageId": "6QVKNCWP75TB0i7p", "name": "KxR8dl0zRVW4EZG9"}' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationCreate' test.out

#- 14 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID 'm0XcgGVbMqSszE8G' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationGet' test.out

#- 15 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID 'Havj7AorKsxwkosA' \
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
    --body '{"active": false, "claimKeys": ["ecdKi5r6QEa1ysLE", "zth6mXhzkzWkFeZS", "oEAcBdW19m4eu6d5"], "dsHostConfiguration": {"instanceId": "tA5jUmiTqpyhPFdx", "instanceType": "LzFQN05MYzYiKWe5", "serversPerVm": 7}, "imageDeploymentProfile": {"commandLine": "dFLIAjGGJddVCvu9", "imageId": "vx5KQ7KYnIuMBvaO", "portConfigurations": [{"name": "35llzQRaT5kPxUfo", "protocol": "fvnnSuB0y5WUlrMd"}, {"name": "I4sNveabntBSxTeI", "protocol": "v53HGCiljvjKoyD6"}, {"name": "SCwGrncqmLtjQHAf", "protocol": "8TgoNm03VLisV6zw"}], "timeout": {"creation": 86, "drain": 30, "session": 42, "unresponsive": 29}}, "name": "twu0MesTCf9x4rt6", "regions": [{"bufferSize": 23, "maxServerCount": 23, "minServerCount": 27, "region": "aRlxfcjHfYakUCTq"}, {"bufferSize": 67, "maxServerCount": 70, "minServerCount": 21, "region": "Y69z1UaLqYSYWytL"}, {"bufferSize": 85, "maxServerCount": 88, "minServerCount": 52, "region": "0yYoNRKd3IL5TAQ6"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 86}, "success": {"collect": false, "percentage": 24}}, "logs": {"crashed": {"collect": false, "percentage": 23}, "success": {"collect": true, "percentage": 5}}}}' \
    > test.out 2>&1
eval_tap $? 17 'FleetCreate' test.out

#- 18 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID '2uE4o5Vwdo3fePqI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'FleetGet' test.out

#- 19 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'JA8IHtrkmu0hpDDW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["Ala2l5BYNtIuS5S5", "XUdjsoqwGyzzWi9g", "wQYv7t1o7TTr1Dmr"], "dsHostConfiguration": {"instanceId": "hZv15T7quIOvBMca", "instanceType": "YmvCkGZ5dAgqxpBF", "serversPerVm": 25}, "imageDeploymentProfile": {"commandLine": "AvxJMdalwSyliWMN", "imageId": "W5NyLu0M3VHh2EI8", "portConfigurations": [{"name": "JlDbPWbQ6Q9lNmqR", "protocol": "BaAkLnvxkT1X68cm"}, {"name": "Dc3fxU8MyKrQpM4h", "protocol": "kkK6KKXNB3Gv0Iqm"}, {"name": "F51TkhjYnaq6foWv", "protocol": "Xa3bMrXsDr6kILsS"}], "timeout": {"creation": 91, "drain": 51, "session": 61, "unresponsive": 90}}, "name": "dmykmoPYgc2L4jk4", "regions": [{"bufferSize": 76, "maxServerCount": 79, "minServerCount": 30, "region": "Nqq98SjTvhZNkSQ7"}, {"bufferSize": 60, "maxServerCount": 69, "minServerCount": 1, "region": "6BXksUC9b6i5lZC9"}, {"bufferSize": 47, "maxServerCount": 87, "minServerCount": 44, "region": "gb3boLQQ1MzH7Qm8"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 56}, "success": {"collect": true, "percentage": 6}}, "logs": {"crashed": {"collect": false, "percentage": 40}, "success": {"collect": false, "percentage": 9}}}}' \
    > test.out 2>&1
eval_tap $? 19 'FleetUpdate' test.out

#- 20 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'XgdAPh1EThG96gAF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'FleetDelete' test.out

#- 21 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'KK2WDgCcxvONZm3E' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetArtifactSamplingRulesGet' test.out

#- 22 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'eERmDnyeFoF7VSZ6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": true, "percentage": 74}, "success": {"collect": false, "percentage": 4}}, "logs": {"crashed": {"collect": true, "percentage": 64}, "success": {"collect": false, "percentage": 87}}}' \
    > test.out 2>&1
eval_tap $? 22 'FleetArtifactSamplingRulesSet' test.out

#- 23 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'eSD2Tb3g7mSQUhAE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'FleetServers' test.out

#- 24 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'trmjqU6YE3p4lSck' \
    --namespace "$AB_NAMESPACE" \
    --count '1' \
    --offset '27' \
    --reason 'Hn5GI39YBHqaTHeK' \
    --region 'tW18iGeUlc9d9sog' \
    --serverId 'Wa24CKNS0GqVvUfH' \
    --sortDirection 'QvsHXNUNe4mhgo5Q' \
    --status 'B65lSAiYnNjkfZrQ' \
    > test.out 2>&1
eval_tap $? 24 'FleetServerHistory' test.out

#- 25 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'ImageList' test.out

#- 26 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'vGgbLdLsFzHkBMr1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'ImageGet' test.out

#- 27 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'yrOMlNFSrUEirnjX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["9fDmIbeZxzfTcyiu", "ATus9hsfpFDcSDG8", "aMVGLiBNrDjqoxcw"], "isProtected": false, "name": "Ij88cekdqCt81P1k", "removedTags": ["tfIovmv9gsR5cJcH", "m3SZLxoRDFuuuySj", "29a9LJE8HoRS1X2P"]}' \
    > test.out 2>&1
eval_tap $? 27 'ImagePatch' test.out

#- 28 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'FAAMwzHPxB1UskYs' \
    > test.out 2>&1
eval_tap $? 28 'QoSRegionsGet' test.out

#- 29 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region '4Yw20DOqOBSC2DKH' \
    --body '{"status": "RuPMMWH8Yb33T5UB"}' \
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
    --serverID 'JCjfcnLRfxeCSz9W' \
    > test.out 2>&1
eval_tap $? 31 'FleetServerInfo' test.out

#- 32 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'Ei8KlloeH0JT1ydu' \
    > test.out 2>&1
eval_tap $? 32 'FleetServerConnectionInfo' test.out

#- 33 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'at2vQR3biBfsu4jm' \
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
    --fleetID 'sRE2w1yEkLgh3tIY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "t4SqYUTLDx9gIiDa", "sessionId": "ndpGT2t24aOMh5eC"}' \
    > test.out 2>&1
eval_tap $? 36 'FleetClaimByID' test.out

#- 37 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID '3IHeHSKLCa3xreND' \
    > test.out 2>&1
eval_tap $? 37 'LocalWatchdogConnect' test.out

#- 38 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["UWehwH3q31A806DJ", "gas4b6z3LNUj7fdg", "LA84Z8YYk6QEgJjB"], "regions": ["bEDoNf3n0hEoRCAc", "f80zfFyabWAgIUXi", "I07A68eaqC2J9jyE"], "sessionId": "W6GLbc0NaKDUL3sa"}' \
    > test.out 2>&1
eval_tap $? 38 'FleetClaimByKeys' test.out

#- 39 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID '13lk1dQBHO86IlBh' \
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