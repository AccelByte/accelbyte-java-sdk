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
public class GrpcServerInfo extends Model {

  @JsonProperty("address")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String address;

  @JsonProperty("connectionTypeEnum")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String connectionTypeEnum;

  @JsonProperty("status")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String status;

  @JsonProperty("tlsConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private TLSConfig tlsConfig;

  @JsonIgnore
  public String getConnectionTypeEnum() {
    return this.connectionTypeEnum;
  }

  @JsonIgnore
  public ConnectionTypeEnum getConnectionTypeEnumAsEnum() {
    return ConnectionTypeEnum.valueOf(this.connectionTypeEnum);
  }

  @JsonIgnore
  public void setConnectionTypeEnum(final String connectionTypeEnum) {
    this.connectionTypeEnum = connectionTypeEnum;
  }

  @JsonIgnore
  public void setConnectionTypeEnumFromEnum(final ConnectionTypeEnum connectionTypeEnum) {
    this.connectionTypeEnum = connectionTypeEnum.toString();
  }

  @JsonIgnore
  public GrpcServerInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<GrpcServerInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<GrpcServerInfo>>() {});
  }

  public enum ConnectionTypeEnum {
    INSECURE("INSECURE"),
    TLS("TLS");

    private String value;

    ConnectionTypeEnum(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class GrpcServerInfoBuilder {
    private String connectionTypeEnum;

    public GrpcServerInfoBuilder connectionTypeEnum(final String connectionTypeEnum) {
      this.connectionTypeEnum = connectionTypeEnum;
      return this;
    }

    public GrpcServerInfoBuilder connectionTypeEnumFromEnum(
        final ConnectionTypeEnum connectionTypeEnum) {
      this.connectionTypeEnum = connectionTypeEnum.toString();
      return this;
    }
  }
}
