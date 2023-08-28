/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.models;

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
public class ApimodelsCreateTagResp extends Model {

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("name")
  private String name;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("owner")
  private String owner;

  @JsonIgnore
  public String getOwner() {
    return this.owner;
  }

  @JsonIgnore
  public Owner getOwnerAsEnum() {
    return Owner.valueOf(this.owner);
  }

  @JsonIgnore
  public void setOwner(final String owner) {
    this.owner = owner;
  }

  @JsonIgnore
  public void setOwnerFromEnum(final Owner owner) {
    this.owner = owner.toString();
  }

  @JsonIgnore
  public ApimodelsCreateTagResp createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsCreateTagResp> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ApimodelsCreateTagResp>>() {});
  }

  public enum Owner {
    CLIENT("CLIENT"),
    SERVER("SERVER");

    private String value;

    Owner(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ApimodelsCreateTagRespBuilder {
    private String owner;

    public ApimodelsCreateTagRespBuilder owner(final String owner) {
      this.owner = owner;
      return this;
    }

    public ApimodelsCreateTagRespBuilder ownerFromEnum(final Owner owner) {
      this.owner = owner.toString();
      return this;
    }
  }
}
