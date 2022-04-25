/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operations.game_profile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.models.GameProfileInfo;
import net.accelbyte.sdk.api.social.models.GameProfileRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * publicUpdateProfile
 *
 * Updates user game profile, returns updated profile.
 * Other detail info:
 *         *  Required permission : resource="NAMESPACE:{namespace}:USER:{userId}:GAMEPROFILE", action=4 (UPDATE)
 *         *  Returns : updated game profile
 */
@Getter
@Setter
public class PublicUpdateProfile extends Operation {
    /**
     * generated field's value
     */
    private String url = "/social/public/namespaces/{namespace}/users/{userId}/profiles/{profileId}";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String profileId;
    private String userId;
    private GameProfileRequest body;

    /**
    * @param namespace required
    * @param profileId required
    * @param userId required
    */
    @Builder
    public PublicUpdateProfile(
            String namespace,
            String profileId,
            String userId,
            GameProfileRequest body
    )
    {
        this.namespace = namespace;
        this.profileId = profileId;
        this.userId = userId;
        this.body = body;
        
        securities.add("Bearer");
    }

    public PublicUpdateProfile createFromJson(String json) throws JsonProcessingException {
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
        if (this.profileId != null){
            pathParams.put("profileId", this.profileId);
        }
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }



    @Override
    public GameProfileRequest getBodyParams(){
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
        if(this.profileId == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    @Override
    public GameProfileInfo parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new GameProfileInfo().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}