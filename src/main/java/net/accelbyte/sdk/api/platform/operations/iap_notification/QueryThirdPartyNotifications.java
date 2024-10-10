/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.iap_notification;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * queryThirdPartyNotifications
 *
 * <p>Query third party notifications. Other detail info:
 *
 * <p>* Returns : Third Party Platform notifications
 */
@Getter
@Setter
public class QueryThirdPartyNotifications extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/iap/notifications";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String endDate;
  private String externalId;
  private Integer limit;
  private Integer offset;
  private String source;
  private String startDate;
  private String status;
  private String type;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryThirdPartyNotifications(
      String namespace,
      String endDate,
      String externalId,
      Integer limit,
      Integer offset,
      String source,
      String startDate,
      String status,
      String type) {
    this.namespace = namespace;
    this.endDate = endDate;
    this.externalId = externalId;
    this.limit = limit;
    this.offset = offset;
    this.source = source;
    this.startDate = startDate;
    this.status = status;
    this.type = type;

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
    queryParams.put("endDate", this.endDate == null ? null : Arrays.asList(this.endDate));
    queryParams.put("externalId", this.externalId == null ? null : Arrays.asList(this.externalId));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("source", this.source == null ? null : Arrays.asList(this.source));
    queryParams.put("startDate", this.startDate == null ? null : Arrays.asList(this.startDate));
    queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
    queryParams.put("type", this.type == null ? null : Arrays.asList(this.type));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public NotificationPagingSlicedResult parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new NotificationPagingSlicedResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("endDate", "None");
    result.put("externalId", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("source", "None");
    result.put("startDate", "None");
    result.put("status", "None");
    result.put("type", "None");
    return result;
  }

  public enum Source {
    APPLE("APPLE"),
    EPICGAMES("EPICGAMES"),
    GOOGLE("GOOGLE"),
    OCULUS("OCULUS"),
    PLAYSTATION("PLAYSTATION"),
    STADIA("STADIA"),
    STEAM("STEAM"),
    TWITCH("TWITCH"),
    XBOX("XBOX");

    private String value;

    Source(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    ERROR("ERROR"),
    IGNORED("IGNORED"),
    PROCESSED("PROCESSED"),
    WARN("WARN");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class QueryThirdPartyNotificationsBuilder {
    private String source;
    private String status;

    public QueryThirdPartyNotificationsBuilder source(final String source) {
      this.source = source;
      return this;
    }

    public QueryThirdPartyNotificationsBuilder sourceFromEnum(final Source source) {
      this.source = source.toString();
      return this;
    }

    public QueryThirdPartyNotificationsBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public QueryThirdPartyNotificationsBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
