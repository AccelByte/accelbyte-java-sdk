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
public class CreatePolicyVersionResponse extends Model {

  @JsonProperty("basePolicyId")
  private String basePolicyId;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("description")
  private String description;

  @JsonProperty("displayVersion")
  private String displayVersion;

  @JsonProperty("id")
  private String id;

  @JsonProperty("isCommitted")
  private Boolean isCommitted;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonIgnore
  public CreatePolicyVersionResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<CreatePolicyVersionResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<CreatePolicyVersionResponse>>() {});
  }
}
