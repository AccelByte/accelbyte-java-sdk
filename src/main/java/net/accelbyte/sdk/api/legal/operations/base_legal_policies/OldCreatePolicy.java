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
 * oldCreatePolicy
 *
 * <p>Create a legal policy. Note:
 *
 * <p>* countryType field only accept COUNTRY or COUNTRY_GROUP. * COUNTRY_GROUP countryType requires
 * the countryGroupName and affectedCountries fields to be provided.
 *
 * <p>* policy with COUNTRY_GROUP type include multiple countries and apply the same policy across
 * the entire list of countries
 */
@Getter
@Setter
public class OldCreatePolicy extends Operation {
  /** generated field's value */
  private String path = "/agreement/admin/base-policies";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private CreateBasePolicyRequest body;

  /** */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public OldCreatePolicy(CreateBasePolicyRequest body) {
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public CreateBasePolicyRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public CreateBasePolicyResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new CreateBasePolicyResponse().createFromJson(json);
  }
}
