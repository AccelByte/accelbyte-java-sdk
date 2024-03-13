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
echo "1..38"

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

#- 12 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'FleetList' test.out

#- 13 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["WBZqxYG3aREAu2D6", "QVKNCWP75TB0i7pK", "xR8dl0zRVW4EZG9m"], "dsHostConfiguration": {"instanceId": "0XcgGVbMqSszE8GH", "instanceType": "avj7AorKsxwkosAV", "serversPerVm": 10}, "imageDeploymentProfile": {"commandLine": "ecdKi5r6QEa1ysLE", "imageId": "zth6mXhzkzWkFeZS", "portConfigurations": [{"name": "oEAcBdW19m4eu6d5", "protocol": "tA5jUmiTqpyhPFdx"}, {"name": "LzFQN05MYzYiKWe5", "protocol": "dNRljv7IPrDQQRga"}, {"name": "t0SevkLGMS0lyuI9", "protocol": "a2I9u6Vpbsx5w8hq"}], "timeout": {"creation": 96, "drain": 10, "session": 71, "unresponsive": 45}}, "name": "06UpOXGSLmCVuHOP", "regions": [{"bufferSize": 23, "maxServerCount": 37, "minServerCount": 78, "region": "NveabntBSxTeIv53"}, {"bufferSize": 68, "maxServerCount": 30, "minServerCount": 66, "region": "YupD391C2qtPYoka"}, {"bufferSize": 16, "maxServerCount": 27, "minServerCount": 64, "region": "cqmLtjQHAf8TgoNm"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 98}, "success": {"collect": true, "percentage": 17}}, "logs": {"crashed": {"collect": true, "percentage": 88}, "success": {"collect": false, "percentage": 53}}}}' \
    > test.out 2>&1
eval_tap $? 13 'FleetCreate' test.out

#- 14 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'PVo3twu0MesTCf9x' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'FleetGet' test.out

#- 15 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID '4rt69lna7qxNeIxP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["akUCTqGkE7wcWfDs", "lpJSqGAXQ0yYoNRK", "d3IL5TAQ6iiPlSC2"], "dsHostConfiguration": {"instanceId": "uE4o5Vwdo3fePqIJ", "instanceType": "A8IHtrkmu0hpDDWV", "serversPerVm": 54}, "imageDeploymentProfile": {"commandLine": "NQy4uZAAiE0mit9R", "imageId": "GCCHYzUOcEdscKHP", "portConfigurations": [{"name": "EqgA8yu7Vk6Jt4Ym", "protocol": "os9Jcdos4fYcTVU6"}, {"name": "RBt0zYoMcHyCUEXl", "protocol": "AvxJMdalwSyliWMN"}, {"name": "W5NyLu0M3VHh2EI8", "protocol": "JlDbPWbQ6Q9lNmqR"}], "timeout": {"creation": 56, "drain": 51, "session": 1, "unresponsive": 82}}, "name": "AkLnvxkT1X68cmDc", "regions": [{"bufferSize": 92, "maxServerCount": 11, "minServerCount": 9, "region": "xU8MyKrQpM4hkkK6"}, {"bufferSize": 75, "maxServerCount": 31, "minServerCount": 75, "region": "uQ23xoJ8aeCnaLpU"}, {"bufferSize": 74, "maxServerCount": 19, "minServerCount": 32, "region": "Ynaq6foWvXa3bMrX"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 18}, "success": {"collect": true, "percentage": 40}}, "logs": {"crashed": {"collect": true, "percentage": 66}, "success": {"collect": false, "percentage": 22}}}}' \
    > test.out 2>&1
eval_tap $? 15 'FleetUpdate' test.out

#- 16 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'oyIPa8ZRrvjj7il3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'FleetDelete' test.out

#- 17 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID '5MXbN9oCMNqq98Sj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'FleetArtifactSamplingRulesGet' test.out

#- 18 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'TvhZNkSQ70D0H6BX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": false, "percentage": 75}, "success": {"collect": true, "percentage": 60}}, "logs": {"crashed": {"collect": false, "percentage": 58}, "success": {"collect": true, "percentage": 61}}}' \
    > test.out 2>&1
eval_tap $? 18 'FleetArtifactSamplingRulesSet' test.out

#- 19 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'b6i5lZC9xv32e8c5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'FleetServers' test.out

#- 20 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'csSovoqsZNBdte9N' \
    --namespace "$AB_NAMESPACE" \
    --count '60' \
    --offset '55' \
    --reason 'UPVJf6c2Z0QZxfgP' \
    --region 'ubTDIHrvqAThuwjR' \
    --serverId 'HpKKTlmVr9XuoJbR' \
    --sortDirection 'FQSKVPHbn4Xxtu7L' \
    --status 'QRENjEEztx1WsYSi' \
    > test.out 2>&1
eval_tap $? 20 'FleetServerHistory' test.out

#- 21 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'ImageList' test.out

#- 22 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'Zqan0nSBJroav91G' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'ImageGet' test.out

#- 23 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'XlvPG6bFYReVHQip' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["cCx9Zw5D2L7vIYhG", "GSyEW4ZJJ42d3PBd", "dN8S48l9lyNApflx"], "isProtected": true, "name": "ZrQvGgbLdLsFzHkB", "removedTags": ["Mr1yrOMlNFSrUEir", "njX9fDmIbeZxzfTc", "yiuATus9hsfpFDcS"]}' \
    > test.out 2>&1
eval_tap $? 23 'ImagePatch' test.out

#- 24 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'DG8aMVGLiBNrDjqo' \
    > test.out 2>&1
eval_tap $? 24 'QoSRegionsGet' test.out

#- 25 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'xcwgGLXpUL4pp2nc' \
    --body '{"status": "YAHdNzDmeIP6rOvD"}' \
    > test.out 2>&1
eval_tap $? 25 'QoSRegionsUpdate' test.out

#- 26 InfoRegions
./ng net.accelbyte.sdk.cli.Main ams infoRegions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'InfoRegions' test.out

#- 27 FleetServerInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'z9KOsb392k6YmJFf' \
    > test.out 2>&1
eval_tap $? 27 'FleetServerInfo' test.out

#- 28 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'RByjlBiuFM3FIoVk' \
    > test.out 2>&1
eval_tap $? 28 'FleetServerConnectionInfo' test.out

#- 29 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID '8T3GpAnkCmBUqg2S' \
    > test.out 2>&1
eval_tap $? 29 'ServerHistory' test.out

#- 30 InfoSupportedInstances
./ng net.accelbyte.sdk.cli.Main ams infoSupportedInstances \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'InfoSupportedInstances' test.out

#- 31 AccountGet
./ng net.accelbyte.sdk.cli.Main ams accountGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'AccountGet' test.out

#- 32 FleetClaimByID
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByID \
    --fleetID 'CnqntX9y1aZSWMiV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "i10sG6vxkfUcmqRR", "sessionId": "bceJ5i0EeDxOgBnh"}' \
    > test.out 2>&1
eval_tap $? 32 'FleetClaimByID' test.out

#- 33 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'hqElIaDml48wdNFL' \
    > test.out 2>&1
eval_tap $? 33 'LocalWatchdogConnect' test.out

#- 34 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["Tm5T50x9WT0GfH2r", "tOa4EXsXzOXQAk4m", "qrxzTtuLl4XlbGL8"], "regions": ["QOxtjzm8y2wNhmwo", "YZyI4EFZKBcYrCEA", "E7WIsfmx40NLRc6m"], "sessionId": "8heKnWhzfe2Nubeo"}' \
    > test.out 2>&1
eval_tap $? 34 'FleetClaimByKeys' test.out

#- 35 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'KFeIaFQCYoDPICpn' \
    > test.out 2>&1
eval_tap $? 35 'WatchdogConnect' test.out

#- 36 UploadURLGet
./ng net.accelbyte.sdk.cli.Main ams uploadURLGet \
    > test.out 2>&1
eval_tap $? 36 'UploadURLGet' test.out

#- 37 Func1
./ng net.accelbyte.sdk.cli.Main ams func1 \
    > test.out 2>&1
eval_tap $? 37 'Func1' test.out

#- 38 BasicHealthCheck
./ng net.accelbyte.sdk.cli.Main ams basicHealthCheck \
    > test.out 2>&1
eval_tap $? 38 'BasicHealthCheck' test.out


rm -f "tmp.dat"

exit $EXIT_CODE