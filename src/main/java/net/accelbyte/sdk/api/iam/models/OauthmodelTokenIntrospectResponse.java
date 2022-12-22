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
public class OauthmodelTokenIntrospectResponse extends Model {

  @JsonProperty("active")
  private Boolean active;

  @JsonProperty("aud")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String aud;

  @JsonProperty("client_id")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String clientId;

  @JsonProperty("exp")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer exp;

  @JsonProperty("iat")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer iat;

  @JsonProperty("scope")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String scope;

  @JsonProperty("sub")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String sub;

  @JsonIgnore
  public OauthmodelTokenIntrospectResponse createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<OauthmodelTokenIntrospectResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<OauthmodelTokenIntrospectResponse>>() {});
  }
}
