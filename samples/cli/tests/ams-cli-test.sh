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

#- 20 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'BU5SepjChB3V0v52' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'FleetGet' test.out

#- 21 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'Dlym6puQ23xoJ8ae' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["F51TkhjYnaq6foWv", "Xa3bMrXsDr6kILsS", "SyDdmykmoPYgc2L4"], "dsHostConfiguration": {"instanceId": "jk4Lo0LSP0pf4Ixj", "serversPerVm": 95}, "fallbackFleet": "kSQ70D0H6BXksUC9", "hibernateAfterPeriod": "b6i5lZC9xv32e8c5", "imageDeploymentProfile": {"commandLine": "csSovoqsZNBdte9N", "imageId": "DUPVJf6c2Z0QZxfg", "portConfigurations": [{"name": "PubTDIHrvqAThuwj", "protocol": "RHpKKTlmVr9XuoJb"}, {"name": "RFQSKVPHbn4Xxtu7", "protocol": "LQRENjEEztx1WsYS"}, {"name": "iZqan0nSBJroav91", "protocol": "GXlvPG6bFYReVHQi"}], "timeout": {"claim": 32, "creation": 5, "drain": 39, "session": 59, "unresponsive": 30}}, "name": "x9Zw5D2L7vIYhGGS", "onDemand": true, "regions": [{"bufferSize": 70, "dynamicBuffer": true, "maxServerCount": 87, "minServerCount": 100, "region": "vsHXNUNe4mhgo5QB"}, {"bufferSize": 23, "dynamicBuffer": false, "maxServerCount": 92, "minServerCount": 24, "region": "AiYnNjkfZrQvGgbL"}, {"bufferSize": 6, "dynamicBuffer": true, "maxServerCount": 65, "minServerCount": 5, "region": "zHkBMr1yrOMlNFSr"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 18}}, "logs": {"crashed": {"collect": false, "percentage": 36}, "success": {"collect": false, "percentage": 68}, "unclaimed": {"collect": false, "percentage": 5}}}}' \
    > test.out 2>&1
eval_tap $? 21 'FleetUpdate' test.out

#- 22 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'X9fDmIbeZxzfTcyi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetDelete' test.out

#- 23 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'uATus9hsfpFDcSDG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesGet' test.out

#- 24 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID '8aMVGLiBNrDjqoxc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": true, "percentage": 95}}, "logs": {"crashed": {"collect": false, "percentage": 71}, "success": {"collect": false, "percentage": 77}, "unclaimed": {"collect": true, "percentage": 5}}}' \
    > test.out 2>&1
eval_tap $? 24 'FleetArtifactSamplingRulesSet' test.out

#- 25 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'UL4pp2ncYAHdNzDm' \
    --namespace "$AB_NAMESPACE" \
    --count '9' \
    --offset '26' \
    --region 'IP6rOvDz9KOsb392' \
    --serverId 'k6YmJFfRByjlBiuF' \
    --sortBy 'M3FIoVk8T3GpAnkC' \
    --sortDirection 'asc' \
    --status 'draining' \
    > test.out 2>&1
eval_tap $? 25 'FleetServers' test.out

#- 26 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'BUqg2SCnqntX9y1a' \
    --namespace "$AB_NAMESPACE" \
    --count '34' \
    --offset '92' \
    --reason 'OBSC2DKHRuPMMWH8' \
    --region 'Yb33T5UBJCjfcnLR' \
    --serverId 'fxeCSz9WEi8Klloe' \
    --sortDirection 'H0JT1yduat2vQR3b' \
    --status 'iBfsu4jmsRE2w1yE' \
    > test.out 2>&1
eval_tap $? 26 'FleetServerHistory' test.out

#- 27 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '20' \
    --inUse 'Ak4mqrxzTtuLl4Xl' \
    --isProtected  \
    --name 'bGL8QOxtjzm8y2wN' \
    --offset '15' \
    --sortBy 'aOMh5eC3IHeHSKLC' \
    --sortDirection 'a3xreNDUWehwH3q3' \
    --status '1A806DJgas4b6z3L' \
    --tag 'NUj7fdgLA84Z8YYk' \
    > test.out 2>&1
eval_tap $? 27 'ImageList' test.out

#- 28 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImagesStorage' test.out

#- 29 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID '6QEgJjBbEDoNf3n0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImageGet' test.out

#- 30 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'hEoRCAcf80zfFyab' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'ImageMarkForDeletion' test.out

#- 31 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'WAgIUXiI07A68eaq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["C2J9jyEW6GLbc0Na", "KDUL3sa13lk1dQBH", "O86IlBhnetU4RwTq"], "isProtected": true, "name": "XlTDBzOuYsaZA2yy", "removedTags": ["d4mbqoOfADMMAXFa", "Y9eKa699bRVhyaKw", "wrAP2aMlu7WtjCto"]}' \
    > test.out 2>&1
eval_tap $? 31 'ImagePatch' test.out

#- 32 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'YetOO847g8OudOfj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'ImageUnmarkForDeletion' test.out

#- 33 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'nCuHZ3c46IjGa23Y' \
    > test.out 2>&1
eval_tap $? 33 'QoSRegionsGet' test.out

#- 34 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'vYmmDg7VYPXIuvUY' \
    --body '{"status": "TZBRujIUE1Tq5jyA"}' \
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
    --serverID 'ZvkRCMNFIurjh2im' \
    > test.out 2>&1
eval_tap $? 36 'FleetServerInfo' test.out

#- 37 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'db4rbkXj0ZwsVC0g' \
    > test.out 2>&1
eval_tap $? 37 'FleetServerConnectionInfo' test.out

#- 38 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'L97ZVJSPqJiwv1ql' \
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
    --fleetID 'YB1RSKs6gQxC3Gb7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "S0o4zGYY7KQI1AeF", "sessionId": "gPqaOkvo1aolB4lk"}' \
    > test.out 2>&1
eval_tap $? 41 'FleetClaimByID' test.out

#- 42 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'KB4EYOkQ1jMD3cym' \
    > test.out 2>&1
eval_tap $? 42 'LocalWatchdogConnect' test.out

#- 43 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["8xIfkOVW2grREOLx", "0KOww3HICQLfl7MU", "BG7qtPu64yAtURKL"], "regions": ["Rkb738HGS6rDgMdI", "IlhS1fSiM9331m7T", "a1PsKc50Kv6ecnEe"], "sessionId": "vcAx2K2zkRenmPZn"}' \
    > test.out 2>&1
eval_tap $? 43 'FleetClaimByKeys' test.out

#- 44 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'GBt4P7WnbdSJtjX7' \
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