/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.common.base.Strings;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.util.Helper;

@Getter
@Setter
public abstract class Operation {
  protected String path = "";
  protected String method = "";
  protected List<String> consumes = new ArrayList<>();
  protected List<String> produces = new ArrayList<>();
  protected String preferredSecurityMethod = "";
  protected List<String> securities = new ArrayList<>();
  protected String locationQuery = "";
  /*package-private*/ String xFlightId = "";

  public Map<String, String> getPathParams() {
    return new HashMap<>();
  }

  public Map<String, List<String>> getQueryParams() {
    return new HashMap<>();
  }

  public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
    return Helper.createFullUrl(
        baseUrl,
        this.getPath(),
        this.getPathParams(),
        this.getQueryParams(),
        this.getCollectionFormatMap());
  }

  public Map<String, String> getCookieParams() {
    return new HashMap<>();
  }

  public Object getBodyParams() {
    return null;
  }

  public Map<String, Object> getFormParams() {
    return new HashMap<>();
  }

  public abstract boolean isValid();

  /**
   * if true will override global flightId in SDK level, and the operation
   * will use flightId specified for this operation
   * {@link AccelByteConfig#flightIdRepository}
   */
  public boolean hasXFlightId() {
    return !Strings.isNullOrEmpty(xFlightId);
  }

  protected Map<String, String> getCollectionFormatMap() {
    return new HashMap<>();
  }

  public enum Security {
    Basic("Basic"),
    Bearer("Bearer"),
    Cookie("Cookie");

    private String value;

    Security(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }
}
