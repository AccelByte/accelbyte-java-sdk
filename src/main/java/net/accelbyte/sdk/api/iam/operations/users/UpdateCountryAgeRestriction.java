/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * UpdateCountryAgeRestriction
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>Endpoint migration guide
 *
 * <p>* Substitute endpoint:
 * /iam/v3/admin/namespaces/{namespace}/agerestrictions/countries/{countryCode} [PATCH]
 *
 * <p>Required permission 'ADMIN:NAMESPACE:{namespace}:AGERESTRICTION [UPDATE]'
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class UpdateCountryAgeRestriction extends Operation {
  /** generated field's value */
  private String path = "/iam/v2/admin/namespaces/{namespace}/countries/{countryCode}";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String countryCode;

  private String namespace;
  private ModelCountryAgeRestrictionRequest body;

  /**
   * @param countryCode required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateCountryAgeRestriction(
      String countryCode, String namespace, ModelCountryAgeRestrictionRequest body) {
    this.countryCode = countryCode;
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.countryCode != null) {
      pathParams.put("countryCode", this.countryCode);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public ModelCountryAgeRestrictionRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.countryCode == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelCountry parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelCountry().createFromJson(json);
  }
}
