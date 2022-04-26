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
import net.accelbyte.sdk.api.achievement.models.ModelsAchievementRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminCreateNewAchievement
 *
 * 
 * 
 * Required permission
 * `ADMIN:NAMESPACE:{namespace}:ACHIEVEMENT [CREATE]` and scope `social`
 * 
 * 
 * Other detail info:
 * - achievementCode: Human readable unique code to indentify the achievement. Must be lowercase
 * and maximum length is 32
 * - incremental: If the achievement is not incremental, it does not need to store a goal value
 * of a stat to be unlocked.
 * If the achievement is incremental, it needs to set statCode and goalValue
 * - statCode: Selected statistic code, from the published statistic code event.Human readable unique
 * code to indentify the achievement. Must be lowercase and maximum length is 32
 * - goalValue: Statistics value required to unlock the achievement.
 * - defaultLanguage: localozation for achievement name and achievement description. Allowed format : en, en-US
 * - slug: specify the image they want to use, it can be file image name or something
 * to define the achievement icon.
 */
@Getter
@Setter
public class AdminCreateNewAchievement extends Operation {
    /**
     * generated field's value
     */
    private String url = "/achievement/v1/admin/namespaces/{namespace}/achievements";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private ModelsAchievementRequest body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    public AdminCreateNewAchievement(
            String namespace,
            ModelsAchievementRequest body
    )
    {
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public ModelsAchievementRequest getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public ModelsAchievementResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new ModelsAchievementResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}