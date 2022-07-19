/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Requirement extends Model {

  @JsonProperty("additionals")
  private String additionals;

  @JsonProperty("directXVersion")
  private String directXVersion;

  @JsonProperty("diskSpace")
  private String diskSpace;

  @JsonProperty("graphics")
  private String graphics;

  @JsonProperty("label")
  private String label;

  @JsonProperty("osVersion")
  private String osVersion;

  @JsonProperty("processor")
  private String processor;

  @JsonProperty("ram")
  private String ram;

  @JsonProperty("soundCard")
  private String soundCard;

  @JsonIgnore
  public Requirement createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<Requirement> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<Requirement>>() {});
  }
}
