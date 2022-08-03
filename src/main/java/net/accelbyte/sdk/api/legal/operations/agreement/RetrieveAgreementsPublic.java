/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.agreement;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
 * retrieveAgreementsPublic
 *
 * <p>Retrieve accepted Legal Agreements. Other detail info:
 *
 * <p>* Required permission : login user
 */
@Getter
@Setter
public class RetrieveAgreementsPublic extends Operation {
  /** generated field's value */
  private String path = "/agreement/public/agreements/policies";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */

  /** */
  @Builder
  public RetrieveAgreementsPublic() {

    securities.add("Bearer");
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public List<RetrieveAcceptedAgreementResponse> parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ObjectMapper()
          .readValue(json, new TypeReference<List<RetrieveAcceptedAgreementResponse>>() {});
    }
    throw new HttpResponseException(code, json);
  }
}
