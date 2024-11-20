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
public class XblClawbackEvent extends Model {

  @JsonProperty("data")
  private XblClawbackContractV2 data;

  @JsonProperty("datacontenttype")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String datacontenttype;

  @JsonProperty("id")
  private String id;

  @JsonProperty("source")
  private String source;

  @JsonProperty("specVersion")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String specVersion;

  @JsonProperty("subject")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String subject;

  @JsonProperty("time")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String time;

  @JsonProperty("traceparent")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String traceparent;

  @JsonProperty("type")
  private String type;

  @JsonIgnore
  public XblClawbackEvent createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<XblClawbackEvent> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<XblClawbackEvent>>() {});
  }
}
