/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.models;

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
public class CreateBasePolicyResponse extends Model {

  @JsonProperty("affectedClientIds")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> affectedClientIds;

  @JsonProperty("affectedCountries")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> affectedCountries;

  @JsonProperty("countryGroupName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String countryGroupName;

  @JsonProperty("countryType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String countryType;

  @JsonProperty("createdAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdAt;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("globalPolicyName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String globalPolicyName;

  @JsonProperty("id")
  private String id;

  @JsonProperty("isHidden")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean isHidden;

  @JsonProperty("isHiddenPublic")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean isHiddenPublic;

  @JsonProperty("namespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String namespace;

  @JsonProperty("policyId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String policyId;

  @JsonProperty("tags")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> tags;

  @JsonProperty("typeId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String typeId;

  @JsonProperty("updatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String updatedAt;

  @JsonIgnore
  public String getCountryType() {
    return this.countryType;
  }

  @JsonIgnore
  public CountryType getCountryTypeAsEnum() {
    return CountryType.valueOf(this.countryType);
  }

  @JsonIgnore
  public void setCountryType(final String countryType) {
    this.countryType = countryType;
  }

  @JsonIgnore
  public void setCountryTypeFromEnum(final CountryType countryType) {
    this.countryType = countryType.toString();
  }

  @JsonIgnore
  public CreateBasePolicyResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<CreateBasePolicyResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<CreateBasePolicyResponse>>() {});
  }

  public enum CountryType {
    COUNTRY("COUNTRY"),
    COUNTRYGROUP("COUNTRY_GROUP");

    private String value;

    CountryType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class CreateBasePolicyResponseBuilder {
    private String countryType;

    public CreateBasePolicyResponseBuilder countryType(final String countryType) {
      this.countryType = countryType;
      return this;
    }

    public CreateBasePolicyResponseBuilder countryTypeFromEnum(final CountryType countryType) {
      this.countryType = countryType.toString();
      return this;
    }
  }
}
