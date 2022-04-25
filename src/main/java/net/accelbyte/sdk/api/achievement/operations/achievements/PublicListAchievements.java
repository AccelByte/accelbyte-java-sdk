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
import net.accelbyte.sdk.api.achievement.models.ModelsPublicAchievementsResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * PublicListAchievements
 *
 * 
 * 
 * Required permission
 * `NAMESPACE:{namespace}:ACHIEVEMENT [READ]` and scope `social`
 */
@Getter
@Setter
public class PublicListAchievements extends Operation {
    /**
     * generated field's value
     */
    private String url = "/achievement/v1/public/namespaces/{namespace}/achievements";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private Integer limit;
    private Integer offset;
    private String sortBy;
    private String language;

    /**
    * @param namespace required
    * @param language required
    */
    @Builder
    public PublicListAchievements(
            String namespace,
            Integer limit,
            Integer offset,
            String sortBy,
            String language
    )
    {
        this.namespace = namespace;
        this.limit = limit;
        this.offset = offset;
        this.sortBy = sortBy;
        this.language = language;
        
        securities.add("Bearer");
    }

    public PublicListAchievements createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
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
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        queryParams.put("sortBy", this.sortBy == null ? null : Arrays.asList(this.sortBy));
        queryParams.put("language", this.language == null ? null : Arrays.asList(this.language));
        return queryParams;
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
        if(this.language == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelsPublicAchievementsResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsPublicAchievementsResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("limit", "None");
        result.put("offset", "None");
        result.put("sortBy", "None");
        result.put("language", "None");
        return result;
    }
}