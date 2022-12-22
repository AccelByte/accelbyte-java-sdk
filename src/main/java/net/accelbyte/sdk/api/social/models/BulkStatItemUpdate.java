/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.models;

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
public class BulkStatItemUpdate extends Model {

  @JsonProperty("additionalData")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> additionalData;

  @JsonProperty("statCode")
  private String statCode;

  @JsonProperty("updateStrategy")
  private String updateStrategy;

  @JsonProperty("value")
  private Float value;

  @JsonIgnore
  public String getUpdateStrategy() {
    return this.updateStrategy;
  }

  @JsonIgnore
  public UpdateStrategy getUpdateStrategyAsEnum() {
    return UpdateStrategy.valueOf(this.updateStrategy);
  }

  @JsonIgnore
  public void setUpdateStrategy(final String updateStrategy) {
    this.updateStrategy = updateStrategy;
  }

  @JsonIgnore
  public void setUpdateStrategyFromEnum(final UpdateStrategy updateStrategy) {
    this.updateStrategy = updateStrategy.toString();
  }

  @JsonIgnore
  public BulkStatItemUpdate createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<BulkStatItemUpdate> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<BulkStatItemUpdate>>() {});
  }

  public enum UpdateStrategy {
    INCREMENT("INCREMENT"),
    MAX("MAX"),
    MIN("MIN"),
    OVERRIDE("OVERRIDE");

    private String value;

    UpdateStrategy(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class BulkStatItemUpdateBuilder {
    private String updateStrategy;

    public BulkStatItemUpdateBuilder updateStrategy(final String updateStrategy) {
      this.updateStrategy = updateStrategy;
      return this;
    }

    public BulkStatItemUpdateBuilder updateStrategyFromEnum(final UpdateStrategy updateStrategy) {
      this.updateStrategy = updateStrategy.toString();
      return this;
    }
  }
}
