/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.challenge.wrappers;


import net.accelbyte.sdk.api.challenge.models.*;
import net.accelbyte.sdk.api.challenge.operations.goal_configuration.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class GoalConfiguration {

    private AccelByteSDK sdk;

    public GoalConfiguration(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    /**
     * @see AdminGetGoals
     */
    public ModelGetGoalsResponse adminGetGoals(AdminGetGoals input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminCreateGoal
     */
    public ModelGoalResponse adminCreateGoal(AdminCreateGoal input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminGetGoal
     */
    public ModelGoalResponse adminGetGoal(AdminGetGoal input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminUpdateGoals
     */
    public ModelGoalResponse adminUpdateGoals(AdminUpdateGoals input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminDeleteGoal
     */
    public void adminDeleteGoal(AdminDeleteGoal input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        input
            .handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}
