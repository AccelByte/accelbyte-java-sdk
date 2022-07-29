/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.utility;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * checkReadiness
 *
 * <p>Readiness status defined as at least one legal basePolicy is present and having active
 * basePolicy. Other detail info:
 *
 * <p>* Required permission : resource="NAMESPACE:{namespace}:LEGAL", action=2 (READ)
 */
@Getter
@Setter
public class CheckReadiness extends Operation {
  /** generated field's value */
  private String path = "/agreement/public/readiness";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */

  /** */
  @Builder
  public CheckReadiness() {

    securities.add("Bearer");
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public LegalReadinessStatusResponse parseResponse(
      int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new LegalReadinessStatusResponse().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
