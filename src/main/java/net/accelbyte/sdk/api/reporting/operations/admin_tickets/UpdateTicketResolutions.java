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
 * updateTicketResolutions
 *
 * <p>Required permission: ADMIN:NAMESPACE:{namespace}:TICKET [UPDATE] Update ticket resolution
 * status to either OPEN or CLOSED. It is mandatory to provide notes
 */
@Getter
@Setter
public class UpdateTicketResolutions extends Operation {
  /** generated field's value */
  private String path = "/reporting/v1/admin/namespaces/{namespace}/tickets/{ticketId}/resolutions";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String ticketId;
  private RestapiUpdateTicketResolutionsRequest body;

  /**
   * @param namespace required
   * @param ticketId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateTicketResolutions(
      String namespace, String ticketId, RestapiUpdateTicketResolutionsRequest body) {
    this.namespace = namespace;
    this.ticketId = ticketId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.ticketId != null) {
      pathParams.put("ticketId", this.ticketId);
    }
    return pathParams;
  }

  @Override
  public RestapiUpdateTicketResolutionsRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.ticketId == null) {
      return false;
    }
    return true;
  }

  public RestapiTicketResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new RestapiTicketResponse().createFromJson(json);
  }
}
