/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.legal.models;

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
public class UpdatePolicyRequest extends Model {

    @JsonProperty("description")
    private String description;

    @JsonProperty("isDefaultOpted")
    private Boolean isDefaultOpted;

    @JsonProperty("isMandatory")
    private Boolean isMandatory;

    @JsonProperty("policyName")
    private String policyName;

    @JsonProperty("readableId")
    private String readableId;

    @JsonProperty("shouldNotifyOnUpdate")
    private Boolean shouldNotifyOnUpdate;

    @JsonIgnore
    public UpdatePolicyRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<UpdatePolicyRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<UpdatePolicyRequest>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("description", "description");
        result.put("isDefaultOpted", "isDefaultOpted");
        result.put("isMandatory", "isMandatory");
        result.put("policyName", "policyName");
        result.put("readableId", "readableId");
        result.put("shouldNotifyOnUpdate", "shouldNotifyOnUpdate");
        return result;
    }
}