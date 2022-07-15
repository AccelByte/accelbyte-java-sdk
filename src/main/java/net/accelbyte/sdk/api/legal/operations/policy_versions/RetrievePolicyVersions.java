/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.policy_versions;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.models.RetrievePolicyVersionResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * retrievePolicyVersions
 *
 * <p>[TODO] Retrieve one or more legal policies with its versions. If the basePolicyId not
 * supplied, then retrieve only all latest policies version with localeId matched. Other detail
 * info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:*:LEGAL", action=2 (READ)
 */
@Getter
@Setter
public class RetrievePolicyVersions extends Operation {
  /** generated field's value */
  private String path = "/agreement/public/policies";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  @Deprecated private String security = "Bearer";
  private String locationQuery = null;
  /** fields as input parameter */
  private String basePolicyId;

  private String localeId;
  private String namespace;

  /** */
  @Builder
  public RetrievePolicyVersions(String basePolicyId, String localeId, String namespace) {
    this.basePolicyId = basePolicyId;
    this.localeId = localeId;
    this.namespace = namespace;

    securities.add("Bearer");
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "basePolicyId", this.basePolicyId == null ? null : Arrays.asList(this.basePolicyId));
    queryParams.put("localeId", this.localeId == null ? null : Arrays.asList(this.localeId));
    queryParams.put("namespace", this.namespace == null ? null : Arrays.asList(this.namespace));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public RetrievePolicyVersionResponse parseResponse(
      int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new RetrievePolicyVersionResponse().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("basePolicyId", "None");
    result.put("localeId", "None");
    result.put("namespace", "None");
    return result;
  }
}
