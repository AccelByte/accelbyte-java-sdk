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
public class ModelsAdminUpdateContentRequestV2 extends Model {

  @JsonProperty("customAttributes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> customAttributes;

  @JsonProperty("name")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String name;

  @JsonProperty("shareCode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String shareCode;

  @JsonProperty("subType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String subType;

  @JsonProperty("tags")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> tags;

  @JsonProperty("type")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String type;

  @JsonIgnore
  public ModelsAdminUpdateContentRequestV2 createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsAdminUpdateContentRequestV2> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsAdminUpdateContentRequestV2>>() {});
  }
}
