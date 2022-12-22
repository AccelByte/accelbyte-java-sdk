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
public class AccountcommonUserInformationV3 extends Model {

  @JsonProperty("country")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String country;

  @JsonProperty("displayName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String displayName;

  @JsonProperty("emailAddresses")
  private List<String> emailAddresses;

  @JsonProperty("phoneNumber")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String phoneNumber;

  @JsonProperty("platformUsers")
  private List<AccountcommonPlatformUserInformationV3> platformUsers;

  @JsonProperty("username")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String username;

  @JsonProperty("xboxUserId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String xboxUserId;

  @JsonIgnore
  public AccountcommonUserInformationV3 createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<AccountcommonUserInformationV3> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<AccountcommonUserInformationV3>>() {});
  }
}
