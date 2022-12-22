/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.seasonpass.operations.season;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.seasonpass.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publishSeason
 *
 * <p>This API is used to publish a draft season, only one published season allowed at same time in
 * a namespace.
 *
 * <p>Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:SEASONPASS", action=4 (UPDATE) *
 * Returns : published season
 */
@Getter
@Setter
public class PublishSeason extends Operation {
  /** generated field's value */
  private String path = "/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/publish";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String seasonId;

  /**
   * @param namespace required
   * @param seasonId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublishSeason(String namespace, String seasonId) {
    this.namespace = namespace;
    this.seasonId = seasonId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.seasonId != null) {
      pathParams.put("seasonId", this.seasonId);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.seasonId == null) {
      return false;
    }
    return true;
  }

  public SeasonInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new SeasonInfo().createFromJson(json);
  }
}
