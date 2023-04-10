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
public class SectionCreate extends Model {

  @JsonProperty("active")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean active;

  @JsonProperty("displayOrder")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer displayOrder;

  @JsonProperty("endDate")
  private String endDate;

  @JsonProperty("ext")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> ext;

  @JsonProperty("fixedPeriodRotationConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private FixedPeriodRotationConfig fixedPeriodRotationConfig;

  @JsonProperty("items")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<SectionItem> items;

  @JsonProperty("localizations")
  private Map<String, Localization> localizations;

  @JsonProperty("name")
  private String name;

  @JsonProperty("rotationType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String rotationType;

  @JsonProperty("startDate")
  private String startDate;

  @JsonProperty("viewId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String viewId;

  @JsonIgnore
  public String getRotationType() {
    return this.rotationType;
  }

  @JsonIgnore
  public RotationType getRotationTypeAsEnum() {
    return RotationType.valueOf(this.rotationType);
  }

  @JsonIgnore
  public void setRotationType(final String rotationType) {
    this.rotationType = rotationType;
  }

  @JsonIgnore
  public void setRotationTypeFromEnum(final RotationType rotationType) {
    this.rotationType = rotationType.toString();
  }

  @JsonIgnore
  public SectionCreate createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<SectionCreate> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<SectionCreate>>() {});
  }

  public enum RotationType {
    CUSTOM("CUSTOM"),
    FIXEDPERIOD("FIXED_PERIOD"),
    NONE("NONE");

    private String value;

    RotationType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class SectionCreateBuilder {
    private String rotationType;

    public SectionCreateBuilder rotationType(final String rotationType) {
      this.rotationType = rotationType;
      return this;
    }

    public SectionCreateBuilder rotationTypeFromEnum(final RotationType rotationType) {
      this.rotationType = rotationType.toString();
      return this;
    }
  }
}
