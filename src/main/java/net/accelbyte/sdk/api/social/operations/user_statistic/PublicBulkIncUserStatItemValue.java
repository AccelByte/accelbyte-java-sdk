/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operations.user_statistic;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publicBulkIncUserStatItemValue
 *
 * <p>Public bulk update multiple user's statitems value. Other detail info:
 *
 * <p>* Required permission : resource="NAMESPACE:{namespace}:STATITEM", action=4 (UPDATE) * Returns
 * : bulk updated result
 */
@Getter
@Setter
public class PublicBulkIncUserStatItemValue extends Operation {
  /** generated field's value */
  private String path = "/social/v1/public/namespaces/{namespace}/statitems/value/bulk";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private List<BulkUserStatItemInc> body;

  /**
   * @param namespace required
   */
  @Builder
  public PublicBulkIncUserStatItemValue(String namespace, List<BulkUserStatItemInc> body) {
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
  public List<BulkUserStatItemInc> getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public List<BulkStatItemOperationResult> parseResponse(
      int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ObjectMapper()
          .readValue(json, new TypeReference<List<BulkStatItemOperationResult>>() {});
    }
    throw new HttpResponseException(code, json);
  }
}
