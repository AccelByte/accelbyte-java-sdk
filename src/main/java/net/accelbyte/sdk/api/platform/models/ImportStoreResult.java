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
public class ImportStoreResult extends Model {

  @JsonProperty("errors")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ImportStoreError> errors;

  @JsonProperty("storeInfo")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private StoreInfo storeInfo;

  @JsonProperty("success")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean success;

  @JsonIgnore
  public ImportStoreResult createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ImportStoreResult> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ImportStoreResult>>() {});
  }
}
