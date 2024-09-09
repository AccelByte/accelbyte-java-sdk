/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.override_role_config_v3;

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
 * AdminChangeRoleOverrideConfigStatusV3
 *
 * <p>Enable or disable the target role override feature in path namespace. Note: This API has
 * upsert behavior, if there is no config yet, it will create a new one first.
 */
@Getter
@Setter
public class AdminChangeRoleOverrideConfigStatusV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/namespaces/{namespace}/roleoverride/status";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String identity;
  private ModelRoleOverrideStatsUpdateRequest body;

  /**
   * @param namespace required
   * @param identity required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminChangeRoleOverrideConfigStatusV3(
      String namespace, String identity, ModelRoleOverrideStatsUpdateRequest body) {
    this.namespace = namespace;
    this.identity = identity;
    this.body = body;

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
    queryParams.put("identity", this.identity == null ? null : Arrays.asList(this.identity));
    return queryParams;
  }

  @Override
  public ModelRoleOverrideStatsUpdateRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.identity == null) {
      return false;
    }
    return true;
  }

  public ModelRoleOverrideResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelRoleOverrideResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("identity", "None");
    return result;
  }

  public enum Identity {
    GAMEADMIN("GAME_ADMIN"),
    USER("USER"),
    VIEWONLY("VIEW_ONLY");

    private String value;

    Identity(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class AdminChangeRoleOverrideConfigStatusV3Builder {
    private String identity;

    public AdminChangeRoleOverrideConfigStatusV3Builder identity(final String identity) {
      this.identity = identity;
      return this;
    }

    public AdminChangeRoleOverrideConfigStatusV3Builder identityFromEnum(final Identity identity) {
      this.identity = identity.toString();
      return this;
    }
  }
}
