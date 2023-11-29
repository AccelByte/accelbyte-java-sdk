/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.models;

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
public class ModelsUpdateContentResponseV2 extends Model {

  @JsonProperty("channelId")
  private String channelId;

  @JsonProperty("contentType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String contentType;

  @JsonProperty("createdTime")
  private String createdTime;

  @JsonProperty("customAttributes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> customAttributes;

  @JsonProperty("fileExtension")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String fileExtension;

  @JsonProperty("fileLocation")
  private String fileLocation;

  @JsonProperty("id")
  private String id;

  @JsonProperty("isHidden")
  private Boolean isHidden;

  @JsonProperty("isOfficial")
  private Boolean isOfficial;

  @JsonProperty("name")
  private String name;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("parentNamespace")
  private String parentNamespace;

  @JsonProperty("payloadURL")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsPayloadURL> payloadURL;

  @JsonProperty("shareCode")
  private String shareCode;

  @JsonProperty("subType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String subType;

  @JsonProperty("tags")
  private List<String> tags;

  @JsonProperty("type")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String type;

  @JsonProperty("updatedTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String updatedTime;

  @JsonProperty("userId")
  private String userId;

  @JsonIgnore
  public ModelsUpdateContentResponseV2 createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsUpdateContentResponseV2> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsUpdateContentResponseV2>>() {});
  }
}