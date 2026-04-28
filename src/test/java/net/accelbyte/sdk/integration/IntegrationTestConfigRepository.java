/*
 * Copyright (c) 2026 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import net.accelbyte.sdk.core.AppInfo;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.TokenValidation;

public class IntegrationTestConfigRepository implements ConfigRepository, TokenValidation {

  public static final IntegrationTestConfigRepository Client =
      new IntegrationTestConfigRepository("AB_CLIENT_ID", "AB_CLIENT_SECRET", "AB_CLIENT_NAMESPACE");

  public static final IntegrationTestConfigRepository Server =
      new IntegrationTestConfigRepository(
          "AB_SERVER_CLIENT_ID", "AB_SERVER_CLIENT_SECRET", "AB_SERVER_NAMESPACE");

  public static final IntegrationTestConfigRepository Admin =
      new IntegrationTestConfigRepository("AB_CLIENT_ID", "AB_CLIENT_SECRET", "AB_NAMESPACE");

  public static final IntegrationTestConfigRepository PublicClient =
      new IntegrationTestConfigRepository("PUBLIC_AB_CLIENT_ID", "", "AB_NAMESPACE");

  public static final IntegrationTestConfigRepository AdminPortalLogin =
      new IntegrationTestConfigRepository("ADMINPORTAL_BASE_URL", "ADMINPORTAL_CLIENT_ID", "", "");

  public static final IntegrationTestConfigRepository DifferentStudio =
      new IntegrationTestConfigRepository(
          "DIFFENV_AB_BASE_URL",
          "DIFFENV_AB_CLIENT_ID",
          "DIFFENV_AB_CLIENT_SECRET",
          "DIFFENV_AB_NAMESPACE");

  // AGS Shared Cloud OAuth Clients
  public static final IntegrationTestConfigRepository Achievement =
      new IntegrationTestConfigRepository("Achievement", true);

  public static final IntegrationTestConfigRepository AMS =
      new IntegrationTestConfigRepository("AMS", true);

  public static final IntegrationTestConfigRepository Basic =
      new IntegrationTestConfigRepository("Basic", true);

  public static final IntegrationTestConfigRepository Challenge =
      new IntegrationTestConfigRepository("Challenge", true);

  public static final IntegrationTestConfigRepository Chat =
      new IntegrationTestConfigRepository("Chat", true);

  public static final IntegrationTestConfigRepository CloudSave =
      new IntegrationTestConfigRepository("CloudSave", true);

  public static final IntegrationTestConfigRepository Extend =
      new IntegrationTestConfigRepository("Extend", true);

  public static final IntegrationTestConfigRepository Group =
      new IntegrationTestConfigRepository("Group", true);

  public static final IntegrationTestConfigRepository IAM =
      new IntegrationTestConfigRepository("IAM", true);

  public static final IntegrationTestConfigRepository Inventory =
      new IntegrationTestConfigRepository("Inventory", true);

  public static final IntegrationTestConfigRepository Leaderboard =
      new IntegrationTestConfigRepository("Leaderboard", true);

  public static final IntegrationTestConfigRepository Lobby =
      new IntegrationTestConfigRepository("Lobby", true);

  public static final IntegrationTestConfigRepository Matchmaking =
      new IntegrationTestConfigRepository("Matchmaking", true);

  public static final IntegrationTestConfigRepository Platform =
      new IntegrationTestConfigRepository("Platform", true);

  public static final IntegrationTestConfigRepository Reporting =
      new IntegrationTestConfigRepository("Reporting", true);

  public static final IntegrationTestConfigRepository SeasonPass =
      new IntegrationTestConfigRepository("SeasonPass", true);

  public static final IntegrationTestConfigRepository Session =
      new IntegrationTestConfigRepository("Session", true);

  public static final IntegrationTestConfigRepository Statistics =
      new IntegrationTestConfigRepository("Statistics", true);

  public static final IntegrationTestConfigRepository UGC =
      new IntegrationTestConfigRepository("UGC", true);

  public static final IntegrationTestConfigRepository CustomPermission =
      new IntegrationTestConfigRepository("CustomPermission", true);

  private String envNameBaseUrl = "AB_BASE_URL";
  private String envNameClientId;
  private String envNameClientSecret;
  private String envNameNamespace;
  private boolean useFallback = false;

  private AppInfo appInfo = new AppInfo();
  private boolean localTokenValidationEnabled = false;
  private int jwksRefreshIntervalSeconds = 300;
  private int revocationListRefreshIntervalSeconds = 300;
  private int namespaceContextIntervalSeconds = 300;

  private IntegrationTestConfigRepository(
      String envBaseUrl, String envClientId, String envClientSecret, String envNamespace) {
    this.envNameBaseUrl = envBaseUrl;
    this.envNameClientId = envClientId;
    this.envNameClientSecret = envClientSecret;
    this.envNameNamespace = envNamespace;
  }

  private IntegrationTestConfigRepository(
      String envClientId, String envClientSecret, String envNamespace) {
    this.envNameClientId = envClientId;
    this.envNameClientSecret = envClientSecret;
    this.envNameNamespace = envNamespace;
  }

  private IntegrationTestConfigRepository(String serviceName, boolean useFallback) {
    this.useFallback = useFallback;
    String aServiceName = serviceName.trim().toUpperCase();
    this.envNameClientId = "AB_CLIENT_ID_" + aServiceName;
    this.envNameClientSecret = "AB_CLIENT_SECRET_" + aServiceName;
    this.envNameNamespace = "AB_NAMESPACE";
  }

  private String unquote(String value) {
    if (value == null || value.length() < 2) {
      return value != null ? value : "";
    }
    if (value.startsWith("\"") && value.endsWith("\"")) {
      return value.substring(1, value.length() - 1);
    }
    return value;
  }

  @Override
  public String getClientId() {
    String temp = System.getenv(envNameClientId);
    if (temp != null) {
      return unquote(temp);
    } else if (useFallback) {
      temp = System.getenv("AB_CLIENT_ID");
      if (temp != null) {
        return unquote(temp);
      } else {
        throw new IllegalStateException(
            "Fallback environment variable not found (variable: AB_CLIENT_ID)");
      }
    } else {
      throw new IllegalStateException(
          "Environment variable not found (variable: " + envNameClientId + ")");
    }
  }

  @Override
  public String getClientSecret() {
    if ("".equals(envNameClientSecret)) {
      return "";
    }
    String temp = System.getenv(envNameClientSecret);
    if (temp != null) {
      return unquote(temp);
    } else if (useFallback) {
      temp = System.getenv("AB_CLIENT_SECRET");
      if (temp != null) {
        return unquote(temp);
      } else {
        throw new IllegalStateException(
            "Fallback environment variable not found (variable: AB_CLIENT_SECRET)");
      }
    } else {
      throw new IllegalStateException(
          "Environment variable not found (variable: " + envNameClientSecret + ")");
    }
  }

  @Override
  public String getBaseURL() {
    String temp = System.getenv(envNameBaseUrl);
    if (temp != null) {
      return unquote(temp);
    } else if (useFallback) {
      temp = System.getenv("AB_BASE_URL");
      if (temp != null) {
        return unquote(temp);
      } else {
        throw new IllegalStateException(
            "Fallback environment variable not found (variable: AB_BASE_URL)");
      }
    } else {
      throw new IllegalStateException(
          "Environment variable not found (variable: " + envNameBaseUrl + ")");
    }
  }

  public String getNamespace() {
    if ("".equals(envNameNamespace)) {
      return "";
    }
    String aNamespace = System.getenv(envNameNamespace);
    if (aNamespace != null) {
      return unquote(aNamespace);
    } else if (useFallback) {
      aNamespace = System.getenv("AB_NAMESPACE");
      if (aNamespace != null) {
        return unquote(aNamespace);
      } else {
        throw new IllegalStateException(
            "Fallback environment variable not found (variable: AB_NAMESPACE)");
      }
    } else {
      throw new IllegalStateException(
          "Environment variable not found (variable: " + envNameNamespace + ")");
    }
  }

  @Override
  public boolean isAmazonTraceId() {
    String aEnable = System.getenv("AB_ENABLE_TRACEID");
    if (aEnable == null) {
      return true;
    }
    return aEnable.trim().equals("1");
  }

  @Override
  public void activateAmazonTraceId(String amazonTraceIdVersion) {
    // Trace ID enable/disable is controlled via the AB_ENABLE_TRACEID environment variable
  }

  @Override
  public void deactivateAmazonTraceId() {
    // Trace ID enable/disable is controlled via the AB_ENABLE_TRACEID environment variable
  }

  @Override
  public String getAmazonTraceIdVersion() {
    String aVersion = System.getenv("AB_TRACEID_VERSION");
    if (aVersion == null) {
      return "1";
    }
    return aVersion;
  }

  @Override
  public void activateClientInfoHeader(AppInfo appInfo) {
    this.appInfo = appInfo != null ? appInfo : new AppInfo();
  }

  @Override
  public void deactivateClientInfoHeader() {
    // Client info header enable/disable is controlled via the AB_ENABLE_USERAGENT environment variable
  }

  @Override
  public AppInfo getAppInfo() {
    return this.appInfo;
  }

  @Override
  public boolean isClientInfoHeader() {
    String aEnable = System.getenv("AB_ENABLE_USERAGENT");
    if (aEnable == null) {
      return true;
    }
    return aEnable.trim().equals("1");
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

  @Override
  public void setNamespaceContextRefreshInterval(int seconds) {
    this.namespaceContextIntervalSeconds = seconds;
  }

  @Override
  public int getNamespaceContextRefreshInterval() {
    return this.namespaceContextIntervalSeconds;
  }
}
