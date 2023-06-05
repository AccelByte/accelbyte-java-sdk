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
 * PublicGetLinkHeadlessAccountToMyAccountConflictV3
 *
 * <p>Note:
 *
 * <p>1. My account should be full account 2. My account not linked to request headless account's
 * third platform.
 *
 * <p>After client resolving the conflict, it will call endpoint
 * /iam/v3/public/users/me/headless/linkWithProgression [POST]
 */
@Getter
@Setter
public class PublicGetLinkHeadlessAccountToMyAccountConflictV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/public/users/me/headless/link/conflict";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String oneTimeLinkCode;

  /**
   * @param oneTimeLinkCode required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicGetLinkHeadlessAccountToMyAccountConflictV3(String oneTimeLinkCode) {
    this.oneTimeLinkCode = oneTimeLinkCode;

    securities.add("Bearer");
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "oneTimeLinkCode",
        this.oneTimeLinkCode == null ? null : Arrays.asList(this.oneTimeLinkCode));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.oneTimeLinkCode == null) {
      return false;
    }
    return true;
  }

  public ModelGetLinkHeadlessAccountConflictResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelGetLinkHeadlessAccountConflictResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("oneTimeLinkCode", "None");
    return result;
  }
}
