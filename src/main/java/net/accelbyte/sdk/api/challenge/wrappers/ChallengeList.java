/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.challenge.wrappers;

import java.util.*;

import net.accelbyte.sdk.api.challenge.models.*;
import net.accelbyte.sdk.api.challenge.operations.challenge_list.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class ChallengeList {

    private AccelByteSDK sdk;

    public ChallengeList(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    /**
     * @see GetChallenges
     */
    public ModelListChallengeResponse getChallenges(GetChallenges input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see PublicGetScheduledGoals
     */
    public List<ModelGoalResponse> publicGetScheduledGoals(PublicGetScheduledGoals input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}
