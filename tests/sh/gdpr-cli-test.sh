#!/usr/bin/env bash

# Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

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

CLI_JAR="${CLI_JAR:-../../samples/cli/build/libs/cli.jar}"

echo "TAP version 13"
echo "1..21"

#- 1 Login
java -jar "${CLI_JAR}" loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminGetListDeletionDataRequest
java -jar "${CLI_JAR}" gdpr adminGetListDeletionDataRequest \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 2 'AdminGetListDeletionDataRequest' test.out

#- 3 GetAdminEmailConfiguration
java -jar "${CLI_JAR}" gdpr getAdminEmailConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 3 'GetAdminEmailConfiguration' test.out

#- 4 UpdateAdminEmailConfiguration
java -jar "${CLI_JAR}" gdpr updateAdminEmailConfiguration \
    --body '["FtBxyZcD"]' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'UpdateAdminEmailConfiguration' test.out

#- 5 SaveAdminEmailConfiguration
java -jar "${CLI_JAR}" gdpr saveAdminEmailConfiguration \
    --body '["XBpGlsQu"]' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SaveAdminEmailConfiguration' test.out

#- 6 DeleteAdminEmailConfiguration
java -jar "${CLI_JAR}" gdpr deleteAdminEmailConfiguration \
    --namespace "$AB_NAMESPACE" \
    --emails '["Ju8vMf0I"]' \
    > test.out 2>&1
eval_tap $? 6 'DeleteAdminEmailConfiguration' test.out

#- 7 AdminGetListPersonalDataRequest
java -jar "${CLI_JAR}" gdpr adminGetListPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminGetListPersonalDataRequest' test.out

#- 8 AdminGetUserAccountDeletionRequest
java -jar "${CLI_JAR}" gdpr adminGetUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'sJkTrd8I' \
    > test.out 2>&1
eval_tap $? 8 'AdminGetUserAccountDeletionRequest' test.out

#- 9 AdminSubmitUserAccountDeletionRequest
java -jar "${CLI_JAR}" gdpr adminSubmitUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'DcV2zXnT' \
    > test.out 2>&1
eval_tap $? 9 'AdminSubmitUserAccountDeletionRequest' test.out

#- 10 AdminCancelUserAccountDeletionRequest
java -jar "${CLI_JAR}" gdpr adminCancelUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'KjXY1bPq' \
    > test.out 2>&1
eval_tap $? 10 'AdminCancelUserAccountDeletionRequest' test.out

#- 11 AdminGetUserPersonalDataRequests
java -jar "${CLI_JAR}" gdpr adminGetUserPersonalDataRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'amiBxx9C' \
    > test.out 2>&1
eval_tap $? 11 'AdminGetUserPersonalDataRequests' test.out

#- 12 AdminRequestDataRetrieval
java -jar "${CLI_JAR}" gdpr adminRequestDataRetrieval \
    --namespace "$AB_NAMESPACE" \
    --userId 's18EY84e' \
    > test.out 2>&1
eval_tap $? 12 'AdminRequestDataRetrieval' test.out

#- 13 AdminCancelUserPersonalDataRequest
java -jar "${CLI_JAR}" gdpr adminCancelUserPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'kItqRzHU' \
    --userId '1oh570KQ' \
    > test.out 2>&1
eval_tap $? 13 'AdminCancelUserPersonalDataRequest' test.out

#- 14 AdminGeneratePersonalDataURL
java -jar "${CLI_JAR}" gdpr adminGeneratePersonalDataURL \
    --password 'BVaewc72' \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'krSha68n' \
    --userId '3Ynozp1C' \
    > test.out 2>&1
eval_tap $? 14 'AdminGeneratePersonalDataURL' test.out

#- 15 PublicSubmitUserAccountDeletionRequest
java -jar "${CLI_JAR}" gdpr publicSubmitUserAccountDeletionRequest \
    --password '2KmIQTuB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dNEUsxFb' \
    > test.out 2>&1
eval_tap $? 15 'PublicSubmitUserAccountDeletionRequest' test.out

#- 16 PublicCancelUserAccountDeletionRequest
java -jar "${CLI_JAR}" gdpr publicCancelUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId '8CJ17M7D' \
    > test.out 2>&1
eval_tap $? 16 'PublicCancelUserAccountDeletionRequest' test.out

#- 17 PublicGetUserAccountDeletionStatus
java -jar "${CLI_JAR}" gdpr publicGetUserAccountDeletionStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'JZaMSxEC' \
    > test.out 2>&1
eval_tap $? 17 'PublicGetUserAccountDeletionStatus' test.out

#- 18 PublicGetUserPersonalDataRequests
java -jar "${CLI_JAR}" gdpr publicGetUserPersonalDataRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'bZbygyoa' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetUserPersonalDataRequests' test.out

#- 19 PublicRequestDataRetrieval
java -jar "${CLI_JAR}" gdpr publicRequestDataRetrieval \
    --password 'rORoeNHS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'b8Rh3kgs' \
    > test.out 2>&1
eval_tap $? 19 'PublicRequestDataRetrieval' test.out

#- 20 PublicCancelUserPersonalDataRequest
java -jar "${CLI_JAR}" gdpr publicCancelUserPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --requestDate '9qqJbnQs' \
    --userId 'oBgiVpP8' \
    > test.out 2>&1
eval_tap $? 20 'PublicCancelUserPersonalDataRequest' test.out

#- 21 PublicGeneratePersonalDataURL
java -jar "${CLI_JAR}" gdpr publicGeneratePersonalDataURL \
    --password 'Cm3yvASU' \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'oxdxxFqm' \
    --userId 'AGTJ8IEd' \
    > test.out 2>&1
eval_tap $? 21 'PublicGeneratePersonalDataURL' test.out


rm -f "tmp.dat"

exit $EXIT_CODE