/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

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
public class XsollaConfig extends Model {

    @JsonProperty("apiKey")
    private String apiKey;

    @JsonProperty("flowCompletionUrl")
    private String flowCompletionUrl;

    @JsonProperty("merchantId")
    private Integer merchantId;

    @JsonProperty("projectId")
    private Integer projectId;

    @JsonProperty("projectSecretKey")
    private String projectSecretKey;



    @JsonIgnore
    public XsollaConfig createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<XsollaConfig> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<XsollaConfig>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("apiKey", "apiKey");
        result.put("flowCompletionUrl", "flowCompletionUrl");
        result.put("merchantId", "merchantId");
        result.put("projectId", "projectId");
        result.put("projectSecretKey", "projectSecretKey");
        return result;
    }
    
    public static class XsollaConfigBuilder {
        
    }
}