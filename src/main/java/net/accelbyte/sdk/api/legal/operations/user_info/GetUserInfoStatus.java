/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.user_info;

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
 * getUserInfoStatus
 *
 * <p>Get user info cache last updated time per namespace. The query parameter namespaces can be a
 * list of namespace separated by comma. If query parameter namespaces is empty, user info cache
 * status for all available namespaces will be returned. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:*:LEGAL", action=2 (READ)
 */
@Getter
@Setter
public class GetUserInfoStatus extends Operation {
  /** generated field's value */
  private String path = "/agreement/admin/userInfo";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespaces;

  /** */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetUserInfoStatus(String namespaces) {
    this.namespaces = namespaces;

    securities.add("Bearer");
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("namespaces", this.namespaces == null ? null : Arrays.asList(this.namespaces));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public List<RetrieveUserInfoCacheStatusResponse> parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<RetrieveUserInfoCacheStatusResponse>>() {});
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("namespaces", "None");
    return result;
  }
}
