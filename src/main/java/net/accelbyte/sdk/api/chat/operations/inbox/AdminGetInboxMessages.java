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
 * adminGetInboxMessages
 *
 * <p>Get inbox messages
 */
@Getter
@Setter
public class AdminGetInboxMessages extends Operation {
  /** generated field's value */
  private String path = "/chat/v1/admin/inbox/namespaces/{namespace}/messages";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private Boolean activeOnly;
  private Integer endCreatedAt;
  private Integer limit;
  private List<String> messageId;
  private Integer offset;
  private String order;
  private String scope;
  private Integer startCreatedAt;
  private String status;
  private Boolean transient_;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminGetInboxMessages(
      String namespace,
      Boolean activeOnly,
      Integer endCreatedAt,
      Integer limit,
      List<String> messageId,
      Integer offset,
      String order,
      String scope,
      Integer startCreatedAt,
      String status,
      Boolean transient_) {
    this.namespace = namespace;
    this.activeOnly = activeOnly;
    this.endCreatedAt = endCreatedAt;
    this.limit = limit;
    this.messageId = messageId;
    this.offset = offset;
    this.order = order;
    this.scope = scope;
    this.startCreatedAt = startCreatedAt;
    this.status = status;
    this.transient_ = transient_;

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
    queryParams.put(
        "activeOnly",
        this.activeOnly == null ? null : Arrays.asList(String.valueOf(this.activeOnly)));
    queryParams.put(
        "endCreatedAt",
        this.endCreatedAt == null ? null : Arrays.asList(String.valueOf(this.endCreatedAt)));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put("messageId", this.messageId == null ? null : this.messageId);
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("order", this.order == null ? null : Arrays.asList(this.order));
    queryParams.put("scope", this.scope == null ? null : Arrays.asList(this.scope));
    queryParams.put(
        "startCreatedAt",
        this.startCreatedAt == null ? null : Arrays.asList(String.valueOf(this.startCreatedAt)));
    queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
    queryParams.put(
        "transient",
        this.transient_ == null ? null : Arrays.asList(String.valueOf(this.transient_)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsGetInboxMessagesResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsGetInboxMessagesResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("activeOnly", "None");
    result.put("endCreatedAt", "None");
    result.put("limit", "None");
    result.put("messageId", "multi");
    result.put("offset", "None");
    result.put("order", "None");
    result.put("scope", "None");
    result.put("startCreatedAt", "None");
    result.put("status", "None");
    result.put("transient", "None");
    return result;
  }

  public enum Scope {
    NAMESPACE("NAMESPACE"),
    USER("USER");

    private String value;

    Scope(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    DRAFT("DRAFT"),
    SENT("SENT"),
    UNSENT("UNSENT");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class AdminGetInboxMessagesBuilder {
    private String scope;
    private String status;

    public AdminGetInboxMessagesBuilder scope(final String scope) {
      this.scope = scope;
      return this;
    }

    public AdminGetInboxMessagesBuilder scopeFromEnum(final Scope scope) {
      this.scope = scope.toString();
      return this;
    }

    public AdminGetInboxMessagesBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public AdminGetInboxMessagesBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
