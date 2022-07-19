/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AccountCreateTestUserRequestV4 extends Model {

  @JsonProperty("acceptedPolicies")
  private List<LegalAcceptedPoliciesRequest> acceptedPolicies;

  @JsonProperty("authType")
  private String authType;

  @JsonProperty("country")
  private String country;

  @JsonProperty("dateOfBirth")
  private String dateOfBirth;

  @JsonProperty("displayName")
  private String displayName;

  @JsonProperty("emailAddress")
  private String emailAddress;

  @JsonProperty("password")
  private String password;

  @JsonProperty("passwordMD5Sum")
  private String passwordMD5Sum;

  @JsonProperty("username")
  private String username;

  @JsonProperty("verified")
  private Boolean verified;

  @JsonIgnore
  public String getAuthType() {
    return this.authType;
  }

  @JsonIgnore
  public AuthType getAuthTypeAsEnum() {
    return AuthType.valueOf(this.authType);
  }

  @JsonIgnore
  public void setAuthType(final String authType) {
    this.authType = authType;
  }

  @JsonIgnore
  public void setAuthTypeFromEnum(final AuthType authType) {
    this.authType = authType.toString();
  }

  @JsonIgnore
  public AccountCreateTestUserRequestV4 createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<AccountCreateTestUserRequestV4> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<AccountCreateTestUserRequestV4>>() {});
  }

  public enum AuthType {
    EMAILPASSWD("EMAILPASSWD");

    private String value;

    AuthType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class AccountCreateTestUserRequestV4Builder {
    private String authType;

    public AccountCreateTestUserRequestV4Builder authType(final String authType) {
      this.authType = authType;
      return this;
    }

    public AccountCreateTestUserRequestV4Builder authTypeFromEnum(final AuthType authType) {
      this.authType = authType.toString();
      return this;
    }
  }
}
