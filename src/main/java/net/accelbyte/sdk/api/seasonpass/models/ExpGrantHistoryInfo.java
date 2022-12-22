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
public class ExpGrantHistoryInfo extends Model {

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("grantExp")
  private Integer grantExp;

  @JsonProperty("id")
  private String id;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("seasonId")
  private String seasonId;

  @JsonProperty("source")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String source;

  @JsonProperty("tags")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> tags;

  @JsonProperty("userId")
  private String userId;

  @JsonIgnore
  public String getSource() {
    return this.source;
  }

  @JsonIgnore
  public Source getSourceAsEnum() {
    return Source.valueOf(this.source);
  }

  @JsonIgnore
  public void setSource(final String source) {
    this.source = source;
  }

  @JsonIgnore
  public void setSourceFromEnum(final Source source) {
    this.source = source.toString();
  }

  @JsonIgnore
  public ExpGrantHistoryInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ExpGrantHistoryInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ExpGrantHistoryInfo>>() {});
  }

  public enum Source {
    PAIDFOR("PAID_FOR"),
    SWEAT("SWEAT");

    private String value;

    Source(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ExpGrantHistoryInfoBuilder {
    private String source;

    public ExpGrantHistoryInfoBuilder source(final String source) {
      this.source = source;
      return this;
    }

    public ExpGrantHistoryInfoBuilder sourceFromEnum(final Source source) {
      this.source = source.toString();
      return this;
    }
  }
}
