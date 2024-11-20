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
public class UpdateBasePolicyRequestV2 extends Model {

  @JsonProperty("affectedClientIds")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> affectedClientIds;

  @JsonProperty("affectedCountries")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> affectedCountries;

  @JsonProperty("basePolicyName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String basePolicyName;

  @JsonProperty("countryGroupName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String countryGroupName;

  @JsonProperty("countryType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String countryType;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("isHidden")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean isHidden;

  @JsonProperty("isHiddenPublic")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean isHiddenPublic;

  @JsonProperty("tags")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> tags;

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
  public UpdateBasePolicyRequestV2 createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<UpdateBasePolicyRequestV2> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<UpdateBasePolicyRequestV2>>() {});
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

  public static class UpdateBasePolicyRequestV2Builder {
    private String countryType;

    public UpdateBasePolicyRequestV2Builder countryType(final String countryType) {
      this.countryType = countryType;
      return this;
    }

    public UpdateBasePolicyRequestV2Builder countryTypeFromEnum(final CountryType countryType) {
      this.countryType = countryType.toString();
      return this;
    }
  }
}
