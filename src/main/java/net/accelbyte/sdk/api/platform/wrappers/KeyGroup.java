/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.key_group.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class KeyGroup {

  private AccelByteSDK sdk;

  public KeyGroup(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see QueryKeyGroups
   */
  public KeyGroupPagingSlicedResult queryKeyGroups(QueryKeyGroups input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateKeyGroup
   */
  public KeyGroupInfo createKeyGroup(CreateKeyGroup input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetKeyGroupByBoothName
   * @deprecated
   */
  @Deprecated
  public KeyGroupInfo getKeyGroupByBoothName(GetKeyGroupByBoothName input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetKeyGroup
   */
  public KeyGroupInfo getKeyGroup(GetKeyGroup input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateKeyGroup
   */
  public KeyGroupInfo updateKeyGroup(UpdateKeyGroup input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetKeyGroupDynamic
   */
  public KeyGroupDynamicInfo getKeyGroupDynamic(GetKeyGroupDynamic input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ListKeys
   */
  public KeyPagingSliceResult listKeys(ListKeys input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UploadKeys
   */
  public BulkOperationResult uploadKeys(UploadKeys input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
