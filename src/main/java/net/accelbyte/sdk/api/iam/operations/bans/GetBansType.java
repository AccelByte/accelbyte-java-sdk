/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.bans;

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
 * GetBansType
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>Required permission 'BAN:ADMIN [READ]' or 'ADMIN:BAN [READ]'
 *
 * <p>Endpoint migration guide
 *
 * <p>* Substitute endpoint: /iam/v3/admin/bans [GET]
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class GetBansType extends Operation {
  /** generated field's value */
  private String path = "/iam/bans";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */

  /** */
  @Builder
  /*
   *  @deprecated 2022-08-29 All args constructor may cause problems. Use builder instead.
   */
  @Deprecated
  public GetBansType() {

    securities.add("Bearer");
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public AccountcommonBans parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new AccountcommonBans().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
