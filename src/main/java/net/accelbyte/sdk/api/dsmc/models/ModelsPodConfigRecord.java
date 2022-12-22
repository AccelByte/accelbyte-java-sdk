/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.models;

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
public class ModelsPodConfigRecord extends Model {

  @JsonProperty("cpu_limit")
  private Integer cpuLimit;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("mem_limit")
  private Integer memLimit;

  @JsonProperty("modifiedBy")
  private String modifiedBy;

  @JsonProperty("name")
  private String name;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("params")
  private String params;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonIgnore
  public ModelsPodConfigRecord createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsPodConfigRecord> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsPodConfigRecord>>() {});
  }
}
