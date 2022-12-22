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
 * decreaseTicketSale
 *
 * <p>[SERVICE COMMUNICATION ONLY] Decrease ticket(code/key) sale if requested orderNo is already
 * increased. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:TICKET", action=4 (UPDATE)
 */
@Getter
@Setter
public class DecreaseTicketSale extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/tickets/{boothName}/decrement";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String boothName;

  private String namespace;
  private TicketSaleDecrementRequest body;

  /**
   * @param boothName required
   * @param namespace required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public DecreaseTicketSale(String boothName, String namespace, TicketSaleDecrementRequest body) {
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
  public TicketSaleDecrementRequest getBodyParams() {
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

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
