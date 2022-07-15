/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.reward;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.RewardPagingSlicedResult;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * queryRewards
 *
 * <p>This API is used to query rewards by criteria.
 *
 * <p>Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:REWARD", action=2 (READ) *
 * Returns : the list of rewards
 */
@Getter
@Setter
public class QueryRewards extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/rewards/byCriteria";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  @Deprecated private String security = "Bearer";
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String eventTopic;
  private Integer limit;
  private Integer offset;
  private List<String> sortBy;

  /**
   * @param namespace required
   */
  @Builder
  public QueryRewards(
      String namespace, String eventTopic, Integer limit, Integer offset, List<String> sortBy) {
    this.namespace = namespace;
    this.eventTopic = eventTopic;
    this.limit = limit;
    this.offset = offset;
    this.sortBy = sortBy;

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
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("eventTopic", this.eventTopic == null ? null : Arrays.asList(this.eventTopic));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("sortBy", this.sortBy == null ? null : this.sortBy);
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public RewardPagingSlicedResult parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new RewardPagingSlicedResult().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("eventTopic", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("sortBy", "csv");
    return result;
  }

  public enum SortBy {
    Namespace("namespace"),
    Namespaceasc("namespace:asc"),
    Namespacedesc("namespace:desc"),
    RewardCode("rewardCode"),
    RewardCodeasc("rewardCode:asc"),
    RewardCodedesc("rewardCode:desc");

    private String value;

    SortBy(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class QueryRewardsBuilder {
    private List<String> sortBy;

    public QueryRewardsBuilder sortBy(final List<String> sortBy) {
      this.sortBy = sortBy;
      return this;
    }

    public QueryRewardsBuilder sortByFromEnum(final List<SortBy> sortBy) {
      ArrayList<String> en = new ArrayList<String>();
      for (SortBy e : sortBy) en.add(e.toString());
      this.sortBy = en;
      return this;
    }
  }
}
