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
 * bulkUpdateUserStatItemV2
 *
 * <p>Bulk update multiple user's statitems value with specific update strategy. There are four
 * supported update strategies: + *OVERRIDE*: update user statitem with the new value + *INCREMENT*:
 * increment user statitem with the specified value + *MAX*: update user statitem with the specified
 * value if it's larger than the existing value + *MIN*: update user statitem with the specified
 * value if it's lower than the existing value
 *
 * <p>Other detail info: + *Required permission*: resource="ADMIN:NAMESPACE:{namespace}:STATITEM",
 * action=4 (UPDATE) + *Returns*: bulk updated result
 */
@Getter
@Setter
public class BulkUpdateUserStatItemV2 extends Operation {
  /** generated field's value */
  private String path = "/social/v2/admin/namespaces/{namespace}/statitems/value/bulk";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private List<BulkUserStatItemUpdate> body;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public BulkUpdateUserStatItemV2(String namespace, List<BulkUserStatItemUpdate> body) {
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
  public List<BulkUserStatItemUpdate> getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public List<BulkStatOperationResult> parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<BulkStatOperationResult>>() {});
  }
}
