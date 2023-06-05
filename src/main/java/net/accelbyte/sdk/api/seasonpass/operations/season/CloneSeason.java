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
 * cloneSeason
 *
 * <p>This API is used to clone a season.
 *
 * <p>Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:SEASONPASS", action=1 (CREATE) *
 * Returns : cloned season info
 */
@Getter
@Setter
public class CloneSeason extends Operation {
  /** generated field's value */
  private String path = "/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/clone";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String seasonId;
  private SeasonCloneRequest body;

  /**
   * @param namespace required
   * @param seasonId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CloneSeason(String namespace, String seasonId, SeasonCloneRequest body) {
    this.namespace = namespace;
    this.seasonId = seasonId;
    this.body = body;

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
  public SeasonCloneRequest getBodyParams() {
    return this.body;
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
