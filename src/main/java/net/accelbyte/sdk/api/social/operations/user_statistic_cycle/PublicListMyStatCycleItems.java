/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operations.user_statistic_cycle;

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
 * publicListMyStatCycleItems
 *
 * <p>List user's statCycleItems by statCycle. Other detail info: * Returns : stat cycle items
 */
@Getter
@Setter
public class PublicListMyStatCycleItems extends Operation {
  /** generated field's value */
  private String path =
      "/social/v1/public/namespaces/{namespace}/users/me/statCycles/{cycleId}/statCycleitems";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String cycleId;

  private String namespace;
  private Integer limit;
  private Integer offset;
  private String sortBy;
  private List<String> statCodes;

  /**
   * @param cycleId required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicListMyStatCycleItems(
      String cycleId,
      String namespace,
      Integer limit,
      Integer offset,
      String sortBy,
      List<String> statCodes) {
    this.cycleId = cycleId;
    this.namespace = namespace;
    this.limit = limit;
    this.offset = offset;
    this.sortBy = sortBy;
    this.statCodes = statCodes;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.cycleId != null) {
      pathParams.put("cycleId", this.cycleId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("sortBy", this.sortBy == null ? null : Arrays.asList(this.sortBy));
    queryParams.put(
        "statCodes",
        this.statCodes == null
            ? null
            : this.statCodes.stream()
                .map(i -> String.valueOf(i))
                .collect(java.util.stream.Collectors.toList()));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.cycleId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public UserStatCycleItemPagingSlicedResult parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new UserStatCycleItemPagingSlicedResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("sortBy", "None");
    result.put("statCodes", "multi");
    return result;
  }
}
