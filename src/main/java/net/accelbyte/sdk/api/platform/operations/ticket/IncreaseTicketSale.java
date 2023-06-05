/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.ticket;

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
 * increaseTicketSale
 *
 * <p>[SERVICE COMMUNICATION ONLY] increase ticket(code/key) sale. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:TICKET", action=4 (UPDATE) *
 * Returns : Ticket sale increment result
 */
@Getter
@Setter
public class IncreaseTicketSale extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/tickets/{boothName}/increment";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String boothName;

  private String namespace;
  private TicketSaleIncrementRequest body;

  /**
   * @param boothName required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public IncreaseTicketSale(String boothName, String namespace, TicketSaleIncrementRequest body) {
    this.boothName = boothName;
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.boothName != null) {
      pathParams.put("boothName", this.boothName);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public TicketSaleIncrementRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.boothName == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public TicketSaleIncrementResult parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new TicketSaleIncrementResult().createFromJson(json);
  }
}
