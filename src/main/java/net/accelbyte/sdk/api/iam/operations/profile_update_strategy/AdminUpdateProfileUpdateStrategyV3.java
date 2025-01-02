/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.profile_update_strategy;

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
 * AdminUpdateProfileUpdateStrategyV3
 *
 * <p>This API includes upsert behavior. Note: 1. field 'config'' in request body will only work
 * when type is limited
 */
@Getter
@Setter
public class AdminUpdateProfileUpdateStrategyV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/namespaces/{namespace}/profileUpdateStrategies";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String field;
  private ModelUpdateProfileUpdateStrategyConfigRequest body;

  /**
   * @param namespace required
   * @param field required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminUpdateProfileUpdateStrategyV3(
      String namespace, String field, ModelUpdateProfileUpdateStrategyConfigRequest body) {
    this.namespace = namespace;
    this.field = field;
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
    queryParams.put("field", this.field == null ? null : Arrays.asList(this.field));
    return queryParams;
  }

  @Override
  public ModelUpdateProfileUpdateStrategyConfigRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.field == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public ModelSimpleProfileUpdateStrategyConfigs parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelSimpleProfileUpdateStrategyConfigs().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("field", "None");
    return result;
  }

  public enum Field {
    Country("country"),
    DisplayName("display_name"),
    Dob("dob"),
    Username("username");

    private String value;

    Field(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class AdminUpdateProfileUpdateStrategyV3Builder {
    private String field;

    public AdminUpdateProfileUpdateStrategyV3Builder field(final String field) {
      this.field = field;
      return this;
    }

    public AdminUpdateProfileUpdateStrategyV3Builder fieldFromEnum(final Field field) {
      this.field = field.toString();
      return this;
    }
  }
}
