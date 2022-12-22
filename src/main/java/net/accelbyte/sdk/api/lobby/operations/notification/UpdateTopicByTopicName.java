/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.notification;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * updateTopicByTopicName
 *
 * <p>Required permission : `NAMESPACE:{namespace}:TOPIC [UPDATE]` with scope `social`
 *
 * <p>update topic information by topic name.
 *
 * <p>topic should be alphabets, no special char except underscore, uppercase and no spacing. for
 * example: TOPIC_TEST. Already existing topic can not be created
 */
@Getter
@Setter
public class UpdateTopicByTopicName extends Operation {
  /** generated field's value */
  private String path = "/notification/namespaces/{namespace}/topics/{topic}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String topic;
  private ModelUpdateTopicRequest body;

  /**
   * @param namespace required
   * @param topic required
   * @param body required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateTopicByTopicName(String namespace, String topic, ModelUpdateTopicRequest body) {
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
  public ModelUpdateTopicRequest getBodyParams() {
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
