/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.models;

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
public class FieldValidationError extends Model {

  @JsonProperty("errorCode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String errorCode;

  @JsonProperty("errorField")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String errorField;

  @JsonProperty("errorMessage")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String errorMessage;

  @JsonProperty("errorValue")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String errorValue;

  @JsonProperty("messageVariables")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, String> messageVariables;

  @JsonIgnore
  public FieldValidationError createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<FieldValidationError> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<FieldValidationError>>() {});
  }
}
