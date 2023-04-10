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
public class CatalogChangeInfo extends Model {

  @JsonProperty("action")
  private String action;

  @JsonProperty("categoryPath")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String categoryPath;

  @JsonProperty("changeId")
  private String changeId;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("itemId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemId;

  @JsonProperty("itemType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemType;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("publishedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String publishedAt;

  @JsonProperty("sectionId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String sectionId;

  @JsonProperty("selected")
  private Boolean selected;

  @JsonProperty("sku")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String sku;

  @JsonProperty("status")
  private String status;

  @JsonProperty("storeId")
  private String storeId;

  @JsonProperty("title")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String title;

  @JsonProperty("type")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String type;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("viewId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String viewId;

  @JsonIgnore
  public String getAction() {
    return this.action;
  }

  @JsonIgnore
  public Action getActionAsEnum() {
    return Action.valueOf(this.action);
  }

  @JsonIgnore
  public void setAction(final String action) {
    this.action = action;
  }

  @JsonIgnore
  public void setActionFromEnum(final Action action) {
    this.action = action.toString();
  }

  @JsonIgnore
  public String getItemType() {
    return this.itemType;
  }

  @JsonIgnore
  public ItemType getItemTypeAsEnum() {
    return ItemType.valueOf(this.itemType);
  }

  @JsonIgnore
  public void setItemType(final String itemType) {
    this.itemType = itemType;
  }

  @JsonIgnore
  public void setItemTypeFromEnum(final ItemType itemType) {
    this.itemType = itemType.toString();
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
  public String getType() {
    return this.type;
  }

  @JsonIgnore
  public Type getTypeAsEnum() {
    return Type.valueOf(this.type);
  }

  @JsonIgnore
  public void setType(final String type) {
    this.type = type;
  }

  @JsonIgnore
  public void setTypeFromEnum(final Type type) {
    this.type = type.toString();
  }

  @JsonIgnore
  public CatalogChangeInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<CatalogChangeInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<CatalogChangeInfo>>() {});
  }

  public enum Action {
    CREATE("CREATE"),
    DELETE("DELETE"),
    UPDATE("UPDATE");

    private String value;

    Action(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum ItemType {
    APP("APP"),
    BUNDLE("BUNDLE"),
    CODE("CODE"),
    COINS("COINS"),
    EXTENSION("EXTENSION"),
    INGAMEITEM("INGAMEITEM"),
    LOOTBOX("LOOTBOX"),
    MEDIA("MEDIA"),
    OPTIONBOX("OPTIONBOX"),
    SEASON("SEASON"),
    SUBSCRIPTION("SUBSCRIPTION");

    private String value;

    ItemType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    PUBLISHED("PUBLISHED"),
    UNPUBLISHED("UNPUBLISHED");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Type {
    CATEGORY("CATEGORY"),
    ITEM("ITEM"),
    SECTION("SECTION"),
    STORE("STORE"),
    VIEW("VIEW");

    private String value;

    Type(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class CatalogChangeInfoBuilder {
    private String action;
    private String itemType;
    private String status;
    private String type;

    public CatalogChangeInfoBuilder action(final String action) {
      this.action = action;
      return this;
    }

    public CatalogChangeInfoBuilder actionFromEnum(final Action action) {
      this.action = action.toString();
      return this;
    }

    public CatalogChangeInfoBuilder itemType(final String itemType) {
      this.itemType = itemType;
      return this;
    }

    public CatalogChangeInfoBuilder itemTypeFromEnum(final ItemType itemType) {
      this.itemType = itemType.toString();
      return this;
    }

    public CatalogChangeInfoBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public CatalogChangeInfoBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }

    public CatalogChangeInfoBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public CatalogChangeInfoBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}
