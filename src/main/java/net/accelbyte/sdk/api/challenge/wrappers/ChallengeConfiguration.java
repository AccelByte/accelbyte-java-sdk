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
import net.accelbyte.sdk.api.challenge.operations.challenge_configuration.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class ChallengeConfiguration {

    private AccelByteSDK sdk;

    public ChallengeConfiguration(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    /**
     * @see AdminGetChallenges
     */
    public ModelListChallengeResponse adminGetChallenges(AdminGetChallenges input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminCreateChallenge
     */
    public ModelChallengeResponse adminCreateChallenge(AdminCreateChallenge input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminGetChallenge
     */
    public ModelChallengeResponse adminGetChallenge(AdminGetChallenge input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminUpdateChallenge
     */
    public ModelChallengeResponse adminUpdateChallenge(AdminUpdateChallenge input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminDeleteChallenge
     */
    public void adminDeleteChallenge(AdminDeleteChallenge input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        input
            .handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminGetPeriods
     */
    public ModelListPeriodsResponse adminGetPeriods(AdminGetPeriods input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminRandomizeChallenge
     */
    public List<ModelSchedule> adminRandomizeChallenge(AdminRandomizeChallenge input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}
