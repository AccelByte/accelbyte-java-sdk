/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.models;

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
public class RetrievePolicyResponse extends Model {

  @JsonProperty("countryCode")
  private String countryCode;

  @JsonProperty("countryGroupCode")
  private String countryGroupCode;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("description")
  private String description;

  @JsonProperty("id")
  private String id;

  @JsonProperty("isDefaultOpted")
  private Boolean isDefaultOpted;

  @JsonProperty("isDefaultSelection")
  private Boolean isDefaultSelection;

  @JsonProperty("isMandatory")
  private Boolean isMandatory;

  @JsonProperty("policyName")
  private String policyName;

  @JsonProperty("policyVersions")
  private List<PolicyVersionObject> policyVersions;

  @JsonProperty("readableId")
  private String readableId;

  @JsonProperty("shouldNotifyOnUpdate")
  private Boolean shouldNotifyOnUpdate;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonIgnore
  public RetrievePolicyResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RetrievePolicyResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<RetrievePolicyResponse>>() {});
  }
}
