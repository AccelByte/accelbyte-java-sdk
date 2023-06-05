/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.models;

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
public class ModelsBucketMMRRule extends Model {

  @JsonProperty("disable_authority")
  private Boolean disableAuthority;

  @JsonProperty("flex_authority_count")
  private Integer flexAuthorityCount;

  @JsonProperty("flex_flat_step_range")
  private Integer flexFlatStepRange;

  @JsonProperty("flex_immunity_count")
  private Integer flexImmunityCount;

  @JsonProperty("flex_range_max")
  private Integer flexRangeMax;

  @JsonProperty("flex_rate_ms")
  private Integer flexRateMs;

  @JsonProperty("flex_step_max")
  private Integer flexStepMax;

  @JsonProperty("force_authority_match")
  private Boolean forceAuthorityMatch;

  @JsonProperty("initial_step_range")
  private Integer initialStepRange;

  @JsonProperty("mmr_max")
  private Integer mmrMax;

  @JsonProperty("mmr_mean")
  private Integer mmrMean;

  @JsonProperty("mmr_min")
  private Integer mmrMin;

  @JsonProperty("mmr_std_dev")
  private Integer mmrStdDev;

  @JsonProperty("override_mmr_data")
  private Boolean overrideMmrData;

  @JsonProperty("use_bucket_mmr")
  private Boolean useBucketMmr;

  @JsonProperty("use_flat_flex_step")
  private Boolean useFlatFlexStep;

  @JsonIgnore
  public ModelsBucketMMRRule createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsBucketMMRRule> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsBucketMMRRule>>() {});
  }
}
