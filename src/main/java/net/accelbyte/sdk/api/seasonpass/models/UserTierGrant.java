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
public class UserTierGrant extends Model {

  @JsonProperty("count")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer count;

  @JsonProperty("source")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String source;

  @JsonProperty("tags")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> tags;

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
  public UserTierGrant createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<UserTierGrant> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<UserTierGrant>>() {});
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

  public static class UserTierGrantBuilder {
    private String source;

    public UserTierGrantBuilder source(final String source) {
      this.source = source;
      return this;
    }

    public UserTierGrantBuilder sourceFromEnum(final Source source) {
      this.source = source.toString();
      return this;
    }
  }
}
