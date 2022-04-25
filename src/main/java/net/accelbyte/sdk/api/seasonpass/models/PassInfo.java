/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.seasonpass.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.*;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PassInfo extends Model {

    @JsonProperty("autoEnroll")
    private Boolean autoEnroll;

    @JsonProperty("code")
    private String code;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("displayOrder")
    private String displayOrder;

    @JsonProperty("images")
    private List<Image> images;

    @JsonProperty("localizations")
    private Map<String, Localization> localizations;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("passItemId")
    private String passItemId;

    @JsonProperty("passItemName")
    private String passItemName;

    @JsonProperty("seasonId")
    private String seasonId;

    @JsonProperty("updatedAt")
    private String updatedAt;



    @JsonIgnore
    public PassInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<PassInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PassInfo>>() {});
    }

    
}