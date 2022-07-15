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
public class AccountUpgradeHeadlessAccountWithVerificationCodeRequestV4 extends Model {

  @JsonProperty("code")
  private String code;

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

  @JsonProperty("reachMinimumAge")
  private Boolean reachMinimumAge;

  @JsonProperty("username")
  private String username;

  @JsonProperty("validateOnly")
  private Boolean validateOnly;

  @JsonIgnore
  public AccountUpgradeHeadlessAccountWithVerificationCodeRequestV4 createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<AccountUpgradeHeadlessAccountWithVerificationCodeRequestV4> createFromJsonList(
      String json) throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(
            json,
            new TypeReference<
                List<AccountUpgradeHeadlessAccountWithVerificationCodeRequestV4>>() {});
  }
}
