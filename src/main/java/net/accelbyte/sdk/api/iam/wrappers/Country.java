/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.country.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Country {

  private AccelByteSDK sdk;

  public Country(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetCountryListV3
   */
  public List<ModelCountryResponse> adminGetCountryListV3(AdminGetCountryListV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetCountryBlacklistV3
   */
  public ModelCountryBlacklistResponse adminGetCountryBlacklistV3(AdminGetCountryBlacklistV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminAddCountryBlacklistV3
   */
  public void adminAddCountryBlacklistV3(AdminAddCountryBlacklistV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetCountryListV3
   */
  public List<ModelCountryResponse> publicGetCountryListV3(PublicGetCountryListV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
