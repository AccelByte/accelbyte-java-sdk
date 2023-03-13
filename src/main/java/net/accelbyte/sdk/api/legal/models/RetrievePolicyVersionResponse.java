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
// deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class RetrievePolicyVersionResponse extends Model {

  @JsonProperty("basePolicyId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String basePolicyId;

  @JsonProperty("createdAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdAt;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
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
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<LocalizedPolicyVersionObject> localizedPolicyVersions;

  @JsonProperty("policyId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String policyId;

  @JsonProperty("publishedDate")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String publishedDate;

  @JsonProperty("status")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String status;

  @JsonProperty("updatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String updatedAt;

  @JsonIgnore
  public RetrievePolicyVersionResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RetrievePolicyVersionResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<RetrievePolicyVersionResponse>>() {});
  }
}
