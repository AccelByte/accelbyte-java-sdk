/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.operations.misc;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * deleteCountryGroup
 *
 * <p>Delete a country groups by its country group code. This endpoint usually used for testing
 * purpose to cleanup test data. Other detail info:
 *
 * <p>* Required permission : resource = "ADMIN:NAMESPACE:{namespace}:MISC" , action=8 (DELETE)
 */
@Getter
@Setter
public class DeleteCountryGroup extends Operation {
  /** generated field's value */
  private String path =
      "/basic/v1/admin/namespaces/{namespace}/misc/countrygroups/{countryGroupCode}";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String countryGroupCode;

  private String namespace;

  /**
   * @param countryGroupCode required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public DeleteCountryGroup(String countryGroupCode, String namespace) {
    this.countryGroupCode = countryGroupCode;
    this.namespace = namespace;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.countryGroupCode != null) {
      pathParams.put("countryGroupCode", this.countryGroupCode);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.countryGroupCode == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
