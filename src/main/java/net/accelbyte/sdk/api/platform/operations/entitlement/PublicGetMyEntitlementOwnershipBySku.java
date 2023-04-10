/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.entitlement;

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
 * publicGetMyEntitlementOwnershipBySku
 *
 * <p>Get my entitlement ownership by sku.
 *
 * <p>Other detail info:
 *
 * <p>* Required permission : resource="NAMESPACE:{namespace}:ENTITLEMENT", action=2 (READ) * Path's
 * namespace : * can be filled with publisher namespace in order to get publisher namespace
 * entitlement ownership by sku * can be filled with game namespace in order to get game namespace
 * entitlement ownership by sku
 */
@Getter
@Setter
public class PublicGetMyEntitlementOwnershipBySku extends Operation {
  /** generated field's value */
  private String path =
      "/platform/public/namespaces/{namespace}/users/me/entitlements/ownership/bySku";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String entitlementClazz;
  private String sku;

  /**
   * @param namespace required
   * @param sku required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicGetMyEntitlementOwnershipBySku(
      String namespace, String entitlementClazz, String sku) {
    this.namespace = namespace;
    this.entitlementClazz = entitlementClazz;
    this.sku = sku;

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
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "entitlementClazz",
        this.entitlementClazz == null ? null : Arrays.asList(this.entitlementClazz));
    queryParams.put("sku", this.sku == null ? null : Arrays.asList(this.sku));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.sku == null) {
      return false;
    }
    return true;
  }

  public TimedOwnership parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new TimedOwnership().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("entitlementClazz", "None");
    result.put("sku", "None");
    return result;
  }

  public enum EntitlementClazz {
    APP("APP"),
    CODE("CODE"),
    ENTITLEMENT("ENTITLEMENT"),
    LOOTBOX("LOOTBOX"),
    MEDIA("MEDIA"),
    OPTIONBOX("OPTIONBOX"),
    SUBSCRIPTION("SUBSCRIPTION");

    private String value;

    EntitlementClazz(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class PublicGetMyEntitlementOwnershipBySkuBuilder {
    private String entitlementClazz;

    public PublicGetMyEntitlementOwnershipBySkuBuilder entitlementClazz(
        final String entitlementClazz) {
      this.entitlementClazz = entitlementClazz;
      return this;
    }

    public PublicGetMyEntitlementOwnershipBySkuBuilder entitlementClazzFromEnum(
        final EntitlementClazz entitlementClazz) {
      this.entitlementClazz = entitlementClazz.toString();
      return this;
    }
  }
}
