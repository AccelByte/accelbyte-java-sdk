/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.third_party_credential;

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
 * UpdateThirdPartyLoginPlatformDomainV3
 *
 * <p>This is the API to set 3rd Platform domain.
 *
 * <p>It needs ADMIN:NAMESPACE:{namespace}:CLIENTDOMAIN [UPDATE] resource.
 */
@Getter
@Setter
public class UpdateThirdPartyLoginPlatformDomainV3 extends Operation {
  /** generated field's value */
  private String path =
      "/iam/v3/admin/namespaces/{namespace}/platforms/{platformId}/clients/domain";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String platformId;
  private ModelPlatformDomainUpdateRequest body;

  /**
   * @param namespace required
   * @param platformId required
   * @param body required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateThirdPartyLoginPlatformDomainV3(
      String namespace, String platformId, ModelPlatformDomainUpdateRequest body) {
    this.namespace = namespace;
    this.platformId = platformId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.platformId != null) {
      pathParams.put("platformId", this.platformId);
    }
    return pathParams;
  }

  @Override
  public ModelPlatformDomainUpdateRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.platformId == null) {
      return false;
    }
    return true;
  }

  public ModelPlatformDomainResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelPlatformDomainResponse().createFromJson(json);
  }
}
