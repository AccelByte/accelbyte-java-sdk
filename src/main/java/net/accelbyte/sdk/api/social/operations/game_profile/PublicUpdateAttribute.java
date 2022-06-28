/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operations.game_profile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.models.GameProfileInfo;
import net.accelbyte.sdk.api.social.models.Attribute;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * publicUpdateAttribute
 *
 * Updates game profile attribute, returns updated profile.
 * Other detail info:
 *         *  Required permission : resource="NAMESPACE:{namespace}:USER:{userId}:GAMEPROFILE", action=4 (UPDATE)
 *         *  Returns : updated attribute
 */
@Getter
@Setter
public class PublicUpdateAttribute extends Operation {
    /**
     * generated field's value
     */
    private String path = "/social/public/namespaces/{namespace}/users/{userId}/profiles/{profileId}/attributes/{attributeName}";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String attributeName;
    private String namespace;
    private String profileId;
    private String userId;
    private Attribute body;

    /**
    * @param attributeName required
    * @param namespace required
    * @param profileId required
    * @param userId required
    */
    @Builder
    public PublicUpdateAttribute(
            String attributeName,
            String namespace,
            String profileId,
            String userId,
            Attribute body
    )
    {
        this.attributeName = attributeName;
        this.namespace = namespace;
        this.profileId = profileId;
        this.userId = userId;
        this.body = body;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.attributeName != null){
            pathParams.put("attributeName", this.attributeName);
        }
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
    public Attribute getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.attributeName == null) {
            return false;
        }
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

    public GameProfileInfo parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new GameProfileInfo().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}