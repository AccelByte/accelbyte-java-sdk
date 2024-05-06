/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.base_legal_policies;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * retrievePolicyCountry
 *
 * <p>Retrieve a Base Legal Policy based on a Particular Country.
 */
@Getter
@Setter
public class RetrievePolicyCountry extends Operation {
  /** generated field's value */
  private String path = "/agreement/admin/base-policies/{basePolicyId}/countries/{countryCode}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String basePolicyId;

  private String countryCode;

  /**
   * @param basePolicyId required
   * @param countryCode required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RetrievePolicyCountry(String basePolicyId, String countryCode) {
    this.basePolicyId = basePolicyId;
    this.countryCode = countryCode;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.basePolicyId != null) {
      pathParams.put("basePolicyId", this.basePolicyId);
    }
    if (this.countryCode != null) {
      pathParams.put("countryCode", this.countryCode);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.basePolicyId == null) {
      return false;
    }
    if (this.countryCode == null) {
      return false;
    }
    return true;
  }

  public RetrievePolicyResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new RetrievePolicyResponse().createFromJson(json);
  }
}
