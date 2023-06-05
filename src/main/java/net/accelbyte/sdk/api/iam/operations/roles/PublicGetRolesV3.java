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
 * PublicGetRolesV3
 *
 * <p>This endpoint is used to get all non-admin role.
 *
 * <p>action code: 10418
 */
@Getter
@Setter
public class PublicGetRolesV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/public/roles";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String after;

  private String before;
  private Boolean isWildcard;
  private Integer limit;

  /** */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicGetRolesV3(String after, String before, Boolean isWildcard, Integer limit) {
    this.after = after;
    this.before = before;
    this.isWildcard = isWildcard;
    this.limit = limit;

    securities.add("Bearer");
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("after", this.after == null ? null : Arrays.asList(this.after));
    queryParams.put("before", this.before == null ? null : Arrays.asList(this.before));
    queryParams.put(
        "isWildcard",
        this.isWildcard == null ? null : Arrays.asList(String.valueOf(this.isWildcard)));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public ModelRoleNamesResponseV3 parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelRoleNamesResponseV3().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("after", "None");
    result.put("before", "None");
    result.put("isWildcard", "None");
    result.put("limit", "None");
    return result;
  }
}
