package net.accelbyte.sdk.core.repository;

public interface TokenValidation {

  public void setLocalTokenValidationEnabled(boolean enabled);

  public boolean getLocalTokenValidationEnabled();

  public void setJwksRefreshInterval(int seconds);

  public int getJwksRefreshInterval();

  public void setRevocationListRefreshInterval(int seconds);

  public int getRevocationListRefreshInterval();

  public void setNamespaceContextRefreshInterval(int seconds);

  public int getNamespaceContextRefreshInterval();
}
