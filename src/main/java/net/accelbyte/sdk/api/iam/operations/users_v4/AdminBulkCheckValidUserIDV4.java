/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users_v4;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelCheckValidUserIDRequestV4;
import net.accelbyte.sdk.api.iam.models.ModelListValidUserIDResponseV4;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminBulkCheckValidUserIDV4
 *
 * <p>Use this endpoint to check if userID exists or not
 *
 * <p>Required permission ' ADMIN:NAMESPACE:{namespace}:USER [READ]'
 *
 * <p>Maximum number of userID to be checked is 50
 */
@Getter
@Setter
public class AdminBulkCheckValidUserIDV4 extends Operation {
  /** generated field's value */
  private String path = "/iam/v4/admin/namespaces/{namespace}/users/bulk/validate";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  @Deprecated private String security = "Bearer";
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private ModelCheckValidUserIDRequestV4 body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  public AdminBulkCheckValidUserIDV4(String namespace, ModelCheckValidUserIDRequestV4 body) {
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
  public ModelCheckValidUserIDRequestV4 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelListValidUserIDResponseV4 parseResponse(
      int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelListValidUserIDResponseV4().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
