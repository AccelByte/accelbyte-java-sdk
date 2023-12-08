/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.models;

import java.util.*;

import com.fasterxml.jackson.annotation.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.*;

import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor=@__(@Deprecated))     
@NoArgsConstructor
public class ModelsDictionaryWithChildren extends Model {

    @JsonProperty("falseNegatives")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<ModelsDictionaryChild> falseNegatives;

    @JsonProperty("falsePositives")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<ModelsDictionaryChild> falsePositives;

    @JsonProperty("id")
    private String id;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("parentId")
    private String parentId;

    @JsonProperty("word")
    private String word;

    @JsonProperty("wordType")
    private String wordType;



    @JsonIgnore
    public ModelsDictionaryWithChildren createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsDictionaryWithChildren> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsDictionaryWithChildren>>() {});
    }

    
}