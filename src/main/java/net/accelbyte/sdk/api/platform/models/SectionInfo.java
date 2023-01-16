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
// deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class SectionInfo extends Model {

  @JsonProperty("active")
  private Boolean active;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("currentRotationExpireAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String currentRotationExpireAt;

  @JsonProperty("currentRotationItems")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ItemInfo> currentRotationItems;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("displayOrder")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer displayOrder;

  @JsonProperty("endDate")
  private String endDate;

  @JsonProperty("ext")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> ext;

  @JsonProperty("localExt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> localExt;

  @JsonProperty("longDescription")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String longDescription;

  @JsonProperty("name")
  private String name;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("sectionId")
  private String sectionId;

  @JsonProperty("startDate")
  private String startDate;

  @JsonProperty("title")
  private String title;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("viewId")
  private String viewId;

  @JsonIgnore
  public SectionInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<SectionInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<SectionInfo>>() {});
  }
}
