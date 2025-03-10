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
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class OauthmodelErrorResponse extends Model {

  @JsonProperty("clientId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String clientId;

  @JsonProperty("default_factor")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String defaultFactor;

  @JsonProperty("email")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String email;

  @JsonProperty("error")
  private String error;

  @JsonProperty("error_description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String errorDescription;

  @JsonProperty("error_uri")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String errorUri;

  @JsonProperty("factors")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> factors;

  @JsonProperty("linkingToken")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String linkingToken;

  @JsonProperty("login_queue_ticket")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private OauthmodelLoginQueueTicketResponse loginQueueTicket;

  @JsonProperty("messageVariables")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, String> messageVariables;

  @JsonProperty("mfa_token")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String mfaToken;

  @JsonProperty("platformId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platformId;

  @JsonProperty("remainingBackupCodeCount")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer remainingBackupCodeCount;

  @JsonProperty("userBan")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private OauthmodelUserBan userBan;

  @JsonIgnore
  public OauthmodelErrorResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<OauthmodelErrorResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<OauthmodelErrorResponse>>() {});
  }
}
