/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.reporting.operations.admin_tickets;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.reporting.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * listTickets
 *
 * <p>Required permission: ADMIN:NAMESPACE:{namespace}:TICKET [READ] Tickets list can be ordered by:
 * - createdAt - reportsCount - status (currently there are OPEN, AUTO_MODERATED and CLOSED
 * statuses, desc order will put ticket with CLOSED status at the top)
 */
@Getter
@Setter
public class ListTickets extends Operation {
  /** generated field's value */
  private String path = "/reporting/v1/admin/namespaces/{namespace}/tickets";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String category;
  private String extensionCategory;
  private Integer limit;
  private Integer offset;
  private String order;
  private String reportedUserId;
  private String sortBy;
  private String status;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ListTickets(
      String namespace,
      String category,
      String extensionCategory,
      Integer limit,
      Integer offset,
      String order,
      String reportedUserId,
      String sortBy,
      String status) {
    this.namespace = namespace;
    this.category = category;
    this.extensionCategory = extensionCategory;
    this.limit = limit;
    this.offset = offset;
    this.order = order;
    this.reportedUserId = reportedUserId;
    this.sortBy = sortBy;
    this.status = status;

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
    queryParams.put("category", this.category == null ? null : Arrays.asList(this.category));
    queryParams.put(
        "extensionCategory",
        this.extensionCategory == null ? null : Arrays.asList(this.extensionCategory));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("order", this.order == null ? null : Arrays.asList(this.order));
    queryParams.put(
        "reportedUserId", this.reportedUserId == null ? null : Arrays.asList(this.reportedUserId));
    queryParams.put("sortBy", this.sortBy == null ? null : Arrays.asList(this.sortBy));
    queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public RestapiTicketListResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new RestapiTicketListResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("category", "None");
    result.put("extensionCategory", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("order", "None");
    result.put("reportedUserId", "None");
    result.put("sortBy", "None");
    result.put("status", "None");
    return result;
  }
}
