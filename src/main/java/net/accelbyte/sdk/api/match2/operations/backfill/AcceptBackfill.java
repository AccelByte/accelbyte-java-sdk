/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.match2.operations.backfill;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.match2.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AcceptBackfill
 *
 * <p>Accept backfill proposal. Field **acceptedTicketIds** can be used to accept specific tickets
 * within a backfill proposal. If the ticketIDs are not mentioned in this field, those tickets will
 * be rejected and reactivated for future proposals. If **acceptedTicketIds** is nil or not
 * specified, then all tickets in the proposal will be accepted.
 */
@Getter
@Setter
public class AcceptBackfill extends Operation {
  /** generated field's value */
  private String path = "/match2/v1/namespaces/{namespace}/backfill/{backfillID}/proposal/accept";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String backfillID;

  private String namespace;
  private ApiBackFillAcceptRequest body;

  /**
   * @param backfillID required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AcceptBackfill(String backfillID, String namespace, ApiBackFillAcceptRequest body) {
    this.backfillID = backfillID;
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.backfillID != null) {
      pathParams.put("backfillID", this.backfillID);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public ApiBackFillAcceptRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.backfillID == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public ModelsGameSession parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsGameSession().createFromJson(json);
  }
}
