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
public class RetrieveLocalizedPolicyVersionPublicResponse extends Model {

  @JsonProperty("attachmentChecksum")
  private String attachmentChecksum;

  @JsonProperty("attachmentLocation")
  private String attachmentLocation;

  @JsonProperty("attachmentVersionIdentifier")
  private String attachmentVersionIdentifier;

  @JsonProperty("basePolicyId")
  private String basePolicyId;

  @JsonProperty("baseUrls")
  private List<String> baseUrls;

  @JsonProperty("contentType")
  private String contentType;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("description")
  private String description;

  @JsonProperty("id")
  private String id;

  @JsonProperty("localeCode")
  private String localeCode;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("policy")
  private PolicyObject policy;

  @JsonProperty("policyVersion")
  private PolicyVersionObject policyVersion;

  @JsonProperty("tags")
  private List<String> tags;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonIgnore
  public RetrieveLocalizedPolicyVersionPublicResponse createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RetrieveLocalizedPolicyVersionPublicResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(
            json, new TypeReference<List<RetrieveLocalizedPolicyVersionPublicResponse>>() {});
  }
}
