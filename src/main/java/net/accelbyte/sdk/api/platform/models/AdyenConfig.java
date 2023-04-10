/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

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
public class AdyenConfig extends Model {

  @JsonProperty("allowedPaymentMethods")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> allowedPaymentMethods;

  @JsonProperty("apiKey")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String apiKey;

  @JsonProperty("authoriseAsCapture")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean authoriseAsCapture;

  @JsonProperty("blockedPaymentMethods")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> blockedPaymentMethods;

  @JsonProperty("clientKey")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String clientKey;

  @JsonProperty("dropInSettings")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String dropInSettings;

  @JsonProperty("liveEndpointUrlPrefix")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String liveEndpointUrlPrefix;

  @JsonProperty("merchantAccount")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String merchantAccount;

  @JsonProperty("notificationHmacKey")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String notificationHmacKey;

  @JsonProperty("notificationPassword")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String notificationPassword;

  @JsonProperty("notificationUsername")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String notificationUsername;

  @JsonProperty("returnUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String returnUrl;

  @JsonProperty("settings")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String settings;

  @JsonIgnore
  public AdyenConfig createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<AdyenConfig> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<AdyenConfig>>() {});
  }
}
