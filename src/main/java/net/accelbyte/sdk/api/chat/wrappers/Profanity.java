/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.chat.models.*;
import net.accelbyte.sdk.api.chat.operations.profanity.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Profanity {

  private AccelByteSDK sdk;

  public Profanity(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminProfanityQuery
   */
  public ModelsDictionaryQueryResult adminProfanityQuery(AdminProfanityQuery input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminProfanityCreate
   */
  public ModelsDictionary adminProfanityCreate(AdminProfanityCreate input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminProfanityCreateBulk
   */
  public void adminProfanityCreateBulk(AdminProfanityCreateBulk input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminProfanityExport
   */
  public ModelsDictionaryExport adminProfanityExport(AdminProfanityExport input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminProfanityGroup
   */
  public List<ModelsDictionaryGroup> adminProfanityGroup(AdminProfanityGroup input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminProfanityImport
   */
  public ModelsDictionaryImportResult adminProfanityImport(AdminProfanityImport input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminProfanityUpdate
   */
  public ModelsDictionary adminProfanityUpdate(AdminProfanityUpdate input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminProfanityDelete
   */
  public void adminProfanityDelete(AdminProfanityDelete input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
