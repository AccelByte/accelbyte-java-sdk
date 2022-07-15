/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AppInfo {
  private String appName = "AccelByteJavaApp";
  private String appVersion = "0.0.0";

  public AppInfo() {}

  @Builder
  public AppInfo(String appName, String appVersion) {
    this.appName = appName;
    this.appVersion = appVersion;
  }
}
