/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.api.basic.operations.namespace.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Namespace {

  private AccelByteSDK sdk;

  public Namespace(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetNamespaces
   */
  public List<NamespaceInfo> getNamespaces(GetNamespaces input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateNamespace
   */
  public NamespaceInfo createNamespace(CreateNamespace input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetNamespace
   */
  public NamespaceInfo getNamespace(GetNamespace input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteNamespace
   */
  public NamespaceInfo deleteNamespace(DeleteNamespace input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateNamespace
   */
  public NamespaceInfo updateNamespace(UpdateNamespace input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetGameNamespaces
   */
  public List<NamespaceInfo> getGameNamespaces(GetGameNamespaces input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetNamespacePublisher
   */
  public NamespacePublisherInfo getNamespacePublisher(GetNamespacePublisher input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ChangeNamespaceStatus
   */
  public NamespaceInfo changeNamespaceStatus(ChangeNamespaceStatus input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetNamespaces
   */
  public List<NamespaceInfo> publicGetNamespaces(PublicGetNamespaces input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetNamespacePublisher
   */
  public NamespacePublisherInfo publicGetNamespacePublisher(PublicGetNamespacePublisher input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
