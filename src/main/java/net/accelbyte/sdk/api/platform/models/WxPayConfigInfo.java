/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class WxPayConfigInfo extends Model {

    @JsonProperty("appId")
    private String appId;

    @JsonProperty("certPath")
    private String certPath;

    @JsonProperty("key")
    private String key;

    @JsonProperty("mchid")
    private String mchid;

    @JsonProperty("returnUrl")
    private String returnUrl;

    @JsonIgnore
    public WxPayConfigInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<WxPayConfigInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<WxPayConfigInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("appId", "appId");
        result.put("certPath", "certPath");
        result.put("key", "key");
        result.put("mchid", "mchid");
        result.put("returnUrl", "returnUrl");
        return result;
    }
}