/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.seasonpass.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import lombok.*;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ExcessStrategy extends Model {

  @JsonProperty("currency")
  private String currency;

  @JsonProperty("method")
  private String method;

  @JsonProperty("percentPerExp")
  private Integer percentPerExp;

  @JsonIgnore
  public String getMethod() {
    return this.method;
  }

  @JsonIgnore
  public Method getMethodAsEnum() {
    return Method.valueOf(this.method);
  }

  @JsonIgnore
  public void setMethod(final String method) {
    this.method = method;
  }

  @JsonIgnore
  public void setMethodFromEnum(final Method method) {
    this.method = method.toString();
  }

  @JsonIgnore
  public ExcessStrategy createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ExcessStrategy> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ExcessStrategy>>() {});
  }

  public enum Method {
    CURRENCY("CURRENCY"),
    NONE("NONE");

    private String value;

    Method(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ExcessStrategyBuilder {
    private String method;

    public ExcessStrategyBuilder method(final String method) {
      this.method = method;
      return this;
    }

    public ExcessStrategyBuilder methodFromEnum(final Method method) {
      this.method = method.toString();
      return this;
    }
  }
}
