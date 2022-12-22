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
public class RetrieveUserAcceptedAgreementResponse extends Model {

  @JsonProperty("createdAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdAt;

  @JsonProperty("displayName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String displayName;

  @JsonProperty("email")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String email;

  @JsonProperty("id")
  private String id;

  @JsonProperty("isAccepted")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean isAccepted;

  @JsonProperty("localizedPolicyVersion")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private LocalizedPolicyVersionObject localizedPolicyVersion;

  @JsonProperty("namespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String namespace;

  @JsonProperty("policyName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String policyName;

  @JsonProperty("policyType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String policyType;

  @JsonProperty("publisherUserId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String publisherUserId;

  @JsonProperty("signingDate")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String signingDate;

  @JsonProperty("updatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String updatedAt;

  @JsonProperty("userId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String userId;

  @JsonProperty("username")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String username;

  @JsonIgnore
  public RetrieveUserAcceptedAgreementResponse createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RetrieveUserAcceptedAgreementResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<RetrieveUserAcceptedAgreementResponse>>() {});
  }
}
