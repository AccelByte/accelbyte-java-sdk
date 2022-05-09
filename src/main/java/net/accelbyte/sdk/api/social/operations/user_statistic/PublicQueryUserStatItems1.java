/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operations.user_statistic;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * publicQueryUserStatItems_1
 *
 * Public list all statItems of user.
 * NOTE:
 *             * If stat code does not exist, will ignore this stat code.
 *             * If stat item does not exist, will return default value
 * Other detail info:
 *             *  Required permission : resource="NAMESPACE:{namespace}:USER:{userId}:STATITEM", action=2 (READ)
 *             *  Returns : stat items
 */
@Getter
@Setter
public class PublicQueryUserStatItems1 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/social/v1/public/namespaces/{namespace}/users/{userId}/statitems/value/bulk";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String userId;
    private List<String> statCodes;
    private List<String> tags;

    /**
    * @param namespace required
    * @param userId required
    */
    @Builder
    public PublicQueryUserStatItems1(
            String namespace,
            String userId,
            List<String> statCodes,
            List<String> tags
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.statCodes = statCodes;
        this.tags = tags;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }

    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("statCodes", this.statCodes == null ? null : this.statCodes);
        queryParams.put("tags", this.tags == null ? null : this.tags);
        return queryParams;
    }




    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    public List<ADTOObjectForUserStatItemValue> parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<ADTOObjectForUserStatItemValue>>() {});
        }
        throw new HttpResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("statCodes", "multi");
        result.put("tags", "multi");
        return result;
    }
}