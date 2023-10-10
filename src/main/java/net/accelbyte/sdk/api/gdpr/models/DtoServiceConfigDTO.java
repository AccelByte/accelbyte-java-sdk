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
public class DtoServiceConfigDTO extends Model {

  @JsonProperty("protocol")
  private String protocol;

  @JsonProperty("url")
  private String url;

  @JsonIgnore
  public String getProtocol() {
    return this.protocol;
  }

  @JsonIgnore
  public Protocol getProtocolAsEnum() {
    return Protocol.valueOf(this.protocol);
  }

  @JsonIgnore
  public void setProtocol(final String protocol) {
    this.protocol = protocol;
  }

  @JsonIgnore
  public void setProtocolFromEnum(final Protocol protocol) {
    this.protocol = protocol.toString();
  }

  @JsonIgnore
  public DtoServiceConfigDTO createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<DtoServiceConfigDTO> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<DtoServiceConfigDTO>>() {});
  }

  public enum Protocol {
    GRPC("GRPC");

    private String value;

    Protocol(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class DtoServiceConfigDTOBuilder {
    private String protocol;

    public DtoServiceConfigDTOBuilder protocol(final String protocol) {
      this.protocol = protocol;
      return this;
    }

    public DtoServiceConfigDTOBuilder protocolFromEnum(final Protocol protocol) {
      this.protocol = protocol.toString();
      return this;
    }
  }
}
