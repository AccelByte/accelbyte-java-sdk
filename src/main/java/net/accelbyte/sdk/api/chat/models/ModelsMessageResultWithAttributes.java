/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.models;

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
public class ModelsMessageResultWithAttributes extends Model {

  @JsonProperty("action")
  private String action;

  @JsonProperty("attributes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> attributes;

  @JsonProperty("cencoredWords")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> cencoredWords;

  @JsonProperty("classifications")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> classifications;

  @JsonProperty("finalMessage")
  private String finalMessage;

  @JsonProperty("id")
  private String id;

  @JsonProperty("referenceId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String referenceId;

  @JsonProperty("timestamp")
  private Integer timestamp;

  @JsonIgnore
  public ModelsMessageResultWithAttributes createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsMessageResultWithAttributes> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsMessageResultWithAttributes>>() {});
  }
}
