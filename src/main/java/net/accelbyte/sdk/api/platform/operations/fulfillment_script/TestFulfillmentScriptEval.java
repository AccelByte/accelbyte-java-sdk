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
 * testFulfillmentScriptEval
 *
 * <p>[TEST FACILITY ONLY] Test eval fulfillment script. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:FULFILLMENT", action=2 (READ)
 */
@Getter
@Setter
public class TestFulfillmentScriptEval extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/fulfillment/scripts/tests/eval";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList();
  private String locationQuery = null;
  /** fields as input parameter */
  private FulfillmentScriptEvalTestRequest body;

  /** */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public TestFulfillmentScriptEval(FulfillmentScriptEvalTestRequest body) {
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public FulfillmentScriptEvalTestRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public FulfillmentScriptEvalTestResult parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new FulfillmentScriptEvalTestResult().createFromJson(json);
  }
}
