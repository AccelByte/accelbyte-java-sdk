/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth;

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
 * GetRevocationList
 *
 * <p>## The endpoint is going to be deprecated This endpoint will return a list of revoked users
 * and revoked tokens. List of revoked tokens in bloom filter format. This endpoint requires all
 * requests to have Authorization header set with Basic access authentication constructed from
 * client id and client secret. The bloom filter uses MurmurHash3 algorithm for hashing the values
 *
 * <p>### Endpoint migration guide - **Substitute endpoint: _/iam/v3/oauth/revocationlist [GET]_**
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class GetRevocationList extends Operation {
  /** generated field's value */
  private String path = "/iam/oauth/revocationlist";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */

  /** */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetRevocationList() {

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
