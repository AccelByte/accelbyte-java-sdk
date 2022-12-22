/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.models;

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
public class ModelDeviceBanResponseV4 extends Model {

  @JsonProperty("bannedAt")
  private Integer bannedAt;

  @JsonProperty("bannedBy")
  private String bannedBy;

  @JsonProperty("comment")
  private String comment;

  @JsonProperty("deviceId")
  private String deviceId;

  @JsonProperty("deviceType")
  private String deviceType;

  @JsonProperty("disabledAt")
  private Integer disabledAt;

  @JsonProperty("enabled")
  private Boolean enabled;

  @JsonProperty("endDate")
  private Integer endDate;

  @JsonProperty("id")
  private String id;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("reason")
  private String reason;

  @JsonProperty("targetNamespace")
  private String targetNamespace;

  @JsonIgnore
  public ModelDeviceBanResponseV4 createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelDeviceBanResponseV4> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelDeviceBanResponseV4>>() {});
  }
}
