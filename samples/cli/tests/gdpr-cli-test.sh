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
echo "1..43"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminGetListDeletionDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminGetListDeletionDataRequest \
    --namespace "$AB_NAMESPACE" \
    --after 'EAxcVpFrttufHIRd' \
    --before 'H9UzVRiXbqlAw7r6' \
    --limit '100' \
    --offset '9' \
    --requestDate 'ktQG0h5JAav5kRa6' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetListDeletionDataRequest' test.out

#- 3 GetAdminEmailConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr getAdminEmailConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 3 'GetAdminEmailConfiguration' test.out

#- 4 UpdateAdminEmailConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr updateAdminEmailConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '["2WopBJHPtcDs8bBZ", "LCXLx8bbgorQeFbQ", "1g7qbPngUNB1vRod"]' \
    > test.out 2>&1
eval_tap $? 4 'UpdateAdminEmailConfiguration' test.out

#- 5 SaveAdminEmailConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr saveAdminEmailConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '["wpzS6DaDpv8N7ZQV", "qGj6oDLjWjkY1aXl", "FcDtgOjchIua5tWE"]' \
    > test.out 2>&1
eval_tap $? 5 'SaveAdminEmailConfiguration' test.out

#- 6 DeleteAdminEmailConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr deleteAdminEmailConfiguration \
    --namespace "$AB_NAMESPACE" \
    --emails 'IC32ogW7olvbTgrh,RTcPiSuL0Sly6XM4,OI18mAQLnzjMf8GZ' \
    > test.out 2>&1
eval_tap $? 6 'DeleteAdminEmailConfiguration' test.out

#- 7 AdminGetPlatformAccountClosureClients
./ng net.accelbyte.sdk.cli.Main gdpr adminGetPlatformAccountClosureClients \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminGetPlatformAccountClosureClients' test.out

#- 8 AdminValidateXboxBPCertFile
./ng net.accelbyte.sdk.cli.Main gdpr adminValidateXboxBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --body '{"bpCert": "2WBZqxYG3aREAu2D", "password": "6QVKNCWP75TB0i7p"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminValidateXboxBPCertFile' test.out

#- 9 AdminGetPlatformAccountClosureClient
./ng net.accelbyte.sdk.cli.Main gdpr adminGetPlatformAccountClosureClient \
    --namespace "$AB_NAMESPACE" \
    --platform 'KxR8dl0zRVW4EZG9' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetPlatformAccountClosureClient' test.out

#- 10 AdminUpdatePlatformAccountClosureClient
./ng net.accelbyte.sdk.cli.Main gdpr adminUpdatePlatformAccountClosureClient \
    --namespace "$AB_NAMESPACE" \
    --platform 'm0XcgGVbMqSszE8G' \
    --body '{"bpCert": "Havj7AorKsxwkosA", "bpCertFileName": "VerXpc1C8XfwHuKe", "clientId": "b9l3rGN9A3sNm84h", "password": "ddSpHt0P7MIIR7Ck", "publisherKey": "yF6C7duuyZ0GhDog", "sandboxId": "qrhBRd8lDR6qVNPR", "secret": "ZYdFLIAjGGJddVCv"}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdatePlatformAccountClosureClient' test.out

#- 11 AdminDeletePlatformAccountClosureClient
./ng net.accelbyte.sdk.cli.Main gdpr adminDeletePlatformAccountClosureClient \
    --namespace "$AB_NAMESPACE" \
    --platform 'u9vx5KQ7KYnIuMBv' \
    > test.out 2>&1
eval_tap $? 11 'AdminDeletePlatformAccountClosureClient' test.out

#- 12 AdminMockPlatformAccountClosureData
./ng net.accelbyte.sdk.cli.Main gdpr adminMockPlatformAccountClosureData \
    --namespace "$AB_NAMESPACE" \
    --platform 'aO35llzQRaT5kPxU' \
    --body '{"platformUserId": "fofvnnSuB0y5WUlr", "sandbox": "MdI4sNveabntBSxT", "startImmediately": false}' \
    > test.out 2>&1
eval_tap $? 12 'AdminMockPlatformAccountClosureData' test.out

#- 13 AdminGetListPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminGetListPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '70' \
    --requestDate 'gghGoYupD391C2qt' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetListPersonalDataRequest' test.out

#- 14 AdminGetServicesConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr adminGetServicesConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminGetServicesConfiguration' test.out

#- 15 AdminUpdateServicesConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr adminUpdateServicesConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"services": [{"extendConfig": {"appName": "PYokahFjkQsfCaTm", "namespace": "t1d67FXGk2s9Q0mP"}, "id": "Vo3twu0MesTCf9x4", "package": "rt69lna7qxNeIxPz", "serviceConfig": {"protocol": "EVENT", "skipAck": false, "url": "CTqGkE7wcWfDslpJ"}, "type": "SERVICE"}, {"extendConfig": {"appName": "ytLPziZMdjxcBZuf", "namespace": "QxGiHPllG4cYEzfT"}, "id": "D1ZBm3MqHcUmLZZb", "package": "Sqb8RwNmn9HrNQy4", "serviceConfig": {"protocol": "GRPC", "skipAck": true, "url": "AAiE0mit9RGCCHYz"}, "type": "SERVICE"}, {"extendConfig": {"appName": "OcEdscKHPEqgA8yu", "namespace": "7Vk6Jt4Ymos9Jcdo"}, "id": "s4fYcTVU6RBt0zYo", "package": "McHyCUEXlAvxJMda", "serviceConfig": {"protocol": "EVENT", "skipAck": true, "url": "wfNPX2bOItRMvqtl"}, "type": "SERVICE"}]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminUpdateServicesConfiguration' test.out

#- 16 AdminResetServicesConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr adminResetServicesConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminResetServicesConfiguration' test.out

#- 17 AdminGetPlatformAccountClosureServicesConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr adminGetPlatformAccountClosureServicesConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetPlatformAccountClosureServicesConfiguration' test.out

#- 18 AdminUpdatePlatformAccountClosureServicesConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr adminUpdatePlatformAccountClosureServicesConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"services": [{"extendConfig": {"appName": "VHh2EI8JlDbPWbQ6", "namespace": "Q9lNmqRBaAkLnvxk"}, "id": "T1X68cmDc3fxU8My", "package": "KrQpM4hkkK6KKXNB", "serviceConfig": {"protocol": "GRPC", "skipAck": false, "url": "v0IqmF51TkhjYnaq"}, "type": "SERVICE"}, {"extendConfig": {"appName": "foWvXa3bMrXsDr6k", "namespace": "ILsSSyDdmykmoPYg"}, "id": "c2L4jk4Lo0LSP0pf", "package": "4IxjUkl535X3ateE", "serviceConfig": {"protocol": "GRPC", "skipAck": true, "url": "UC9b6i5lZC9xv32e"}, "type": "EXTEND"}, {"extendConfig": {"appName": "c5csSovoqsZNBdte", "namespace": "9NDUPVJf6c2Z0QZx"}, "id": "fgPubTDIHrvqAThu", "package": "wjRHpKKTlmVr9Xuo", "serviceConfig": {"protocol": "EVENT", "skipAck": false, "url": "3vneSD2Tb3g7mSQU"}, "type": "EXTEND"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdatePlatformAccountClosureServicesConfiguration' test.out

#- 19 AdminResetPlatformAccountClosureServicesConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr adminResetPlatformAccountClosureServicesConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'AdminResetPlatformAccountClosureServicesConfiguration' test.out

#- 20 AdminGetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main gdpr adminGetUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '54' \
    --platform 'QRENjEEztx1WsYSi' \
    --userId 'Zqan0nSBJroav91G' \
    > test.out 2>&1
eval_tap $? 20 'AdminGetUserPlatformAccountClosureHistories' test.out

#- 21 AdminGetUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminGetUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'XlvPG6bFYReVHQip' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetUserAccountDeletionRequest' test.out

#- 22 AdminSubmitUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminSubmitUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'cCx9Zw5D2L7vIYhG' \
    > test.out 2>&1
eval_tap $? 22 'AdminSubmitUserAccountDeletionRequest' test.out

#- 23 AdminCancelUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminCancelUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'GSyEW4ZJJ42d3PBd' \
    > test.out 2>&1
eval_tap $? 23 'AdminCancelUserAccountDeletionRequest' test.out

#- 24 AdminGetUserPersonalDataRequests
./ng net.accelbyte.sdk.cli.Main gdpr adminGetUserPersonalDataRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'dN8S48l9lyNApflx' \
    --limit '33' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 24 'AdminGetUserPersonalDataRequests' test.out

#- 25 AdminRequestDataRetrieval
./ng net.accelbyte.sdk.cli.Main gdpr adminRequestDataRetrieval \
    --namespace "$AB_NAMESPACE" \
    --userId 'rQvGgbLdLsFzHkBM' \
    --password 'r1yrOMlNFSrUEirn' \
    > test.out 2>&1
eval_tap $? 25 'AdminRequestDataRetrieval' test.out

#- 26 AdminCancelUserPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminCancelUserPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'jX9fDmIbeZxzfTcy' \
    --userId 'iuATus9hsfpFDcSD' \
    > test.out 2>&1
eval_tap $? 26 'AdminCancelUserPersonalDataRequest' test.out

#- 27 AdminGeneratePersonalDataURL
./ng net.accelbyte.sdk.cli.Main gdpr adminGeneratePersonalDataURL \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'G8aMVGLiBNrDjqox' \
    --userId 'cwgGLXpUL4pp2ncY' \
    --password 'AHdNzDmeIP6rOvDz' \
    > test.out 2>&1
eval_tap $? 27 'AdminGeneratePersonalDataURL' test.out

#- 28 PublicSubmitUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicSubmitUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId '9KOsb392k6YmJFfR' \
    --languageTag 'ByjlBiuFM3FIoVk8' \
    --password 'T3GpAnkCmBUqg2SC' \
    > test.out 2>&1
eval_tap $? 28 'PublicSubmitUserAccountDeletionRequest' test.out

#- 29 PublicCancelUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicCancelUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'nqntX9y1aZSWMiVi' \
    > test.out 2>&1
eval_tap $? 29 'PublicCancelUserAccountDeletionRequest' test.out

#- 30 PublicGetUserAccountDeletionStatus
./ng net.accelbyte.sdk.cli.Main gdpr publicGetUserAccountDeletionStatus \
    --namespace "$AB_NAMESPACE" \
    --userId '10sG6vxkfUcmqRRb' \
    > test.out 2>&1
eval_tap $? 30 'PublicGetUserAccountDeletionStatus' test.out

#- 31 PublicGetUserPersonalDataRequests
./ng net.accelbyte.sdk.cli.Main gdpr publicGetUserPersonalDataRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'ceJ5i0EeDxOgBnhh' \
    --limit '33' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 31 'PublicGetUserPersonalDataRequests' test.out

#- 32 PublicRequestDataRetrieval
./ng net.accelbyte.sdk.cli.Main gdpr publicRequestDataRetrieval \
    --namespace "$AB_NAMESPACE" \
    --userId 'WEi8KlloeH0JT1yd' \
    --languageTag 'uat2vQR3biBfsu4j' \
    --password 'msRE2w1yEkLgh3tI' \
    > test.out 2>&1
eval_tap $? 32 'PublicRequestDataRetrieval' test.out

#- 33 PublicCancelUserPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicCancelUserPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'Yt4SqYUTLDx9gIiD' \
    --userId 'andpGT2t24aOMh5e' \
    > test.out 2>&1
eval_tap $? 33 'PublicCancelUserPersonalDataRequest' test.out

#- 34 PublicGeneratePersonalDataURL
./ng net.accelbyte.sdk.cli.Main gdpr publicGeneratePersonalDataURL \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'C3IHeHSKLCa3xreN' \
    --userId 'DUWehwH3q31A806D' \
    --password 'Jgas4b6z3LNUj7fd' \
    > test.out 2>&1
eval_tap $? 34 'PublicGeneratePersonalDataURL' test.out

#- 35 PublicSubmitMyAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicSubmitMyAccountDeletionRequest \
    --platformId 'gLA84Z8YYk6QEgJj' \
    --platformToken 'BbEDoNf3n0hEoRCA' \
    > test.out 2>&1
eval_tap $? 35 'PublicSubmitMyAccountDeletionRequest' test.out

#- 36 PublicCancelMyAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicCancelMyAccountDeletionRequest \
    > test.out 2>&1
eval_tap $? 36 'PublicCancelMyAccountDeletionRequest' test.out

#- 37 PublicGetMyAccountDeletionStatus
./ng net.accelbyte.sdk.cli.Main gdpr publicGetMyAccountDeletionStatus \
    > test.out 2>&1
eval_tap $? 37 'PublicGetMyAccountDeletionStatus' test.out

#- 38 S2SGetListFinishedAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr s2sGetListFinishedAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --end 'cf80zfFyabWAgIUX' \
    --start 'iI07A68eaqC2J9jy' \
    > test.out 2>&1
eval_tap $? 38 'S2SGetListFinishedAccountDeletionRequest' test.out

#- 39 S2SGetListFinishedPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr s2sGetListFinishedPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --end 'EW6GLbc0NaKDUL3s' \
    --start 'a13lk1dQBHO86IlB' \
    > test.out 2>&1
eval_tap $? 39 'S2SGetListFinishedPersonalDataRequest' test.out

#- 40 S2SGetDataRequestByRequestID
./ng net.accelbyte.sdk.cli.Main gdpr s2sGetDataRequestByRequestID \
    --namespace "$AB_NAMESPACE" \
    --requestId 'hnetU4RwTqUXlTDB' \
    > test.out 2>&1
eval_tap $? 40 'S2SGetDataRequestByRequestID' test.out

#- 41 S2SSubmitUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr s2sSubmitUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'zOuYsaZA2yyd4mbq' \
    > test.out 2>&1
eval_tap $? 41 'S2SSubmitUserAccountDeletionRequest' test.out

#- 42 S2SRequestDataRetrieval
./ng net.accelbyte.sdk.cli.Main gdpr s2sRequestDataRetrieval \
    --namespace "$AB_NAMESPACE" \
    --userId 'oOfADMMAXFaY9eKa' \
    > test.out 2>&1
eval_tap $? 42 'S2SRequestDataRetrieval' test.out

#- 43 S2SGeneratePersonalDataURL
./ng net.accelbyte.sdk.cli.Main gdpr s2sGeneratePersonalDataURL \
    --namespace "$AB_NAMESPACE" \
    --requestDate '699bRVhyaKwwrAP2' \
    --userId 'aMlu7WtjCtoYetOO' \
    > test.out 2>&1
eval_tap $? 43 'S2SGeneratePersonalDataURL' test.out


rm -f "tmp.dat"

exit $EXIT_CODE