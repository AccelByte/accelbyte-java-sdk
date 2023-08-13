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
echo "1..25"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 Func2
./ng net.accelbyte.sdk.cli.Main ams func2 \
    > test.out 2>&1
eval_tap $? 2 'Func2' test.out

#- 3 AccountGet
./ng net.accelbyte.sdk.cli.Main ams accountGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 3 'AccountGet' test.out

#- 4 AccountCreate
./ng net.accelbyte.sdk.cli.Main ams accountCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "EAxcVpFrttufHIRd"}' \
    > test.out 2>&1
eval_tap $? 4 'AccountCreate' test.out

#- 5 AccountLinkTokenGet
./ng net.accelbyte.sdk.cli.Main ams accountLinkTokenGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AccountLinkTokenGet' test.out

#- 6 AccountLink
./ng net.accelbyte.sdk.cli.Main ams accountLink \
    --namespace "$AB_NAMESPACE" \
    --body '{"token": "H9UzVRiXbqlAw7r6"}' \
    > test.out 2>&1
eval_tap $? 6 'AccountLink' test.out

#- 7 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'FleetList' test.out

#- 8 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["ktQG0h5JAav5kRa6", "2WopBJHPtcDs8bBZ", "LCXLx8bbgorQeFbQ"], "dsHostConfiguration": {"instanceId": "1g7qbPngUNB1vRod", "instanceType": "wpzS6DaDpv8N7ZQV", "serversPerVm": 33}, "imageDeploymentProfile": {"commandLine": "UkNmKJfh5pUkHODp", "imageId": "oMF78NY4YkHs1cnz", "portConfigurations": [{"name": "1JSDgY1TXp38zsCT", "protocol": "CrbCbPOyNQkT7Nvy"}, {"name": "E3cwyALczNIicXm7", "protocol": "agSrjJW2OQNOs1PX"}, {"name": "hT5FvdiRilZ7oFgx", "protocol": "4c8OumKtPDKJDXn7"}], "timeout": {"creation": 96, "drain": 4, "session": 14, "unresponsive": 66}}, "name": "su8XfqlqNiTvB6Sd", "regions": [{"bufferSize": 55, "maxServerCount": 30, "minServerCount": 6, "region": "rKsxwkosAVerXpc1"}, {"bufferSize": 58, "maxServerCount": 36, "minServerCount": 88, "region": "fwHuKeb9l3rGN9A3"}, {"bufferSize": 38, "maxServerCount": 52, "minServerCount": 81, "region": "WkFeZSoEAcBdW19m"}]}' \
    > test.out 2>&1
eval_tap $? 8 'FleetCreate' test.out

#- 9 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID '4eu6d5tA5jUmiTqp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'FleetGet' test.out

#- 10 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'yhPFdxLzFQN05MYz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["NPRZYdFLIAjGGJdd", "VCvu9vx5KQ7KYnIu", "MBvaO35llzQRaT5k"], "dsHostConfiguration": {"instanceId": "PxUfofvnnSuB0y5W", "instanceType": "UlrMdI4sNveabntB", "serversPerVm": 91}, "imageDeploymentProfile": {"commandLine": "nuRkgghGoYupD391", "imageId": "C2qtPYokahFjkQsf", "portConfigurations": [{"name": "CaTmt1d67FXGk2s9", "protocol": "Q0mPVo3twu0MesTC"}, {"name": "f9x4rt69lna7qxNe", "protocol": "IxPz6MbwL6IY69z1"}, {"name": "UaLqYSYWytLPziZM", "protocol": "djxcBZufQxGiHPll"}], "timeout": {"creation": 67, "drain": 91, "session": 59, "unresponsive": 5}}, "name": "2uE4o5Vwdo3fePqI", "regions": [{"bufferSize": 73, "maxServerCount": 25, "minServerCount": 55, "region": "LZZbSqb8RwNmn9Hr"}, {"bufferSize": 82, "maxServerCount": 22, "minServerCount": 88, "region": "a2l5BYNtIuS5S5XU"}, {"bufferSize": 6, "maxServerCount": 57, "minServerCount": 20, "region": "HYzUOcEdscKHPEqg"}]}' \
    > test.out 2>&1
eval_tap $? 10 'FleetUpdate' test.out

#- 11 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'A8yu7Vk6Jt4Ymos9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'FleetDelete' test.out

#- 12 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'Jcdos4fYcTVU6RBt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'FleetServers' test.out

#- 13 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID '0zYoMcHyCUEXlAvx' \
    --namespace "$AB_NAMESPACE" \
    --count '73' \
    --offset '49' \
    --reason 'MdalwSyliWMNW5Ny' \
    --region 'Lu0M3VHh2EI8JlDb' \
    --serverId 'PWbQ6Q9lNmqRBaAk' \
    --sortDirection 'LnvxkT1X68cmDc3f' \
    --status 'xU8MyKrQpM4hkkK6' \
    > test.out 2>&1
eval_tap $? 13 'FleetServerHistory' test.out

#- 14 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'ImageList' test.out

#- 15 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'KKXNB3Gv0IqmF51T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'ImageGet' test.out

#- 16 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'khjYnaq6foWvXa3b' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["MrXsDr6kILsSSyDd", "mykmoPYgc2L4jk4L", "o0LSP0pf4IxjUkl5"], "isProtected": true, "name": "X3ateEKDpADz1x3p", "removedTags": ["oD3Qgb3boLQQ1MzH", "7Qm8bwbmXgdAPh1E", "ThG96gAFKK2WDgCc"]}' \
    > test.out 2>&1
eval_tap $? 16 'ImagePatch' test.out

#- 17 InfoRegions
./ng net.accelbyte.sdk.cli.Main ams infoRegions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'InfoRegions' test.out

#- 18 FleetServerInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'xvONZm3EeERmDnye' \
    > test.out 2>&1
eval_tap $? 18 'FleetServerInfo' test.out

#- 19 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'FoF7VSZ6pf3vneSD' \
    > test.out 2>&1
eval_tap $? 19 'ServerHistory' test.out

#- 20 InfoSupportedInstances
./ng net.accelbyte.sdk.cli.Main ams infoSupportedInstances \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'InfoSupportedInstances' test.out

#- 21 FleetClaimByID
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByID \
    --fleetID '2Tb3g7mSQUhAEtrm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "jqU6YE3p4lSck0ZH"}' \
    > test.out 2>&1
eval_tap $? 21 'FleetClaimByID' test.out

#- 22 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["n5GI39YBHqaTHeKt", "W18iGeUlc9d9sogW", "a24CKNS0GqVvUfHQ"], "regions": ["vsHXNUNe4mhgo5QB", "65lSAiYnNjkfZrQv", "GgbLdLsFzHkBMr1y"]}' \
    > test.out 2>&1
eval_tap $? 22 'FleetClaimByKeys' test.out

#- 23 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'rOMlNFSrUEirnjX9' \
    > test.out 2>&1
eval_tap $? 23 'WatchdogConnect' test.out

#- 24 Func3
./ng net.accelbyte.sdk.cli.Main ams func3 \
    > test.out 2>&1
eval_tap $? 24 'Func3' test.out

#- 25 PortalHealthCheck
./ng net.accelbyte.sdk.cli.Main ams portalHealthCheck \
    > test.out 2>&1
eval_tap $? 25 'PortalHealthCheck' test.out


rm -f "tmp.dat"

exit $EXIT_CODE