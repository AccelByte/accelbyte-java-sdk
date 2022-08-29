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
/*
 *  @deprecated 2022-08-29 All args constructor may cause problems. Use builder instead.
 */
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ClientmodelClientUpdateV3Request extends Model {

  @JsonProperty("audiences")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> audiences;

  @JsonProperty("baseUri")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String baseUri;

  @JsonProperty("clientName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String clientName;

  @JsonProperty("clientPermissions")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<AccountcommonPermissionV3> clientPermissions;

  @JsonProperty("clientPlatform")
  private String clientPlatform;

  @JsonProperty("deletable")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean deletable;

  @JsonProperty("namespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String namespace;

  @JsonProperty("redirectUri")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String redirectUri;

  @JsonIgnore
  public ClientmodelClientUpdateV3Request createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ClientmodelClientUpdateV3Request> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ClientmodelClientUpdateV3Request>>() {});
  }
}
