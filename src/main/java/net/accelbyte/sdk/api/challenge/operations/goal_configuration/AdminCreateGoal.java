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
 * <p>- Required permission: ADMIN:NAMESPACE:{namespace}:CHALLENGE [CREATE] Request body: - code:
 * unique within a challenge. - name: name of the goal. - description: text describing the goal
 * (optional). - schedule: a time range that indicated the availability of a goal within a
 * timeframe. Used in FIXED assignment rule, this will be required in that case. -
 * requirementGroups: contains array of objects consisting of operator and predicates attribute.
 * When requirements evaluation happened, each item's predicates will be evaluated first, by
 * operating the predicates with given operator. After all items evaluated, the results of the
 * evaluation on each item then will be logically evaluated using OR operator. - operator: logical
 * operator used to validate the completion of a goal. a goal is considered complete once complete
 * predicates operated with operator result in true. - predicates: list of progression parameters to
 * be tracked. - parameterType: the type of parameter for challenge to be progressed with. the
 * available options are: - STATISTIC: progress by user statistic item value. - STATISTIC_CYCLE:
 * progress user statistic cycle item value. statCycleId must be included. - ACHIEVEMENT: progress
 * by user achievement. - USERACCOUNT: progress by user account event. - ENTITLEMENT: progress by
 * user's item entitlement ownership. Supported item types are APP, CODE, INGAMEITEM, LOOTBOX,
 * MEDIA, and OPTIONBOX. - parameterName: the name of the parameter for challenge to be progressed
 * with. - STATISTIC: refers to stat code. - STATISTIC_CYCLE: refers to stat code with statCycleId
 * must be included. - ACHIEVEMENT: refers to achievement code. - USERACCOUNT: refers to a specific
 * event related to user accounts. The current possible events include: userAccountCreated,
 * gameUserAccountCreated, userAccountVerified, userAccountLinked, userAccountUpgraded,
 * thirdPartyAccountCreated, userLoggedIn, userThirdPartyLoggedIn and fullAccount. - For the
 * **userAccountLinked** event, **parameterName** will utilize **platformId** rather than the event
 * name. This will be validated against the list of active third-party accounts configuration within
 * the namespace, such as *psn*, *steam*, or *device*. - ENTITLEMENT: ecommerce store's item SKU. -
 * matcher: the comparison operator used to compare the current value of a parameter and targetValue
 * to validate the completion of a predicate. Possible values are EQUAL, LESS_THAN, GREATER_THAN,
 * LESS_THAN_EQUAL, and GREATER_THAN_EQUAL. - targetValue: the target number to be reached by the
 * parameter. - statCycleId: specify the statCycleId used to track statistic value in a cycle with
 * STATISTIC_CYCLE parameterType (optional). - rewards: list of rewards that will be claimable once
 * a goal is complete. - tags: goal's labels. - isActive: when goal is in a schedule, isActive
 * determine whether goal is active to progress or not. Goal describe set of requirements that need
 * to be fulfilled by players in order to complete it and describe what is the rewards given to
 * player when they complete the goal. The requirement will have target value and a operator that
 * will evaluate that against an observable playerâs attribute (e.g. statistic, entitlement). Goal
 * belongs to a challenge. Supported item type for ENTITLEMENT reward type: APP, BUNDLE, CODE,
 * COINS, EXTENSION, INGAMEITEM, LOOTBOX, MEDIA, OPTIONBOX. Number of goals per challenge is
 * **limited to 100 goals**.
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
    if (this.body == null) {
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
