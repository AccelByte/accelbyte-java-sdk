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
echo "1..21"

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
    --after '9n7INxNW' \
    --before 'drgXRWty' \
    --limit '71' \
    --offset '3' \
    --requestDate 'bGAGb3Or' \
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
    --body '["SFwT8qKY", "H1Z4r7cA", "O6l71kHW"]' \
    > test.out 2>&1
eval_tap $? 4 'UpdateAdminEmailConfiguration' test.out

#- 5 SaveAdminEmailConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr saveAdminEmailConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '["7Uq8i01J", "JdrpSD8M", "dQugGVcF"]' \
    > test.out 2>&1
eval_tap $? 5 'SaveAdminEmailConfiguration' test.out

#- 6 DeleteAdminEmailConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr deleteAdminEmailConfiguration \
    --namespace "$AB_NAMESPACE" \
    --emails '9nF0di3b,xT9103je,PdRlhH51' \
    > test.out 2>&1
eval_tap $? 6 'DeleteAdminEmailConfiguration' test.out

#- 7 AdminGetListPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminGetListPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '38' \
    --requestDate '41DsMwCH' \
    > test.out 2>&1
eval_tap $? 7 'AdminGetListPersonalDataRequest' test.out

#- 8 AdminGetUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminGetUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'a4SrjD9L' \
    > test.out 2>&1
eval_tap $? 8 'AdminGetUserAccountDeletionRequest' test.out

#- 9 AdminSubmitUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminSubmitUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId '0Dlh1un5' \
    > test.out 2>&1
eval_tap $? 9 'AdminSubmitUserAccountDeletionRequest' test.out

#- 10 AdminCancelUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminCancelUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'mxrL9dp6' \
    > test.out 2>&1
eval_tap $? 10 'AdminCancelUserAccountDeletionRequest' test.out

#- 11 AdminGetUserPersonalDataRequests
./ng net.accelbyte.sdk.cli.Main gdpr adminGetUserPersonalDataRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'iMh7un5c' \
    --limit '72' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 11 'AdminGetUserPersonalDataRequests' test.out

#- 12 AdminRequestDataRetrieval
./ng net.accelbyte.sdk.cli.Main gdpr adminRequestDataRetrieval \
    --namespace "$AB_NAMESPACE" \
    --userId 'hDDiivHg' \
    --password 'k3x6dHFz' \
    > test.out 2>&1
eval_tap $? 12 'AdminRequestDataRetrieval' test.out

#- 13 AdminCancelUserPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminCancelUserPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'OunHOhZJ' \
    --userId 'mom6spRl' \
    > test.out 2>&1
eval_tap $? 13 'AdminCancelUserPersonalDataRequest' test.out

#- 14 AdminGeneratePersonalDataURL
./ng net.accelbyte.sdk.cli.Main gdpr adminGeneratePersonalDataURL \
    --namespace "$AB_NAMESPACE" \
    --requestDate '7ShZmzKV' \
    --userId 'rm3rbgYV' \
    --password 'fhcCsYs2' \
    > test.out 2>&1
eval_tap $? 14 'AdminGeneratePersonalDataURL' test.out

#- 15 PublicSubmitUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicSubmitUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'fccPQDNl' \
    --password 'riTXcBK5' \
    > test.out 2>&1
eval_tap $? 15 'PublicSubmitUserAccountDeletionRequest' test.out

#- 16 PublicCancelUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicCancelUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId '4QeTZBC7' \
    > test.out 2>&1
eval_tap $? 16 'PublicCancelUserAccountDeletionRequest' test.out

#- 17 PublicGetUserAccountDeletionStatus
./ng net.accelbyte.sdk.cli.Main gdpr publicGetUserAccountDeletionStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 's5HC5jKu' \
    > test.out 2>&1
eval_tap $? 17 'PublicGetUserAccountDeletionStatus' test.out

#- 18 PublicGetUserPersonalDataRequests
./ng net.accelbyte.sdk.cli.Main gdpr publicGetUserPersonalDataRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'PVCmbOG8' \
    --limit '87' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetUserPersonalDataRequests' test.out

#- 19 PublicRequestDataRetrieval
./ng net.accelbyte.sdk.cli.Main gdpr publicRequestDataRetrieval \
    --namespace "$AB_NAMESPACE" \
    --userId 'V08MIxYr' \
    --password 'dbEBckEP' \
    > test.out 2>&1
eval_tap $? 19 'PublicRequestDataRetrieval' test.out

#- 20 PublicCancelUserPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicCancelUserPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'y1teeKlA' \
    --userId 'x49PN29g' \
    > test.out 2>&1
eval_tap $? 20 'PublicCancelUserPersonalDataRequest' test.out

#- 21 PublicGeneratePersonalDataURL
./ng net.accelbyte.sdk.cli.Main gdpr publicGeneratePersonalDataURL \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'luC7A2lL' \
    --userId 'Z87uXAmO' \
    --password 'lnu5NmsW' \
    > test.out 2>&1
eval_tap $? 21 'PublicGeneratePersonalDataURL' test.out


rm -f "tmp.dat"

exit $EXIT_CODE