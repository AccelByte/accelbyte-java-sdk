/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.challenge.operations.goal_configuration;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.challenge.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminCreateGoal
 *
 * <p>* Required permission: ADMIN:NAMESPACE:{namespace}:CHALLENGE [CREATE]
 *
 * <p>Request body: * code: unique within a challenge * name: name of the goal * description: text
 * describing the goal (optional) * schedule: a time range that indicated the availability of a goal
 * within a timeframe. used in fixed assignment rule * requirementGroups: list of conditions that
 * conform with the goal progressions. * operator: logical operator used to validate the completion
 * of a goal. a goal is considered complete once complete predicates operated with operator result
 * in true. * predicates: list of progression parameters to be tracked * parameterType: the type of
 * parameter for challenge to be progressed with. the available options are: * STATISTIC: progress
 * by user statistic item value * STATISTIC_CYCLE: progress user statistic cycle item value.
 * statCycleId must be included. * ACHIVEMENT: progress by user achievement * USERACCOUNT: progress
 * by user account event * parameterName: the name of the parameter for challenge to be progressed
 * with. * STATISTIC: refers to stat code * STATISTIC_CYCLE: refers to stat code with statCycleId
 * must be included * ACHIVEMENT: refers to achievement code * USERACCOUNT: one of the user account
 * event. current possible values are (userAccountCreated, gameUserAccountCreated,
 * userAccountVerified, userAccountLinked, userAccountUpgraded,thirdPartyAccountCreated) * matcher:
 * the comparison operator used to compare the curent value of a parameter and targetValue to
 * validate the completion of a predicate * targetValue: the target number to be reached by the
 * parameter * statCycleId: used to track statistic type parameter value in a cycle (optional) *
 * rewards: list of rewards that will be claimable once a goal is complete * tag: goal's labels *
 * isActive: when goal is in a schedule, isActive determine whether goal is active to progress or
 * not Goal describe set of requirements that need to be fulfilled by players in order to complete
 * it and describe what is the rewards given to player when they complete the goal.The requirement
 * will have target value and a operator that will evaluate that against an observable playerâs
 * attribute (e.g. statistic, entitlement). Goal belongs to a challenge.Supported item type for
 * ENTITLEMENT reward type: APP, BUNDLE, CODE, COINS, EXTENSION, INGAMEITEM, LOOTBOX, MEDIA,
 * OPTIONBOX
 */
@Getter
@Setter
public class AdminCreateGoal extends Operation {
  /** generated field's value */
  private String path =
      "/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/goals";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String challengeCode;

  private String namespace;
  private ModelCreateGoalRequest body;

  /**
   * @param challengeCode required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminCreateGoal(String challengeCode, String namespace, ModelCreateGoalRequest body) {
    this.challengeCode = challengeCode;
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.challengeCode != null) {
      pathParams.put("challengeCode", this.challengeCode);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public ModelCreateGoalRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.challengeCode == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelGoalResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelGoalResponse().createFromJson(json);
  }
}
