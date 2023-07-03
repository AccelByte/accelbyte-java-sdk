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
public class PublicCustomConfigInfo extends Model {

  @JsonProperty("connectionType")
  private String connectionType;

  @JsonProperty("grpcServerAddress")
  private String grpcServerAddress;

  @JsonProperty("tlsConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private BaseTLSConfig tlsConfig;

  @JsonIgnore
  public String getConnectionType() {
    return this.connectionType;
  }

  @JsonIgnore
  public ConnectionType getConnectionTypeAsEnum() {
    return ConnectionType.valueOf(this.connectionType);
  }

  @JsonIgnore
  public void setConnectionType(final String connectionType) {
    this.connectionType = connectionType;
  }

  @JsonIgnore
  public void setConnectionTypeFromEnum(final ConnectionType connectionType) {
    this.connectionType = connectionType.toString();
  }

  @JsonIgnore
  public PublicCustomConfigInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<PublicCustomConfigInfo> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<PublicCustomConfigInfo>>() {});
  }

  public enum ConnectionType {
    INSECURE("INSECURE"),
    TLS("TLS");

    private String value;

    ConnectionType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class PublicCustomConfigInfoBuilder {
    private String connectionType;

    public PublicCustomConfigInfoBuilder connectionType(final String connectionType) {
      this.connectionType = connectionType;
      return this;
    }

    public PublicCustomConfigInfoBuilder connectionTypeFromEnum(
        final ConnectionType connectionType) {
      this.connectionType = connectionType.toString();
      return this;
    }
  }
}
