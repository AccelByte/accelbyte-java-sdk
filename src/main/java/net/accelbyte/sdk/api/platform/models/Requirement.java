/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

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
public class Requirement extends Model {

  @JsonProperty("additionals")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String additionals;

  @JsonProperty("directXVersion")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String directXVersion;

  @JsonProperty("diskSpace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String diskSpace;

  @JsonProperty("graphics")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String graphics;

  @JsonProperty("label")
  private String label;

  @JsonProperty("osVersion")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String osVersion;

  @JsonProperty("processor")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String processor;

  @JsonProperty("ram")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String ram;

  @JsonProperty("soundCard")
  @JsonInclude(JsonInclude.Include.NON_NULL)
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
