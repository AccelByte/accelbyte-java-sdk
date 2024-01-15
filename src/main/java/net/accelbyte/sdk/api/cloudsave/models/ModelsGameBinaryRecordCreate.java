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
public class ModelsGameBinaryRecordCreate extends Model {

  @JsonProperty("file_type")
  private String fileType;

  @JsonProperty("key")
  private String key;

  @JsonProperty("set_by")
  private String setBy;

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
  public ModelsGameBinaryRecordCreate createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsGameBinaryRecordCreate> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsGameBinaryRecordCreate>>() {});
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

  public static class ModelsGameBinaryRecordCreateBuilder {
    private String setBy;

    public ModelsGameBinaryRecordCreateBuilder setBy(final String setBy) {
      this.setBy = setBy;
      return this;
    }

    public ModelsGameBinaryRecordCreateBuilder setByFromEnum(final SetBy setBy) {
      this.setBy = setBy.toString();
      return this;
    }
  }
}
