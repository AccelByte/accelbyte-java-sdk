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
 * PublicGetAchievement
 *
 * <p>Required permission `NAMESPACE:{namespace}:ACHIEVEMENT [READ]` and scope `social`
 */
@Getter
@Setter
public class PublicGetAchievement extends Operation {
  /** generated field's value */
  private String path =
      "/achievement/v1/public/namespaces/{namespace}/achievements/{achievementCode}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String achievementCode;

  private String namespace;
  private String language;

  /**
   * @param achievementCode required
   * @param namespace required
   * @param language required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicGetAchievement(String achievementCode, String namespace, String language) {
    this.achievementCode = achievementCode;
    this.namespace = namespace;
    this.language = language;

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
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("language", this.language == null ? null : Arrays.asList(this.language));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.achievementCode == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.language == null) {
      return false;
    }
    return true;
  }

  public ModelsPublicAchievementResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsPublicAchievementResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("language", "None");
    return result;
  }
}
