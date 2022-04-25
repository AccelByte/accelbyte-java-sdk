/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.achievement.operations.achievements;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.achievement.models.*;
import net.accelbyte.sdk.api.achievement.models.ModelsAchievementResponse;
import net.accelbyte.sdk.api.achievement.models.ModelsAchievementUpdateRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminUpdateAchievement
 *
 * 
 * 
 * Required permission
 * `ADMIN:NAMESPACE:{namespace}:ACHIEVEMENT [UPDATE]` and scope `social`
 */
@Getter
@Setter
public class AdminUpdateAchievement extends Operation {
    /**
     * generated field's value
     */
    private String url = "/achievement/v1/admin/namespaces/{namespace}/achievements/{achievementCode}";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String achievementCode;
    private String namespace;
    private ModelsAchievementUpdateRequest body;

    /**
    * @param achievementCode required
    * @param namespace required
    * @param body required
    */
    @Builder
    public AdminUpdateAchievement(
            String achievementCode,
            String namespace,
            ModelsAchievementUpdateRequest body
    )
    {
        this.achievementCode = achievementCode;
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public AdminUpdateAchievement createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.achievementCode != null){
            pathParams.put("achievementCode", this.achievementCode);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public ModelsAchievementUpdateRequest getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.achievementCode == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelsAchievementResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsAchievementResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}