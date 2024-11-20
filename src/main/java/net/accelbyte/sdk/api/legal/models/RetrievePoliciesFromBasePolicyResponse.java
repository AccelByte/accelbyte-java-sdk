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
public class RetrievePoliciesFromBasePolicyResponse extends Model {

  @JsonProperty("activeVersion")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String activeVersion;

  @JsonProperty("countries")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> countries;

  @JsonProperty("countryCode")
  private String countryCode;

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

  @JsonProperty("id")
  private String id;

  @JsonProperty("isActive")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> isActive;

  @JsonProperty("lastPublished")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String lastPublished;

  @JsonProperty("policyName")
  private String policyName;

  @JsonProperty("policyVersions")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<PolicyVersionObject> policyVersions;

  @JsonProperty("updatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String updatedAt;

  @JsonIgnore
  public RetrievePoliciesFromBasePolicyResponse createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RetrievePoliciesFromBasePolicyResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<RetrievePoliciesFromBasePolicyResponse>>() {});
  }
}
