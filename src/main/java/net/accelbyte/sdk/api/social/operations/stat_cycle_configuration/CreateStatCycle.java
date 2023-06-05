/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operations.stat_cycle_configuration;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * createStatCycle
 *
 * <p>Create stat cycle. Fields: * name: Cycle name, maximum length is 128 characters. (required). *
 * resetTime: Reset time must follow hours:minutes in 24 hours format e.g. 01:30, 23:15. (required)
 * * resetDay: Reset Day follows the ISO-8601 standard, from 1 (Monday) to 7 (Sunday). Required when
 * cycleType is WEEKLY. * resetDate: Reset Date must be a number 1 - 31. Required when cycleType is
 * MONTHLY or ANNUALLY. * resetMonth: Reset Month must be a number 1 - 12. Required when cycleType
 * is ANNUALLY. * seasonPeriod: Season period must be a number greater than or equal to 1 (days).
 * Required when cycleType is SEASONAL. * start: Start time must follow RFC3339 standard. e.g.
 * 2023-02-24T05:10:24.865Z. (required) * end: End time must follow RFC3339 standard. e.g.
 * 2023-02-24T05:10:24.865Z. Other detail info: * Required permission :
 * resource="ADMIN:NAMESPACE:{namespace}:STAT", action=1 (CREATE) * Returns : created stat cycle
 */
@Getter
@Setter
public class CreateStatCycle extends Operation {
  /** generated field's value */
  private String path = "/social/v1/admin/namespaces/{namespace}/statCycles";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private StatCycleCreate body;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreateStatCycle(String namespace, StatCycleCreate body) {
    this.namespace = namespace;
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
  public StatCycleCreate getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public StatCycleInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new StatCycleInfo().createFromJson(json);
  }
}
