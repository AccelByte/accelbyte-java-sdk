/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.operations.inbox;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.chat.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminUnsendInboxMessage
 *
 * <p>Unsend inbox message
 */
@Getter
@Setter
public class AdminUnsendInboxMessage extends Operation {
  /** generated field's value */
  private String path = "/chat/v1/admin/inbox/namespaces/{namespace}/messages/{inbox}/unsend";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String inbox;

  private String namespace;
  private ModelsUnsendInboxMessageRequest body;

  /**
   * @param inbox required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminUnsendInboxMessage(
      String inbox, String namespace, ModelsUnsendInboxMessageRequest body) {
    this.inbox = inbox;
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.inbox != null) {
      pathParams.put("inbox", this.inbox);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public ModelsUnsendInboxMessageRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.inbox == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsUnsendInboxMessageResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsUnsendInboxMessageResponse().createFromJson(json);
  }
}
