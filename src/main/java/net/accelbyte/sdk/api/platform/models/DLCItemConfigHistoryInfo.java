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
public class DLCItemConfigHistoryInfo extends Model {

  @JsonProperty("autoUpdate")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean autoUpdate;

  @JsonProperty("createdAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdAt;

  @JsonProperty("dlcId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String dlcId;

  @JsonProperty("enableRevocation")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean enableRevocation;

  @JsonProperty("id")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String id;

  @JsonProperty("namespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String namespace;

  @JsonProperty("rewards")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<PlatformReward> rewards;

  @JsonProperty("rvn")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer rvn;

  @JsonProperty("updatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String updatedAt;

  @JsonIgnore
  public DLCItemConfigHistoryInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<DLCItemConfigHistoryInfo> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<DLCItemConfigHistoryInfo>>() {});
  }
}
