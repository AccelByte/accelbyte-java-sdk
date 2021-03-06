/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.profanity;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminDeleteProfanityFilter
 *
 * <p>Required permission : `ADMIN:NAMESPACE:{namespace}:PROFANITY [DELETE]` with scope `social`
 *
 * <p>delete the filter from the list
 */
@Getter
@Setter
public class AdminDeleteProfanityFilter extends Operation {
  /** generated field's value */
  private String path =
      "/lobby/v1/admin/profanity/namespaces/{namespace}/list/{list}/filters/delete";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String list;

  private String namespace;
  private ModelsAdminDeleteProfanityFilterRequest body;

  /**
   * @param list required
   * @param namespace required
   * @param body required
   */
  @Builder
  public AdminDeleteProfanityFilter(
      String list, String namespace, ModelsAdminDeleteProfanityFilterRequest body) {
    this.list = list;
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.list != null) {
      pathParams.put("list", this.list);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public ModelsAdminDeleteProfanityFilterRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.list == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public List<ModelsProfanityFilter> parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ObjectMapper()
          .readValue(json, new TypeReference<List<ModelsProfanityFilter>>() {});
    }
    throw new HttpResponseException(code, json);
  }
}
