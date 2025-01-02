/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.challenge.wrappers;

import net.accelbyte.sdk.api.challenge.models.*;
import net.accelbyte.sdk.api.challenge.operations.schedules.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Schedules {

  private AccelByteSDK sdk;

  public Schedules(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminListSchedulesByGoal
   */
  public ModelListScheduleByGoalResponse adminListSchedulesByGoal(AdminListSchedulesByGoal input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminListSchedules
   */
  public ModelListSchedulesResponse adminListSchedules(AdminListSchedules input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicListSchedulesByGoal
   */
  public ModelListScheduleByGoalResponse publicListSchedulesByGoal(PublicListSchedulesByGoal input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicListSchedules
   */
  public ModelListSchedulesResponse publicListSchedules(PublicListSchedules input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
