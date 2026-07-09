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
    --includeInactiveRegions  \
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
    --body '{"active": true, "claimKeys": ["KgnuRkgghGoYupD3", "91C2qtPYokahFjkQ", "sfCaTmt1d67FXGk2"], "dsHostConfiguration": {"instanceId": "s9Q0mPVo3twu0Mes", "serversPerVm": 93}, "fallbackFleet": "I3lMjGSWN2laRlxf", "hibernateAfterPeriod": "cjHfYakUCTqGkE7w", "imageDeploymentProfile": {"commandLine": "cWfDslpJSqGAXQ0y", "imageId": "YoNRKd3IL5TAQ6ii", "portConfigurations": [{"name": "PlSC2uE4o5Vwdo3f", "protocol": "ePqIJA8IHtrkmu0h"}, {"name": "pDDWVAla2l5BYNtI", "protocol": "uS5S5XUdjsoqwGyz"}, {"name": "zWi9gwQYv7t1o7TT", "protocol": "r1DmrhZv15T7quIO"}], "timeout": {"claim": 44, "creation": 5, "drain": 57, "session": 94, "unresponsive": 80}}, "name": "VU6RBt0zYoMcHyCU", "onDemand": true, "regions": [{"bufferSize": 55, "dynamicBuffer": false, "maxServerCount": 25, "minServerCount": 55, "region": "aLoxozr6wfNPX2bO", "state": "ItRMvqtlB2jJCSQT"}, {"bufferSize": 22, "dynamicBuffer": true, "maxServerCount": 3, "minServerCount": 86, "region": "ZPYGu0rdlgdWyOtX", "state": "i3choQrpOsDBU5Se"}, {"bufferSize": 31, "dynamicBuffer": false, "maxServerCount": 59, "minServerCount": 79, "region": "hB3V0v52Dlym6puQ", "state": "23xoJ8aeCnaLpUKp"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 1}}, "logs": {"crashed": {"collect": true, "percentage": 96}, "success": {"collect": true, "percentage": 11}, "unclaimed": {"collect": false, "percentage": 30}}}}' \
    > test.out 2>&1
eval_tap $? 19 'FleetCreate' test.out

#- 20 BulkFleetDelete
./ng net.accelbyte.sdk.cli.Main ams bulkFleetDelete \
    --namespace "$AB_NAMESPACE" \
    --body '{"fleetIds": ["asWIPUvmEejtGeoy", "IPa8ZRrvjj7il35M", "XbN9oCMNqq98SjTv"]}' \
    > test.out 2>&1
eval_tap $? 20 'BulkFleetDelete' test.out

#- 21 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'hZNkSQ70D0H6BXks' \
    --namespace "$AB_NAMESPACE" \
    --includeInactiveRegions  \
    > test.out 2>&1
eval_tap $? 21 'FleetGet' test.out

#- 22 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'UC9b6i5lZC9xv32e' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["c5csSovoqsZNBdte", "9NDUPVJf6c2Z0QZx", "fgPubTDIHrvqAThu"], "dsHostConfiguration": {"instanceId": "wjRHpKKTlmVr9Xuo", "serversPerVm": 74}, "fallbackFleet": "f3vneSD2Tb3g7mSQ", "hibernateAfterPeriod": "UhAEtrmjqU6YE3p4", "imageDeploymentProfile": {"commandLine": "lSck0ZHn5GI39YBH", "imageId": "qaTHeKtW18iGeUlc", "portConfigurations": [{"name": "9d9sogWa24CKNS0G", "protocol": "qVvUfHQvsHXNUNe4"}, {"name": "mhgo5QB65lSAiYnN", "protocol": "jkfZrQvGgbLdLsFz"}, {"name": "HkBMr1yrOMlNFSrU", "protocol": "EirnjX9fDmIbeZxz"}], "timeout": {"claim": 12, "creation": 93, "drain": 99, "session": 5, "unresponsive": 86}}, "name": "yiuATus9hsfpFDcS", "onDemand": true, "regions": [{"bufferSize": 46, "dynamicBuffer": true, "maxServerCount": 0, "minServerCount": 48, "region": "MVGLiBNrDjqoxcwg", "state": "GLXpUL4pp2ncYAHd"}, {"bufferSize": 82, "dynamicBuffer": false, "maxServerCount": 52, "minServerCount": 71, "region": "DmeIP6rOvDz9KOsb", "state": "392k6YmJFfRByjlB"}, {"bufferSize": 16, "dynamicBuffer": true, "maxServerCount": 77, "minServerCount": 65, "region": "JE8HoRS1X2PFAAMw", "state": "zHPxB1UskYs4Yw20"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 1}}, "logs": {"crashed": {"collect": true, "percentage": 92}, "success": {"collect": true, "percentage": 79}, "unclaimed": {"collect": false, "percentage": 59}}}}' \
    > test.out 2>&1
eval_tap $? 22 'FleetUpdate' test.out

#- 23 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'Vi10sG6vxkfUcmqR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'FleetDelete' test.out

#- 24 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'RbceJ5i0EeDxOgBn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'FleetArtifactSamplingRulesGet' test.out

#- 25 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'hhqElIaDml48wdNF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": true, "percentage": 26}}, "logs": {"crashed": {"collect": false, "percentage": 41}, "success": {"collect": false, "percentage": 39}, "unclaimed": {"collect": true, "percentage": 43}}}' \
    > test.out 2>&1
eval_tap $? 25 'FleetArtifactSamplingRulesSet' test.out

#- 26 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID '9WT0GfH2rtOa4EXs' \
    --namespace "$AB_NAMESPACE" \
    --count '47' \
    --offset '53' \
    --region '1yEkLgh3tIYt4SqY' \
    --serverId 'UTLDx9gIiDandpGT' \
    --sortBy '2t24aOMh5eC3IHeH' \
    --sortDirection 'desc' \
    --status 'draining' \
    > test.out 2>&1
eval_tap $? 26 'FleetServers' test.out

#- 27 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'cYrCEAE7WIsfmx40' \
    --namespace "$AB_NAMESPACE" \
    --count '82' \
    --offset '34' \
    --reason 'LRc6m8heKnWhzfe2' \
    --region 'NubeoKFeIaFQCYoD' \
    --serverId 'PICpnduEEQlULdJz' \
    --sortDirection '4mnRBkMNxvvKgAT8' \
    --status 'mJrYq6hRkloqxM3g' \
    > test.out 2>&1
eval_tap $? 27 'FleetServerHistory' test.out

#- 28 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '31' \
    --inUse 'qC2J9jyEW6GLbc0N' \
    --isProtected  \
    --name 'aKDUL3sa13lk1dQB' \
    --offset '68' \
    --sortBy 'bit0VWn3CO39PXDN' \
    --sortDirection 'xtXgeO3FgkXhjDza' \
    --status 'QY3snn2ZkP7cFdP4' \
    --tag '3e5dC9XIBudfZgrb' \
    --targetArchitecture 'HDIDm4hMzF4Txode' \
    > test.out 2>&1
eval_tap $? 28 'ImageList' test.out

#- 29 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImagesStorage' test.out

#- 30 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'nSrUTvfqU0bfoMm5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'ImageGet' test.out

#- 31 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'cTtFWbotQyXJRcQW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ImageMarkForDeletion' test.out

#- 32 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'smqPNs92epxk0i8V' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["xsZNereSvf9699mC", "EHThUJkETAsSp7gh", "4TeUTkOkAYfJB8AT"], "isProtected": false, "name": "t4Tv207Y2QD3oD5f", "removedTags": ["LCr3OOlXVv8ZGF7u", "YnGzpipNDigNJma1", "MbqqZtfNWql4nmwA"]}' \
    > test.out 2>&1
eval_tap $? 32 'ImagePatch' test.out

#- 33 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'ft4gqkNNlWkD9eOz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'ImageUnmarkForDeletion' test.out

#- 34 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'iYRFOn0jJLHC9Lxh' \
    > test.out 2>&1
eval_tap $? 34 'QoSRegionsGet' test.out

#- 35 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'vNXTwGBCtohLtl9Z' \
    --body '{"status": "uhytm5UDrT6QXCs5"}' \
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
    --serverID 'SPBbRPZTF6oQAXVG' \
    > test.out 2>&1
eval_tap $? 37 'FleetServerInfo' test.out

#- 38 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID '7tnsZg5QgXjvyGJP' \
    > test.out 2>&1
eval_tap $? 38 'FleetServerConnectionInfo' test.out

#- 39 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'N4eXbJE5Vs2Gcyom' \
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
    --fleetID 'QoIXimBJehyxlNsj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "UgxBkF6wFPoJeQed", "sessionId": "iogEhhM2rIizGdKv"}' \
    > test.out 2>&1
eval_tap $? 42 'FleetClaimByID' test.out

#- 43 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'OPdq5xrgxSmy1DN9' \
    > test.out 2>&1
eval_tap $? 43 'LocalWatchdogConnect' test.out

#- 44 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["LFkYW5DQyj4bj5Ro", "2ogaKt2ujQSa3Zdb", "65UXmy0Zp6iIaTIK"], "regions": ["Ukmkk9QM0NBMA9OR", "xpzwLR2AK6eXUGPJ", "sw1fiP80G9Pclxcf"], "sessionId": "t2ulIJzPyrVEiOG4"}' \
    > test.out 2>&1
eval_tap $? 44 'FleetClaimByKeys' test.out

#- 45 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'UcqsuGKHhMRWLVd3' \
    > test.out 2>&1
eval_tap $? 45 'WatchdogConnect' test.out

#- 46 UploadURLGet
./ng net.accelbyte.sdk.cli.Main ams uploadURLGet \
    > test.out 2>&1
eval_tap $? 46 'UploadURLGet' test.out

#- 47 VersionInfo
./ng net.accelbyte.sdk.cli.Main ams versionInfo \
    > test.out 2>&1
eval_tap $? 47 'VersionInfo' test.out

#- 48 BasicHealthCheck
./ng net.accelbyte.sdk.cli.Main ams basicHealthCheck \
    > test.out 2>&1
eval_tap $? 48 'BasicHealthCheck' test.out


rm -f "tmp.dat"

exit $EXIT_CODE