/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.models;

import com.fasterxml.jackson.annotation.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.*;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ModelUpgradeHeadlessAccountWithVerificationCodeRequestV3 extends Model {

  @JsonProperty("code")
  private String code;

  @JsonProperty("country")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String country;

  @JsonProperty("dateOfBirth")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String dateOfBirth;

  @JsonProperty("displayName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String displayName;

  @JsonProperty("emailAddress")
  private String emailAddress;

  @JsonProperty("password")
  private String password;

  @JsonProperty("uniqueDisplayName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String uniqueDisplayName;

  @JsonProperty("validateOnly")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean validateOnly;

  @JsonIgnore
  public ModelUpgradeHeadlessAccountWithVerificationCodeRequestV3 createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelUpgradeHeadlessAccountWithVerificationCodeRequestV3> createFromJsonList(
      String json) throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(
            json,
            new TypeReference<List<ModelUpgradeHeadlessAccountWithVerificationCodeRequestV3>>() {});
  }
}
