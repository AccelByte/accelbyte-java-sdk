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
import java.util.List;
import lombok.*;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ModelUserCreateFromInvitationRequestV4 extends Model {

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

  @JsonProperty("password")
  private String password;

  @JsonProperty("reachMinimumAge")
  private Boolean reachMinimumAge;

  @JsonProperty("username")
  private String username;

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
  public ModelUserCreateFromInvitationRequestV4 createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelUserCreateFromInvitationRequestV4> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelUserCreateFromInvitationRequestV4>>() {});
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

  public static class ModelUserCreateFromInvitationRequestV4Builder {
    private String authType;

    public ModelUserCreateFromInvitationRequestV4Builder authType(final String authType) {
      this.authType = authType;
      return this;
    }

    public ModelUserCreateFromInvitationRequestV4Builder authTypeFromEnum(final AuthType authType) {
      this.authType = authType.toString();
      return this;
    }
  }
}
