/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.operations.public_;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * ListProvidersByRegion
 *
 * <p>This endpoint returns the providers by region.
 */
@Getter
@Setter
public class ListProvidersByRegion extends Operation {
  /** generated field's value */
  private String path = "/dsmcontroller/public/providers/regions/{region}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String region;

  /**
   * @param region required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ListProvidersByRegion(String region) {
    this.region = region;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.region != null) {
      pathParams.put("region", this.region);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.region == null) {
      return false;
    }
    return true;
  }

  public ModelsDefaultProvider parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsDefaultProvider().createFromJson(json);
  }
}
