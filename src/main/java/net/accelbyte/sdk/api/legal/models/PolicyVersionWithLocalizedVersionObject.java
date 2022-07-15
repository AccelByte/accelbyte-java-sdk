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
public class PolicyVersionWithLocalizedVersionObject extends Model {

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

  @JsonProperty("isInEffect")
  private Boolean isInEffect;

  @JsonProperty("localizedPolicyVersions")
  private List<LocalizedPolicyVersionObject> localizedPolicyVersions;

  @JsonProperty("publishedDate")
  private String publishedDate;

  @JsonProperty("status")
  private String status;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonIgnore
  public PolicyVersionWithLocalizedVersionObject createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<PolicyVersionWithLocalizedVersionObject> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<PolicyVersionWithLocalizedVersionObject>>() {});
  }
}
