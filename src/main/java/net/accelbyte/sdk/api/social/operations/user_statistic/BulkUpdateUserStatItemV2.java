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
 * <p>Other detail info: + *Returns*: bulk updated result
 *
 * <p>### â ï¸ Important Note on Bulk Update Behavior
 *
 * <p>To ensure data integrity and avoid inconsistencies or race conditions, it is crucial to make
 * each user/update pair unique per request. We strongly advise against including multiple updates
 * for the same `userId` with the same `statCode` and/or `updateStrategy` in a single request, as
 * bulk operations are processed concurrently.
 *
 * <p>Avoid including multiple entries with the same`userId` and `statCode` but different
 * `updateStrategy` values.
 *
 * <p>To apply multiple operations on the same stat, please batch or sequence them in separate
 * requests , according to your business logic.
 *
 * <p>â Incorrect Example:
 *
 * <p>[ { "userId": "315a070e48a74dae903d559974e6513d", "statCode": "exp", "updateStrategy":
 * "OVERRIDE", "value": 10 }, { "userId": "315a070e48a74dae903d559974e6513d", "statCode": "exp",
 * "updateStrategy": "INCREMENT", "value": 50 } ]
 *
 * <p>â Correct Example:
 *
 * <p>[ { "userId": "315a070e48a74dae903d559974e6513d", "statCode": "exp", "updateStrategy":
 * "INCREMENT", "value": 60 } ]
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
   * @param body required
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
    if (this.body == null) {
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
