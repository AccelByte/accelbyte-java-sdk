/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelAgeRestrictionRequest;
import net.accelbyte.sdk.api.iam.models.ModelAgeRestrictionResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminUpdateAgeRestrictionConfigV2
 *
 * <p>Required permission 'ADMIN:NAMESPACE:{namespace}:AGERESTRICTION [UPDATE]'
 */
@Getter
@Setter
public class AdminUpdateAgeRestrictionConfigV2 extends Operation {
  /** generated field's value */
  private String path = "/iam/v2/admin/namespaces/{namespace}/agerestrictions";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  @Deprecated private String security = "Bearer";
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private ModelAgeRestrictionRequest body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  public AdminUpdateAgeRestrictionConfigV2(String namespace, ModelAgeRestrictionRequest body) {
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public ModelAgeRestrictionRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelAgeRestrictionResponse parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelAgeRestrictionResponse().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
