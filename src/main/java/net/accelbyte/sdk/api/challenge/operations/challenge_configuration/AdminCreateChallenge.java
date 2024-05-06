/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.challenge.operations.challenge_configuration;

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
 * adminCreateChallenge
 *
 * <p>* Required permission: ADMIN:NAMESPACE:{namespace}:CHALLENGE [CREATE]
 *
 * <p>Challenge is a collection of goals that can be completed by players. Challenge can have rules
 * that specify what and when goals will be available for players to be taken.
 *
 * <p>Request body:
 *
 * <p>* code: only lowercase letters, numbers, and the separator - are allowed; must start and end
 * with letter * name: name of the challenge * description: text describing about the challenge
 * (optional) * startDate: timestamp of when the challenge is started * endDate: timestamp of when
 * the challenge is ended (optional) * endAfter: describe number of period challenge will be retired
 * after (optional) To configure challenge that never end, leave the endDate and endAfter field
 * null/empty. * repeatAfter: describe number of period challenge's goals will be repeated after.
 * Leave it empty if you don't want to repeat the challenge. * rotation: describe how long goals in
 * a challenge will be available for players to progress before rotated with another goals.
 * (DAILY|WEEKLY|MONTHLY|NONE) * activeGoalsPerRotation: number of goals per rotation (currently
 * only applicable for RANDOMIZE assignment) * assignmentRule: describe how the goals will be
 * assigned and scheduled to users. (FIXED|RANDOMIZED|UNSCHEDULED) * goalsVisibility: describe
 * whether users can see all goals under challenge, or only active goal in one rotation period only.
 * (SHOWALL|PERIODONLY)
 */
@Getter
@Setter
public class AdminCreateChallenge extends Operation {
  /** generated field's value */
  private String path = "/challenge/v1/admin/namespaces/{namespace}/challenges";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private ModelCreateChallengeRequest body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminCreateChallenge(String namespace, ModelCreateChallengeRequest body) {
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public ModelCreateChallengeRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelChallengeResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelChallengeResponse().createFromJson(json);
  }
}
