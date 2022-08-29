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
/*
 *  @deprecated 2022-08-29 All args constructor may cause problems. Use builder instead.
 */
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class StatCreate extends Model {

  @JsonProperty("defaultValue")
  private Float defaultValue;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("incrementOnly")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean incrementOnly;

  @JsonProperty("maximum")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Float maximum;

  @JsonProperty("minimum")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Float minimum;

  @JsonProperty("name")
  private String name;

  @JsonProperty("setAsGlobal")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean setAsGlobal;

  @JsonProperty("setBy")
  private String setBy;

  @JsonProperty("statCode")
  private String statCode;

  @JsonProperty("tags")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> tags;

  @JsonIgnore
  public String getSetBy() {
    return this.setBy;
  }

  @JsonIgnore
  public SetBy getSetByAsEnum() {
    return SetBy.valueOf(this.setBy);
  }

  @JsonIgnore
  public void setSetBy(final String setBy) {
    this.setBy = setBy;
  }

  @JsonIgnore
  public void setSetByFromEnum(final SetBy setBy) {
    this.setBy = setBy.toString();
  }

  @JsonIgnore
  public StatCreate createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<StatCreate> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<StatCreate>>() {});
  }

  public enum SetBy {
    CLIENT("CLIENT"),
    SERVER("SERVER");

    private String value;

    SetBy(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class StatCreateBuilder {
    private String setBy;

    public StatCreateBuilder setBy(final String setBy) {
      this.setBy = setBy;
      return this;
    }

    public StatCreateBuilder setByFromEnum(final SetBy setBy) {
      this.setBy = setBy.toString();
      return this;
    }
  }
}
