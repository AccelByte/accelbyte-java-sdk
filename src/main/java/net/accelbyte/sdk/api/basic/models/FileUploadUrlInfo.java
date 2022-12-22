/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.models;

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
public class FileUploadUrlInfo extends Model {

  @JsonProperty("accessUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String accessUrl;

  @JsonProperty("contentType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String contentType;

  @JsonProperty("method")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String method;

  @JsonProperty("url")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String url;

  @JsonIgnore
  public FileUploadUrlInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<FileUploadUrlInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<FileUploadUrlInfo>>() {});
  }
}
