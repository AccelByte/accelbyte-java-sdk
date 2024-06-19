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
echo "1..45"

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

#- 9 ArtifactBulkDelete
./ng net.accelbyte.sdk.cli.Main ams artifactBulkDelete \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'RTcPiSuL0Sly6XM4' \
    --fleetId 'OI18mAQLnzjMf8GZ' \
    --uploadedBefore '1997-12-26' \
    > test.out 2>&1
eval_tap $? 9 'ArtifactBulkDelete' test.out

#- 10 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactUsageGet' test.out

#- 11 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID 'WBZqxYG3aREAu2D6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactDelete' test.out

#- 12 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'QVKNCWP75TB0i7pK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ArtifactGetURL' test.out

#- 13 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '204' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "R8dl0zRVW4EZG9m0", "imageId": "XcgGVbMqSszE8GHa", "name": "vj7AorKsxwkosAVe"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID 'rXpc1C8XfwHuKeb9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID 'l3rGN9A3sNm84hdd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DevelopmentServerConfigurationDelete' test.out

#- 17 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'FleetList' test.out

#- 18 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["pHt0P7MIIR7CkyF6", "C7duuyZ0GhDogqrh", "BRd8lDR6qVNPRZYd"], "dsHostConfiguration": {"instanceId": "FLIAjGGJddVCvu9v", "instanceType": "x5KQ7KYnIuMBvaO3", "serversPerVm": 71}, "imageDeploymentProfile": {"commandLine": "llzQRaT5kPxUfofv", "imageId": "nnSuB0y5WUlrMdI4", "portConfigurations": [{"name": "sNveabntBSxTeIv5", "protocol": "3HGCiljvjKoyD6SC"}, {"name": "wGrncqmLtjQHAf8T", "protocol": "goNm03VLisV6zwPu"}, {"name": "o3td6TC6I3lMjGSW", "protocol": "N2laRlxfcjHfYakU"}], "timeout": {"creation": 59, "drain": 46, "session": 94, "unresponsive": 77}}, "name": "qGkE7wcWfDslpJSq", "onDemand": true, "regions": [{"bufferSize": 55, "maxServerCount": 77, "minServerCount": 85, "region": "Q0yYoNRKd3IL5TAQ"}, {"bufferSize": 68, "maxServerCount": 17, "minServerCount": 86, "region": "iPlSC2uE4o5Vwdo3"}, {"bufferSize": 12, "maxServerCount": 80, "minServerCount": 8, "region": "qHcUmLZZbSqb8RwN"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 60}, "success": {"collect": false, "percentage": 59}}, "logs": {"crashed": {"collect": true, "percentage": 54}, "success": {"collect": false, "percentage": 88}}}}' \
    > test.out 2>&1
eval_tap $? 18 'FleetCreate' test.out

#- 19 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'a2l5BYNtIuS5S5XU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'FleetGet' test.out

#- 20 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'djsoqwGyzzWi9gwQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["v7t1o7TTr1DmrhZv", "15T7quIOvBMcaYmv", "CkGZ5dAgqxpBFmaL"], "dsHostConfiguration": {"instanceId": "oxozr6wfNPX2bOIt", "instanceType": "RMvqtlB2jJCSQT27", "serversPerVm": 3}, "imageDeploymentProfile": {"commandLine": "ZZPYGu0rdlgdWyOt", "imageId": "Xi3choQrpOsDBU5S", "portConfigurations": [{"name": "epjChB3V0v52Dlym", "protocol": "6puQ23xoJ8aeCnaL"}, {"name": "pUKp44YUDjasWIPU", "protocol": "vmEejtGeoyIPa8ZR"}, {"name": "rvjj7il35MXbN9oC", "protocol": "MNqq98SjTvhZNkSQ"}], "timeout": {"creation": 60, "drain": 69, "session": 1, "unresponsive": 40}}, "name": "BXksUC9b6i5lZC9x", "onDemand": true, "regions": [{"bufferSize": 14, "maxServerCount": 2, "minServerCount": 9, "region": "boLQQ1MzH7Qm8bwb"}, {"bufferSize": 25, "maxServerCount": 9, "minServerCount": 13, "region": "NDUPVJf6c2Z0QZxf"}, {"bufferSize": 12, "maxServerCount": 86, "minServerCount": 100, "region": "ubTDIHrvqAThuwjR"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 32}, "success": {"collect": false, "percentage": 74}}, "logs": {"crashed": {"collect": true, "percentage": 74}, "success": {"collect": false, "percentage": 93}}}}' \
    > test.out 2>&1
eval_tap $? 20 'FleetUpdate' test.out

#- 21 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'FoF7VSZ6pf3vneSD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetDelete' test.out

#- 22 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID '2Tb3g7mSQUhAEtrm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetArtifactSamplingRulesGet' test.out

#- 23 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'jqU6YE3p4lSck0ZH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": false, "percentage": 28}, "success": {"collect": true, "percentage": 70}}, "logs": {"crashed": {"collect": true, "percentage": 30}, "success": {"collect": false, "percentage": 57}}}' \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesSet' test.out

#- 24 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'v91GXlvPG6bFYReV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'FleetServers' test.out

#- 25 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'HQipcCx9Zw5D2L7v' \
    --namespace "$AB_NAMESPACE" \
    --count '70' \
    --offset '66' \
    --reason 'YhGGSyEW4ZJJ42d3' \
    --region 'PBddN8S48l9lyNAp' \
    --serverId 'flxqMrj3oZk03QXc' \
    --sortDirection 'KMDYDDxHSZjtqXyJ' \
    --status '58f7Gc26SaiGVkyd' \
    > test.out 2>&1
eval_tap $? 25 'FleetServerHistory' test.out

#- 26 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'ImageList' test.out

#- 27 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'wYWQG26yUZNmTBcv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'ImageGet' test.out

#- 28 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'rbYCwZtxFHyPLtI8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImageMarkForDeletion' test.out

#- 29 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'ilbyDPUIj88cekdq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["Ct81P1ktfIovmv9g", "sR5cJcHm3SZLxoRD", "FuuuySj29a9LJE8H"], "isProtected": false, "name": "oVk8T3GpAnkCmBUq", "removedTags": ["g2SCnqntX9y1aZSW", "MiVi10sG6vxkfUcm", "qRRbceJ5i0EeDxOg"]}' \
    > test.out 2>&1
eval_tap $? 29 'ImagePatch' test.out

#- 30 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'BnhhqElIaDml48wd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'ImageUnmarkForDeletion' test.out

#- 31 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'NFLTm5T50x9WT0Gf' \
    > test.out 2>&1
eval_tap $? 31 'QoSRegionsGet' test.out

#- 32 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'H2rtOa4EXsXzOXQA' \
    --body '{"status": "k4mqrxzTtuLl4Xlb"}' \
    > test.out 2>&1
eval_tap $? 32 'QoSRegionsUpdate' test.out

#- 33 InfoRegions
./ng net.accelbyte.sdk.cli.Main ams infoRegions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'InfoRegions' test.out

#- 34 FleetServerInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'GL8QOxtjzm8y2wNh' \
    > test.out 2>&1
eval_tap $? 34 'FleetServerInfo' test.out

#- 35 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'mwoYZyI4EFZKBcYr' \
    > test.out 2>&1
eval_tap $? 35 'FleetServerConnectionInfo' test.out

#- 36 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'CEAE7WIsfmx40NLR' \
    > test.out 2>&1
eval_tap $? 36 'ServerHistory' test.out

#- 37 InfoSupportedInstances
./ng net.accelbyte.sdk.cli.Main ams infoSupportedInstances \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'InfoSupportedInstances' test.out

#- 38 AccountGet
./ng net.accelbyte.sdk.cli.Main ams accountGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'AccountGet' test.out

#- 39 FleetClaimByID
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByID \
    --fleetID 'c6m8heKnWhzfe2Nu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "beoKFeIaFQCYoDPI", "sessionId": "CpnduEEQlULdJz4m"}' \
    > test.out 2>&1
eval_tap $? 39 'FleetClaimByID' test.out

#- 40 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'nRBkMNxvvKgAT8mJ' \
    > test.out 2>&1
eval_tap $? 40 'LocalWatchdogConnect' test.out

#- 41 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["rYq6hRkloqxM3gpw", "xcfMy9XzjjI5YbsK", "oADkzJEN2VHzih3b"], "regions": ["it0VWn3CO39PXDNx", "tXgeO3FgkXhjDzaQ", "Y3snn2ZkP7cFdP43"], "sessionId": "e5dC9XIBudfZgrbH"}' \
    > test.out 2>&1
eval_tap $? 41 'FleetClaimByKeys' test.out

#- 42 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'DIDm4hMzF4Txoden' \
    > test.out 2>&1
eval_tap $? 42 'WatchdogConnect' test.out

#- 43 UploadURLGet
./ng net.accelbyte.sdk.cli.Main ams uploadURLGet \
    > test.out 2>&1
eval_tap $? 43 'UploadURLGet' test.out

#- 44 Func1
./ng net.accelbyte.sdk.cli.Main ams func1 \
    > test.out 2>&1
eval_tap $? 44 'Func1' test.out

#- 45 BasicHealthCheck
./ng net.accelbyte.sdk.cli.Main ams basicHealthCheck \
    > test.out 2>&1
eval_tap $? 45 'BasicHealthCheck' test.out


rm -f "tmp.dat"

exit $EXIT_CODE