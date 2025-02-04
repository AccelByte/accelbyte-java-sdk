/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.operations.policies_with_namespace_v2.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PoliciesWithNamespaceV2 {

  private AccelByteSDK sdk;

  public PoliciesWithNamespaceV2(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see RetrieveLatestPoliciesByNamespaceAndCountryPublic1
   */
  public List<RetrieveSimplePolicyPublicResponseV2>
      retrieveLatestPoliciesByNamespaceAndCountryPublic1(
          RetrieveLatestPoliciesByNamespaceAndCountryPublic1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
