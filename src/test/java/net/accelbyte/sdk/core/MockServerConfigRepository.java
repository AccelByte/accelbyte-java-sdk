/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import net.accelbyte.sdk.core.repository.ConfigRepository;

class MockServerConfigRepository implements ConfigRepository {
  @Override
  public String getClientId() {
    return "admin";
  }

  @Override
  public String getClientSecret() {
    return "admin";
  }

  @Override
  public String getBaseURL() {
    return "http://127.0.0.1:8080";
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
