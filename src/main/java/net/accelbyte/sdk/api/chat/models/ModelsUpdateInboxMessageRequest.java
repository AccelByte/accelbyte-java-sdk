/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.models;

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
public class ModelsUpdateInboxMessageRequest extends Model {

  @JsonProperty("expiredAt")
  private Integer expiredAt;

  @JsonProperty("message")
  private Map<String, ?> message;

  @JsonProperty("scope")
  private String scope;

  @JsonProperty("userIds")
  private List<String> userIds;

  @JsonIgnore
  public String getScope() {
    return this.scope;
  }

  @JsonIgnore
  public Scope getScopeAsEnum() {
    return Scope.valueOf(this.scope);
  }

  @JsonIgnore
  public void setScope(final String scope) {
    this.scope = scope;
  }

  @JsonIgnore
  public void setScopeFromEnum(final Scope scope) {
    this.scope = scope.toString();
  }

  @JsonIgnore
  public ModelsUpdateInboxMessageRequest createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsUpdateInboxMessageRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsUpdateInboxMessageRequest>>() {});
  }

  public enum Scope {
    NAMESPACE("NAMESPACE"),
    USER("USER");

    private String value;

    Scope(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ModelsUpdateInboxMessageRequestBuilder {
    private String scope;

    public ModelsUpdateInboxMessageRequestBuilder scope(final String scope) {
      this.scope = scope;
      return this;
    }

    public ModelsUpdateInboxMessageRequestBuilder scopeFromEnum(final Scope scope) {
      this.scope = scope.toString();
      return this;
    }
  }
}
