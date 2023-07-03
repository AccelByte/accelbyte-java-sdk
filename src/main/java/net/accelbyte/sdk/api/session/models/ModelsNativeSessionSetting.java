/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.models;

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
public class ModelsNativeSessionSetting extends Model {

  @JsonProperty("PSNServiceLabel")
  private Integer psnServiceLabel;

  @JsonProperty("PSNSupportedPlatforms")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> psnSupportedPlatforms;

  @JsonProperty("SessionTitle")
  private String sessionTitle;

  @JsonProperty("ShouldSync")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean shouldSync;

  @JsonProperty("XboxServiceConfigID")
  private String xboxServiceConfigID;

  @JsonProperty("XboxSessionTemplateName")
  private String xboxSessionTemplateName;

  @JsonProperty("localizedSessionName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> localizedSessionName;

  @JsonIgnore
  public ModelsNativeSessionSetting createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsNativeSessionSetting> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsNativeSessionSetting>>() {});
  }
}
