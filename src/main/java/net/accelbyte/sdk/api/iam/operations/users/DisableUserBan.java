/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelUserBanResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * DisableUserBan
 *
 * Required permission 'ADMIN:NAMESPACE:{namespace}:BAN:USER:{userId} [UPDATE]'.
 * 
 *  Notes for using IAM in publisher - game studio scenarios
 * 
 * 
 * The endpoint allows:
 * 
 *     * The admin user in publisher namespace disables userâs ban in publisher namespace.
 *     * The admin user in game namespace disables userâs ban in game namespace.
 *     * The admin user in publisher namespace disables userâs ban in publisher namespace.
 * 
 * Other scenarios are not supported and will return 403: Forbidden.
 */
@Getter
@Setter
public class DisableUserBan extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/namespaces/{namespace}/users/{userId}/bans/{banId}/disable";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("*/*");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String banId;
    private String namespace;
    private String userId;

    /**
    * @param banId required
    * @param namespace required
    * @param userId required
    */
    @Builder
    public DisableUserBan(
            String banId,
            String namespace,
            String userId
    )
    {
        this.banId = banId;
        this.namespace = namespace;
        this.userId = userId;
        
        securities.add("Bearer");
    }

    public DisableUserBan createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.banId != null){
            pathParams.put("banId", this.banId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }





    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.banId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelUserBanResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelUserBanResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}