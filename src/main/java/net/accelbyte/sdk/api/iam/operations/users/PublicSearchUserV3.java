/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

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
 * PublicSearchUserV3
 *
 * <p>Requires valid user access token
 *
 * <p>This endpoint search all users on the specified namespace that match the query on these
 * fields: display name, and username. The query length should greater than 1ï¼otherwise will not
 * query the database. The default limit value is 100
 *
 * <p>action code : 10132
 */
@Getter
@Setter
public class PublicSearchUserV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/public/namespaces/{namespace}/users";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String by;
  private Integer limit;
  private Integer offset;
  private String query;

  /**
   * @param namespace required
   */
  @Builder
  public PublicSearchUserV3(
      String namespace, String by, Integer limit, Integer offset, String query) {
    this.namespace = namespace;
    this.by = by;
    this.limit = limit;
    this.offset = offset;
    this.query = query;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("by", this.by == null ? null : Arrays.asList(this.by));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("query", this.query == null ? null : Arrays.asList(this.query));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelPublicUserInformationResponseV3 parseResponse(
      int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelPublicUserInformationResponseV3().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("by", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("query", "None");
    return result;
  }
}
