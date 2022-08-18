/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.io.InputStream;
import net.accelbyte.sdk.core.util.Helper;

class HttpbinOperation extends Operation {
  @Override
  public boolean isValid() {
    return true;
  }

  public HttpbinAnythingResponse parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ObjectMapper().readValue(json, new TypeReference<HttpbinAnythingResponse>() {});
    }
    throw new HttpResponseException(code, json);
  }
}
