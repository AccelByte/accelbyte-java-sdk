/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.operations.topic;

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
 * publicUnbanTopicMembers
 *
 * <p>Unban topic members in a group topic.
 */
@Getter
@Setter
public class PublicUnbanTopicMembers extends Operation {
  /** generated field's value */
  private String path = "/chat/public/namespaces/{namespace}/topic/{topic}/unban-members";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String topic;
  private ModelsPublicUnbanTopicMembersRequest body;

  /**
   * @param namespace required
   * @param topic required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicUnbanTopicMembers(
      String namespace, String topic, ModelsPublicUnbanTopicMembersRequest body) {
    this.namespace = namespace;
    this.topic = topic;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.topic != null) {
      pathParams.put("topic", this.topic);
    }
    return pathParams;
  }

  @Override
  public ModelsPublicUnbanTopicMembersRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.topic == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public ModelsPublicUnbanTopicMembersResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsPublicUnbanTopicMembersResponse().createFromJson(json);
  }
}
