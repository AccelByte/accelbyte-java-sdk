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
import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.models.BulkStatItemInc;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * bulkIncUserStatItemValue_2
 *
 * <p>Public bulk update user's statitems value. Other detail info: * Required permission :
 * resource="NAMESPACE:{namespace}:USER:{userId}:STATITEM", action=4 (UPDATE) * Returns : bulk
 * updated result
 */
@Getter
@Setter
public class BulkIncUserStatItemValue2 extends Operation {
  /** generated field's value */
  private String path =
      "/social/v1/public/namespaces/{namespace}/users/{userId}/statitems/value/bulk";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  @Deprecated private String security = "Bearer";
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String userId;
  private List<BulkStatItemInc> body;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  public BulkIncUserStatItemValue2(String namespace, String userId, List<BulkStatItemInc> body) {
    this.namespace = namespace;
    this.userId = userId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public List<BulkStatItemInc> getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
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
