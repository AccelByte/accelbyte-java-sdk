/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.Map;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
class HttpbinAnythingResponse extends Model {
  @JsonProperty("method")
  public String method;

  @JsonProperty("url")
  public String url;

  @JsonProperty("args")
  public Map<String, ?> args;

  @JsonProperty("headers")
  public Map<String, String> headers;

  @JsonProperty("form")
  public Map<String, String> form;

  @JsonProperty("data")
  public String data;

  @JsonProperty("files")
  public Map<String, String> files;
}
