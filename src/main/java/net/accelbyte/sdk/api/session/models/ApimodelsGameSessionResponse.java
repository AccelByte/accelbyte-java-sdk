/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.models;

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
public class ApimodelsGameSessionResponse extends Model {

  @JsonProperty("DSInformation")
  private ApimodelsDSInformationResponse dsInformation;

  @JsonProperty("attributes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> attributes;

  @JsonProperty("backfillTicketID")
  private String backfillTicketID;

  @JsonProperty("configuration")
  private ApimodelsPublicConfiguration configuration;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("createdBy")
  private String createdBy;

  @JsonProperty("expiredAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String expiredAt;

  @JsonProperty("id")
  private String id;

  @JsonProperty("isActive")
  private Boolean isActive;

  @JsonProperty("isFull")
  private Boolean isFull;

  @JsonProperty("leaderID")
  private String leaderID;

  @JsonProperty("matchPool")
  private String matchPool;

  @JsonProperty("members")
  private List<ApimodelsUserResponse> members;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("teams")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsTeam> teams;

  @JsonProperty("ticketIDs")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> ticketIDs;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("version")
  private Integer version;

  @JsonIgnore
  public ApimodelsGameSessionResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsGameSessionResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsGameSessionResponse>>() {});
  }
}
