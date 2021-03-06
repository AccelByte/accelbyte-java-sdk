/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.fulfillment_script;

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
 * updateFulfillmentScript
 *
 * <p>Update fulfillment script. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:FULFILLMENT", action=4 (UPDATE)
 */
@Getter
@Setter
public class UpdateFulfillmentScript extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/fulfillment/scripts/{id}";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList();
  private String locationQuery = null;
  /** fields as input parameter */
  private String id;

  private FulfillmentScriptUpdate body;

  /**
   * @param id required
   */
  @Builder
  public UpdateFulfillmentScript(String id, FulfillmentScriptUpdate body) {
    this.id = id;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.id != null) {
      pathParams.put("id", this.id);
    }
    return pathParams;
  }

  @Override
  public FulfillmentScriptUpdate getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.id == null) {
      return false;
    }
    return true;
  }

  public FulfillmentScriptInfo parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new FulfillmentScriptInfo().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
