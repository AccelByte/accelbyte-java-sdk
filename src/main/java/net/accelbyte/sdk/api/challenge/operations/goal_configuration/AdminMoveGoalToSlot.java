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
 * adminMoveGoalToSlot
 *
 * <p>- Required permission: ADMIN:NAMESPACE:{namespace}:CHALLENGE [UPDATE] Moves a goal to a target
 * slot in a FIXED or non-per-rotation RANDOMIZED challenge with repeatAfter set. slotIndex is
 * 0-based and must be in [0, repeatAfter-1]. Pass slotIndex = -1 to remove the goal from all slots;
 * it will no longer appear in future rounds. TemplateSlots and all non-finished schedule documents
 * are updated immediately. The currently active schedule document for the affected slot is skipped
 * to avoid disrupting in-progress user progressions; the change takes effect from the next round.
 * Finished (past) schedule documents are never modified.
 */
@Getter
@Setter
public class AdminMoveGoalToSlot extends Operation {
  /** generated field's value */
  private String path =
      "/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/goals/{code}/slots";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String challengeCode;

  private String code;
  private String namespace;
  private ModelMoveGoalToSlotRequest body;

  /**
   * @param challengeCode required
   * @param code required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminMoveGoalToSlot(
      String challengeCode, String code, String namespace, ModelMoveGoalToSlotRequest body) {
    this.challengeCode = challengeCode;
    this.code = code;
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
    if (this.code != null) {
      pathParams.put("code", this.code);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public ModelMoveGoalToSlotRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.challengeCode == null) {
      return false;
    }
    if (this.code == null) {
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

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
