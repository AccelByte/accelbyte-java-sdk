/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.achievement.operations.global_achievements;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * ResetGlobalAchievement
 *
 * <p>[TEST FACILITY ONLY]
 *
 * <p>Required permission `ADMIN:NAMESPACE:{namespace}:ACHIEVEMENT [DELETE]` and scope `social`
 */
@Getter
@Setter
public class ResetGlobalAchievement extends Operation {
  /** generated field's value */
  private String path =
      "/achievement/v1/admin/namespaces/{namespace}/global/achievements/{achievementCode}/reset";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String achievementCode;

  private String namespace;

  /**
   * @param achievementCode required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ResetGlobalAchievement(String achievementCode, String namespace) {
    this.achievementCode = achievementCode;
    this.namespace = namespace;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.achievementCode != null) {
      pathParams.put("achievementCode", this.achievementCode);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.achievementCode == null) {
      return false;
    }
    if (this.namespace == null) {
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
