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
public class LocalizedPassInfo extends Model {

  @JsonProperty("autoEnroll")
  private Boolean autoEnroll;

  @JsonProperty("code")
  private String code;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("displayOrder")
  private String displayOrder;

  @JsonProperty("images")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<Image> images;

  @JsonProperty("language")
  private String language;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("passItemId")
  private String passItemId;

  @JsonProperty("seasonId")
  private String seasonId;

  @JsonProperty("title")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String title;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonIgnore
  public LocalizedPassInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<LocalizedPassInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<LocalizedPassInfo>>() {});
  }
}
