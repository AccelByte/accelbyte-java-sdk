/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.platform;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * getXboxEntitlementOwnership
 *
 * <p>Get Xbox entitlement ownership by product sku.
 */
@Getter
@Setter
public class GetXboxEntitlementOwnership extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/platforms/xbl/entitlements/{productSku}/ownership";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String productSku;
  private XblEntitlementOwnershipRequest body;

  /**
   * @param namespace required
   * @param productSku required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetXboxEntitlementOwnership(
      String namespace, String productSku, XblEntitlementOwnershipRequest body) {
    this.namespace = namespace;
    this.productSku = productSku;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.productSku != null) {
      pathParams.put("productSku", this.productSku);
    }
    return pathParams;
  }

  @Override
  public XblEntitlementOwnershipRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.productSku == null) {
      return false;
    }
    return true;
  }

  public PlatformOwnership parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new PlatformOwnership().createFromJson(json);
  }
}
