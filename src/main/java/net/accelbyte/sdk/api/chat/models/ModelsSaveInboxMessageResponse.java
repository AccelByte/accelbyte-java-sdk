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
public class ModelsSaveInboxMessageResponse extends Model {

  @JsonProperty("category")
  private String category;

  @JsonProperty("expiredAt")
  private Integer expiredAt;

  @JsonProperty("id")
  private String id;

  @JsonProperty("message")
  private Map<String, ?> message;

  @JsonProperty("scope")
  private String scope;

  @JsonProperty("status")
  private String status;

  @JsonProperty("userIDs")
  private List<String> userIDs;

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
  public String getStatus() {
    return this.status;
  }

  @JsonIgnore
  public Status getStatusAsEnum() {
    return Status.valueOf(this.status);
  }

  @JsonIgnore
  public void setStatus(final String status) {
    this.status = status;
  }

  @JsonIgnore
  public void setStatusFromEnum(final Status status) {
    this.status = status.toString();
  }

  @JsonIgnore
  public ModelsSaveInboxMessageResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsSaveInboxMessageResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsSaveInboxMessageResponse>>() {});
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

  public enum Status {
    DRAFT("DRAFT"),
    SENT("SENT"),
    UNSENT("UNSENT");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ModelsSaveInboxMessageResponseBuilder {
    private String scope;
    private String status;

    public ModelsSaveInboxMessageResponseBuilder scope(final String scope) {
      this.scope = scope;
      return this;
    }

    public ModelsSaveInboxMessageResponseBuilder scopeFromEnum(final Scope scope) {
      this.scope = scope.toString();
      return this;
    }

    public ModelsSaveInboxMessageResponseBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public ModelsSaveInboxMessageResponseBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
