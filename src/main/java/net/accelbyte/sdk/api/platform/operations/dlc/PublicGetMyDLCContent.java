/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.dlc;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publicGetMyDLCContent
 *
 * <p>Get user dlc reward contents. If includeAllNamespaces is false, will only return the dlc
 * synced from the current namespace Other detail info:
 *
 * <p>* Returns : user dlc
 */
@Getter
@Setter
public class PublicGetMyDLCContent extends Operation {
  /** generated field's value */
  private String path = "/platform/public/users/me/dlc/content";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private Boolean includeAllNamespaces;

  private String type;

  /**
   * @param type required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicGetMyDLCContent(Boolean includeAllNamespaces, String type) {
    this.includeAllNamespaces = includeAllNamespaces;
    this.type = type;

    securities.add("Bearer");
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "includeAllNamespaces",
        this.includeAllNamespaces == null
            ? null
            : Arrays.asList(String.valueOf(this.includeAllNamespaces)));
    queryParams.put("type", this.type == null ? null : Arrays.asList(this.type));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.type == null) {
      return false;
    }
    return true;
  }

  public SimpleUserDLCRewardContentsResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new SimpleUserDLCRewardContentsResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("includeAllNamespaces", "None");
    result.put("type", "None");
    return result;
  }

  public enum Type {
    EPICGAMES("EPICGAMES"),
    OCULUS("OCULUS"),
    PSN("PSN"),
    STEAM("STEAM"),
    XBOX("XBOX");

    private String value;

    Type(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class PublicGetMyDLCContentBuilder {
    private String type;

    public PublicGetMyDLCContentBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public PublicGetMyDLCContentBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}
