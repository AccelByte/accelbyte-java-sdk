/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import net.accelbyte.sdk.core.repository.ConfigRepository;

class HttpbinConfigRepository implements ConfigRepository {
  @Override
  public String getClientId() {
    return "DUMMY_CLIENT_ID";
  }

  @Override
  public String getClientSecret() {
    return "DUMMY_CLIENT_SECRET";
  }

  @Override
  public String getBaseURL() {
    String binUrl = System.getenv("AB_HTTPBIN_URL");
    if (binUrl == null) binUrl = "https://httpbin.org";
    return binUrl;
  }

  @Override
  public boolean isAmazonTraceId() {
    return true;
  }

  @Override
  public void activateAmazonTraceId(String version) {
    // Do nothing
  }

  @Override
  public void deactivateAmazonTraceId() {
    // Do nothing
  }

  @Override
  public String getAmazonTraceIdVersion() {
    return "1";
  }

  @Override
  public boolean isClientInfoHeader() {
    return true;
  }

  @Override
  public void activateClientInfoHeader(AppInfo appInfo) {
    // Do nothing
  }

  @Override
  public void deactivateClientInfoHeader() {
    // Do nothing
  }

  @Override
  public AppInfo getAppInfo() {
    return new AppInfo("Java Server SDK Test", "9.9.9");
  }
}
