/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionhistory.models;

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
public class ModelsParty extends Model {

  @JsonProperty("Attributes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> attributes;

  @JsonProperty("Code")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String code;

  @JsonProperty("Configuration")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsSessionConfiguration configuration;

  @JsonProperty("ConfigurationName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String configurationName;

  @JsonProperty("CreatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdAt;

  @JsonProperty("CreatedBy")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdBy;

  @JsonProperty("ExpiredAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String expiredAt;

  @JsonProperty("ID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String id;

  @JsonProperty("IsActive")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean isActive;

  @JsonProperty("IsFull")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean isFull;

  @JsonProperty("LeaderID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String leaderID;

  @JsonProperty("Members")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsUser> members;

  @JsonProperty("Namespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String namespace;

  @JsonProperty("UpdatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String updatedAt;

  @JsonProperty("Version")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer version;

  @JsonIgnore
  public ModelsParty createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsParty> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsParty>>() {});
  }
}
