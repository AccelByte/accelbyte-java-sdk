/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.models;

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
public class ModelUserLoginHistoryResponse extends Model {

    @JsonProperty("ApplicationName")
    private String applicationName;

    @JsonProperty("City")
    private String city;

    @JsonProperty("Country")
    private String country;

    @JsonProperty("DeviceId")
    private String deviceId;

    @JsonProperty("State")
    private String state;

    @JsonProperty("Timestamp")
    private Integer timestamp;

    @JsonProperty("deviceName")
    private String deviceName;



    @JsonIgnore
    public ModelUserLoginHistoryResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelUserLoginHistoryResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelUserLoginHistoryResponse>>() {});
    }

    
}