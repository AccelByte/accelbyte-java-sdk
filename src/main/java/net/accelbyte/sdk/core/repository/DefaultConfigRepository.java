/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.repository;

import net.accelbyte.sdk.core.AppInfo;

public class DefaultConfigRepository implements ConfigRepository, TokenValidation {

  private static final String CLIENT_ID = "AB_CLIENT_ID";
  private static final String CLIENT_SECRET = "AB_CLIENT_SECRET";
  private static final String BASE_URL = "AB_BASE_URL";

  private AppInfo appInfo = new AppInfo();
  private boolean amazonTraceId = true;
  private String amazonTraceIdVersion = "1";
  private boolean clientInfoHeader = true;

  private boolean localTokenValidationEnabled = false;
  private int jwksRefreshIntervalSeconds = 300;
  private int revocationListRefreshIntervalSeconds = 300;

  @Override
  public String getClientId() {
    if (System.getenv(CLIENT_ID) == null) {
      return "";
    }
    return System.getenv(CLIENT_ID);
  }

  @Override
  public String getClientSecret() {
    if (System.getenv(CLIENT_SECRET) == null) {
      return "";
    }
    return System.getenv(CLIENT_SECRET);
  }

  @Override
  public String getBaseURL() {
    if (System.getenv(BASE_URL) == null) {
      return "";
    }
    return System.getenv(BASE_URL);
  }

  @Override
  public boolean isAmazonTraceId() {
    return this.amazonTraceId;
  }

  @Override
  public void activateAmazonTraceId(String amazonTraceIdVersion) {
    this.amazonTraceId = true;
    this.amazonTraceIdVersion = amazonTraceIdVersion != null ? amazonTraceIdVersion : "1";
  }

  @Override
  public void deactivateAmazonTraceId() {
    this.amazonTraceId = false;
  }

  @Override
  public String getAmazonTraceIdVersion() {
    return this.amazonTraceIdVersion;
  }

  @Override
  public void activateClientInfoHeader(AppInfo appInfo) {
    this.clientInfoHeader = true;
    this.appInfo = appInfo != null ? appInfo : new AppInfo();
  }

  @Override
  public void deactivateClientInfoHeader() {
    this.clientInfoHeader = false;
  }

  @Override
  public AppInfo getAppInfo() {
    return this.appInfo;
  }

  @Override
  public boolean isClientInfoHeader() {
    return this.clientInfoHeader;
  }

  @Override
  public void setLocalTokenValidationEnabled(boolean enabled) {
    this.localTokenValidationEnabled = enabled;
  }

  @Override
  public boolean getLocalTokenValidationEnabled() {
    return this.localTokenValidationEnabled;
  }

  @Override
  public void setJwksRefreshInterval(int seconds) {
    this.jwksRefreshIntervalSeconds = seconds;
  }

  @Override
  public int getJwksRefreshInterval() {
    return this.jwksRefreshIntervalSeconds;
  }

  @Override
  public void setRevocationListRefreshInterval(int seconds) {
    this.revocationListRefreshIntervalSeconds = seconds;
  }

  @Override
  public int getRevocationListRefreshInterval() {
    return this.revocationListRefreshIntervalSeconds;
  }
}
