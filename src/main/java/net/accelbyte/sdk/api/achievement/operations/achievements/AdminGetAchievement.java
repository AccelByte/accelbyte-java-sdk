/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.achievement.operations.achievements;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.achievement.models.*;
import net.accelbyte.sdk.api.achievement.models.ModelsAchievementResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminGetAchievement
 *
 * <p>Required permission `ADMIN:NAMESPACE:{namespace}:ACHIEVEMENT [READ]` and scope `social`
 */
@Getter
@Setter
public class AdminGetAchievement extends Operation {
  /** generated field's value */
  private String path =
      "/achievement/v1/admin/namespaces/{namespace}/achievements/{achievementCode}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  @Deprecated private String security = "Bearer";
  private String locationQuery = null;
  /** fields as input parameter */
  private String achievementCode;

  private String namespace;

  /**
   * @param achievementCode required
   * @param namespace required
   */
  @Builder
  public AdminGetAchievement(String achievementCode, String namespace) {
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

  public ModelsAchievementResponse parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelsAchievementResponse().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
