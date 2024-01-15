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
public class ModelsPlayerBinaryRecordCreate extends Model {

  @JsonProperty("file_type")
  private String fileType;

  @JsonProperty("is_public")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean isPublic;

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
  public ModelsPlayerBinaryRecordCreate createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsPlayerBinaryRecordCreate> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsPlayerBinaryRecordCreate>>() {});
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

  public static class ModelsPlayerBinaryRecordCreateBuilder {
    private String setBy;

    public ModelsPlayerBinaryRecordCreateBuilder setBy(final String setBy) {
      this.setBy = setBy;
      return this;
    }

    public ModelsPlayerBinaryRecordCreateBuilder setByFromEnum(final SetBy setBy) {
      this.setBy = setBy.toString();
      return this;
    }
  }
}
