/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.challenge.wrappers;


import net.accelbyte.sdk.api.challenge.models.*;
import net.accelbyte.sdk.api.challenge.operations.challenge_progression.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class ChallengeProgression {

    private AccelByteSDK sdk;

    public ChallengeProgression(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    /**
     * @see AdminEvaluateProgress
     */
    public void adminEvaluateProgress(AdminEvaluateProgress input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        input
            .handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see EvaluateMyProgress
     */
    public void evaluateMyProgress(EvaluateMyProgress input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        input
            .handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see PublicGetUserProgression
     */
    public ModelUserProgressionResponse publicGetUserProgression(PublicGetUserProgression input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}
