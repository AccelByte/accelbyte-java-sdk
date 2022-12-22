/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.seasonpass.models;

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
public class PassCreate extends Model {

  @JsonProperty("autoEnroll")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean autoEnroll;

  @JsonProperty("code")
  private String code;

  @JsonProperty("displayOrder")
  private Integer displayOrder;

  @JsonProperty("images")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<Image> images;

  @JsonProperty("localizations")
  private Map<String, Localization> localizations;

  @JsonProperty("passItemId")
  private String passItemId;

  @JsonIgnore
  public PassCreate createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<PassCreate> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<PassCreate>>() {});
  }
}
