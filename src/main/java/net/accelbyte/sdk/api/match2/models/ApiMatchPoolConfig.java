/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.match2.models;

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
public class ApiMatchPoolConfig extends Model {

  @JsonProperty("backfill_ticket_expiration_seconds")
  private Integer backfillTicketExpirationSeconds;

  @JsonProperty("match_function")
  private String matchFunction;

  @JsonProperty("rule_set")
  private String ruleSet;

  @JsonProperty("session_template")
  private String sessionTemplate;

  @JsonProperty("ticket_expiration_seconds")
  private Integer ticketExpirationSeconds;

  @JsonIgnore
  public ApiMatchPoolConfig createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApiMatchPoolConfig> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ApiMatchPoolConfig>>() {});
  }
}
