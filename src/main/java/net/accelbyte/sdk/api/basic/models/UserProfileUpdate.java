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
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class UserProfileUpdate extends Model {

  @JsonProperty("avatarLargeUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String avatarLargeUrl;

  @JsonProperty("avatarSmallUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String avatarSmallUrl;

  @JsonProperty("avatarUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String avatarUrl;

  @JsonProperty("customAttributes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> customAttributes;

  @JsonProperty("dateOfBirth")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String dateOfBirth;

  @JsonProperty("firstName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String firstName;

  @JsonProperty("language")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String language;

  @JsonProperty("lastName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String lastName;

  @JsonProperty("privateCustomAttributes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> privateCustomAttributes;

  @JsonProperty("timeZone")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String timeZone;

  @JsonProperty("zipCode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String zipCode;

  @JsonIgnore
  public UserProfileUpdate createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<UserProfileUpdate> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<UserProfileUpdate>>() {});
  }
}
