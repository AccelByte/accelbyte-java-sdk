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
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ModelsCustomFunction extends Model {

  @JsonProperty("afterBulkReadAdminGameRecord")
  private Boolean afterBulkReadAdminGameRecord;

  @JsonProperty("afterBulkReadAdminPlayerRecord")
  private Boolean afterBulkReadAdminPlayerRecord;

  @JsonProperty("afterBulkReadGameRecord")
  private Boolean afterBulkReadGameRecord;

  @JsonProperty("afterBulkReadPlayerRecord")
  private Boolean afterBulkReadPlayerRecord;

  @JsonProperty("afterReadAdminGameRecord")
  private Boolean afterReadAdminGameRecord;

  @JsonProperty("afterReadAdminPlayerRecord")
  private Boolean afterReadAdminPlayerRecord;

  @JsonProperty("afterReadGameRecord")
  private Boolean afterReadGameRecord;

  @JsonProperty("afterReadPlayerRecord")
  private Boolean afterReadPlayerRecord;

  @JsonProperty("beforeWriteAdminGameRecord")
  private Boolean beforeWriteAdminGameRecord;

  @JsonProperty("beforeWriteAdminPlayerRecord")
  private Boolean beforeWriteAdminPlayerRecord;

  @JsonProperty("beforeWriteGameRecord")
  private Boolean beforeWriteGameRecord;

  @JsonProperty("beforeWritePlayerRecord")
  private Boolean beforeWritePlayerRecord;

  @JsonIgnore
  public ModelsCustomFunction createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsCustomFunction> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsCustomFunction>>() {});
  }
}
