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
public class AccountcommonDistinctLinkedPlatformV3 extends Model {

  @JsonProperty("details")
  private List<AccountcommonSimpleUserPlatformInfoV3> details;

  @JsonProperty("linkedAt")
  private String linkedAt;

  @JsonProperty("platformName")
  private String platformName;

  @JsonProperty("platformUserId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platformUserId;

  @JsonIgnore
  public AccountcommonDistinctLinkedPlatformV3 createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<AccountcommonDistinctLinkedPlatformV3> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<AccountcommonDistinctLinkedPlatformV3>>() {});
  }
}
