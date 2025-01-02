/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.models;

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
public class DtoPlatformAccountClosureClientResponse extends Model {

  @JsonProperty("bpCertExpireAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Long bpCertExpireAt;

  @JsonProperty("bpCertFileName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String bpCertFileName;

  @JsonProperty("clientId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String clientId;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("platform")
  private String platform;

  @JsonProperty("publisherKey")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String publisherKey;

  @JsonProperty("sandboxId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String sandboxId;

  @JsonProperty("secret")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String secret;

  @JsonProperty("updatedAt")
  private Long updatedAt;

  @JsonIgnore
  public DtoPlatformAccountClosureClientResponse createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<DtoPlatformAccountClosureClientResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<DtoPlatformAccountClosureClientResponse>>() {});
  }
}
