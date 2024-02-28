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
import net.accelbyte.sdk.api.challenge.operations.player_reward.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PlayerReward {

    private AccelByteSDK sdk;

    public PlayerReward(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    /**
     * @see AdminGetUserRewards
     */
    public ModelListUserRewardsResponse adminGetUserRewards(AdminGetUserRewards input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see PublicGetUserRewards
     */
    public ModelListUserRewardsResponse publicGetUserRewards(PublicGetUserRewards input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see PublicClaimUserRewards
     */
    public List<ModelUserReward> publicClaimUserRewards(PublicClaimUserRewards input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}
