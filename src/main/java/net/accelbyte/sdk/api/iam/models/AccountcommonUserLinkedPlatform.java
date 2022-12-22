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
public class AccountcommonUserLinkedPlatform extends Model {

  @JsonProperty("DisplayName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String displayName;

  @JsonProperty("EmailAddress")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String emailAddress;

  @JsonProperty("LinkedAt")
  private String linkedAt;

  @JsonProperty("Namespace")
  private String namespace;

  @JsonProperty("OriginNamespace")
  private String originNamespace;

  @JsonProperty("PlatformId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platformId;

  @JsonProperty("PlatformUserId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platformUserId;

  @JsonProperty("UserId")
  private String userId;

  @JsonProperty("XUID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String xuid;

  @JsonIgnore
  public AccountcommonUserLinkedPlatform createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<AccountcommonUserLinkedPlatform> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<AccountcommonUserLinkedPlatform>>() {});
  }
}
