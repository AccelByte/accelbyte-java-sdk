/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.dlc;

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
 * geDLCDurableRewardShortMap
 *
 * <p>Get dlc reward simple map, only return the sku of durable item reward Other detail info:
 *
 * <p>* Required permission : Authorized user
 */
@Getter
@Setter
public class GeDLCDurableRewardShortMap extends Operation {
  /** generated field's value */
  private String path = "/platform/public/namespaces/{namespace}/dlc/rewards/durable/map";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList();
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String dlcType;

  /**
   * @param namespace required
   * @param dlcType required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GeDLCDurableRewardShortMap(String namespace, String dlcType) {
    this.namespace = namespace;
    this.dlcType = dlcType;

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
    queryParams.put("dlcType", this.dlcType == null ? null : Arrays.asList(this.dlcType));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.dlcType == null) {
      return false;
    }
    return true;
  }

  public DLCConfigRewardShortInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new DLCConfigRewardShortInfo().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("dlcType", "None");
    return result;
  }

  public enum DlcType {
    EPICGAMES("EPICGAMES"),
    OCULUS("OCULUS"),
    PSN("PSN"),
    STEAM("STEAM"),
    XBOX("XBOX");

    private String value;

    DlcType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class GeDLCDurableRewardShortMapBuilder {
    private String dlcType;

    public GeDLCDurableRewardShortMapBuilder dlcType(final String dlcType) {
      this.dlcType = dlcType;
      return this;
    }

    public GeDLCDurableRewardShortMapBuilder dlcTypeFromEnum(final DlcType dlcType) {
      this.dlcType = dlcType.toString();
      return this;
    }
  }
}
