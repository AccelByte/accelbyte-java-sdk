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
// deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ModelUserCreateRequestV3 extends Model {

  @JsonProperty("PasswordMD5Sum")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String passwordMD5Sum;

  @JsonProperty("acceptedPolicies")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<LegalAcceptedPoliciesRequest> acceptedPolicies;

  @JsonProperty("authType")
  private String authType;

  @JsonProperty("code")
  private String code;

  @JsonProperty("country")
  private String country;

  @JsonProperty("dateOfBirth")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String dateOfBirth;

  @JsonProperty("displayName")
  private String displayName;

  @JsonProperty("emailAddress")
  private String emailAddress;

  @JsonProperty("password")
  private String password;

  @JsonProperty("reachMinimumAge")
  private Boolean reachMinimumAge;

  @JsonIgnore
  public ModelUserCreateRequestV3 createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelUserCreateRequestV3> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelUserCreateRequestV3>>() {});
  }
}
