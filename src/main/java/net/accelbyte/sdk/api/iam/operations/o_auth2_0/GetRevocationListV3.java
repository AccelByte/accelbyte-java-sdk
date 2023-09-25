/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth2_0;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * GetRevocationListV3
 *
 * <p>This endpoint will return a list of revoked users and revoked tokens. List of revoked tokens
 * in bloom filter format.
 *
 * <p>This endpoint requires all requests to have Authorization header set with Basic access
 * authentication constructed from client id and client secret.
 *
 * <p>The bloom filter uses MurmurHash3 algorithm for hashing the values
 *
 * <p>action code : 10708
 */
@Getter
@Setter
public class GetRevocationListV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/oauth/revocationlist";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */

  /** */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetRevocationListV3() {

    securities.add("Basic");
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public OauthapiRevocationList parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new OauthapiRevocationList().createFromJson(json);
  }
}
