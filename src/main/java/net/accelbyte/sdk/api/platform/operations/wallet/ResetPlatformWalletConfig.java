/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.wallet;

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
 * resetPlatformWalletConfig
 *
 * <p>Reset platform wallet config to default config. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:WALLET:CONFIG", action=4
 * (UPDATE) * Returns : platform wallet config
 */
@Getter
@Setter
public class ResetPlatformWalletConfig extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/platforms/{platform}/wallet/config/reset";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String platform;

  /**
   * @param namespace required
   * @param platform required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ResetPlatformWalletConfig(String namespace, String platform) {
    this.namespace = namespace;
    this.platform = platform;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.platform != null) {
      pathParams.put("platform", this.platform);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.platform == null) {
      return false;
    }
    return true;
  }

  public PlatformWalletConfigInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new PlatformWalletConfigInfo().createFromJson(json);
  }

  public enum Platform {
    Epic("Epic"),
    GooglePlay("GooglePlay"),
    IOS("IOS"),
    Nintendo("Nintendo"),
    Other("Other"),
    Playstation("Playstation"),
    Steam("Steam"),
    Xbox("Xbox");

    private String value;

    Platform(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ResetPlatformWalletConfigBuilder {
    private String platform;

    public ResetPlatformWalletConfigBuilder platform(final String platform) {
      this.platform = platform;
      return this;
    }

    public ResetPlatformWalletConfigBuilder platformFromEnum(final Platform platform) {
      this.platform = platform.toString();
      return this;
    }
  }
}
