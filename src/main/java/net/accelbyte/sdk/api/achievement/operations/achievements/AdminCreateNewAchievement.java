/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.achievement.operations.achievements;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.achievement.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminCreateNewAchievement
 *
 * <p>Required permission `ADMIN:NAMESPACE:{namespace}:ACHIEVEMENT [CREATE]` and scope `social`
 *
 * <p>Other detail info: - achievementCode: Human readable unique code to indentify the achievement.
 * Must be lowercase and maximum length is 32 - incremental: If the achievement is not incremental,
 * it does not need to store a goal value of a stat to be unlocked. If the achievement is
 * incremental, it needs to set statCode and goalValue - statCode: Selected statistic code, from the
 * published statistic code event.Human readable unique code to indentify the achievement. Must be
 * lowercase and maximum length is 32 - goalValue: Statistics value required to unlock the
 * achievement. - defaultLanguage: localozation for achievement name and achievement description.
 * Allowed format : en, en-US - slug: specify the image they want to use, it can be file image name
 * or something to define the achievement icon.
 */
@Getter
@Setter
public class AdminCreateNewAchievement extends Operation {
  /** generated field's value */
  private String path = "/achievement/v1/admin/namespaces/{namespace}/achievements";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private ModelsAchievementRequest body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminCreateNewAchievement(String namespace, ModelsAchievementRequest body) {
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
  public ModelsAchievementRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsAchievementResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsAchievementResponse().createFromJson(json);
  }
}
