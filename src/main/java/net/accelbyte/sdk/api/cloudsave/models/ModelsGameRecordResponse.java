/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.models;

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
public class ModelsGameRecordResponse extends Model {

  @JsonProperty("created_at")
  private String createdAt;

  @JsonProperty("key")
  private String key;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("set_by")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String setBy;

  @JsonProperty("updated_at")
  private String updatedAt;

  @JsonProperty("value")
  private Map<String, ?> value;

  @JsonIgnore
  public ModelsGameRecordResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsGameRecordResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsGameRecordResponse>>() {});
  }
}
