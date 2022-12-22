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
import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * addCountryGroup
 *
 * <p>Add a country groups Country code must follow ISO3166-1 alpha-2. Other detail info:
 *
 * <p>* Required permission : resource = "ADMIN:NAMESPACE:{namespace}:MISC" , action=1 (CREATE) *
 * Action code : 11201 * Returns : newly created country group
 */
@Getter
@Setter
public class AddCountryGroup extends Operation {
  /** generated field's value */
  private String path = "/basic/v1/admin/namespaces/{namespace}/misc/countrygroups";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private AddCountryGroupRequest body;

  /**
   * @param namespace required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AddCountryGroup(String namespace, AddCountryGroupRequest body) {
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
  public AddCountryGroupRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public AddCountryGroupResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new AddCountryGroupResponse().createFromJson(json);
  }
}
