/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.models;

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
public class ModelsCategoryHook extends Model {

  @JsonProperty("driver")
  private String driver;

  @JsonProperty("params")
  private String params;

  @JsonIgnore
  public String getDriver() {
    return this.driver;
  }

  @JsonIgnore
  public Driver getDriverAsEnum() {
    return Driver.valueOf(this.driver);
  }

  @JsonIgnore
  public void setDriver(final String driver) {
    this.driver = driver;
  }

  @JsonIgnore
  public void setDriverFromEnum(final Driver driver) {
    this.driver = driver.toString();
  }

  @JsonIgnore
  public ModelsCategoryHook createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsCategoryHook> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsCategoryHook>>() {});
  }

  public enum Driver {
    KAFKA("KAFKA");

    private String value;

    Driver(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ModelsCategoryHookBuilder {
    private String driver;

    public ModelsCategoryHookBuilder driver(final String driver) {
      this.driver = driver;
      return this;
    }

    public ModelsCategoryHookBuilder driverFromEnum(final Driver driver) {
      this.driver = driver.toString();
      return this;
    }
  }
}
