/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.fulfillment_script;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
 * listFulfillmentScripts
 *
 * <p>List all fulfillment scripts. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:FULFILLMENT", action=2 (READ)
 */
@Getter
@Setter
public class ListFulfillmentScripts extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/fulfillment/scripts";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList();
  private String locationQuery = null;
  /** fields as input parameter */

  /** */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ListFulfillmentScripts() {

    securities.add("Bearer");
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public List<FulfillmentScriptInfo> parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper().readValue(json, new TypeReference<List<FulfillmentScriptInfo>>() {});
  }
}
