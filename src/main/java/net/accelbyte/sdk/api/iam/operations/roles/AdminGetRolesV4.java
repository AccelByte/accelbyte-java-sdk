/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.roles;

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
 * AdminGetRolesV4
 *
 * <p>Required permission ADMIN:ROLE [READ]
 *
 * <p>action code: 10414
 */
@Getter
@Setter
public class AdminGetRolesV4 extends Operation {
  /** generated field's value */
  private String path = "/iam/v4/admin/roles";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private Boolean adminRole;

  private Boolean isWildcard;
  private Integer limit;
  private Integer offset;

  /** */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminGetRolesV4(Boolean adminRole, Boolean isWildcard, Integer limit, Integer offset) {
    this.adminRole = adminRole;
    this.isWildcard = isWildcard;
    this.limit = limit;
    this.offset = offset;

    securities.add("Bearer");
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "adminRole", this.adminRole == null ? null : Arrays.asList(String.valueOf(this.adminRole)));
    queryParams.put(
        "isWildcard",
        this.isWildcard == null ? null : Arrays.asList(String.valueOf(this.isWildcard)));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public ModelListRoleV4Response parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelListRoleV4Response().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("adminRole", "None");
    result.put("isWildcard", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    return result;
  }
}
