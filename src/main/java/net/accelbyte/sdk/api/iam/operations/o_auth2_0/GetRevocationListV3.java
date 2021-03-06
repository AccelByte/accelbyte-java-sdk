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
 * <p>This endpoint requires authorized requests header with valid access token.
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
  public GetRevocationListV3() {

    securities.add("Bearer");
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public OauthapiRevocationList parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new OauthapiRevocationList().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
