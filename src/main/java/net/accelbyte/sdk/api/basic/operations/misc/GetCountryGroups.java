/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.operations.misc;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * getCountryGroups
 *
 * List country groups. Will return all available country groups if the query param is not specified
 * Other detail info:
 * 
 *   * Required permission : resource = "ADMIN:NAMESPACE:{namespace}:MISC" , action=2 (READ)
 *   *  Action code : 11203
 *   *  Returns : list of country groups
 */
@Getter
@Setter
public class GetCountryGroups extends Operation {
    /**
     * generated field's value
     */
    private String path = "/basic/v1/admin/namespaces/{namespace}/misc/countrygroups";
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
    private String groupCode;

    /**
    * @param namespace required
    */
    @Builder
    public GetCountryGroups(
            String namespace,
            String groupCode
    )
    {
        this.namespace = namespace;
        this.groupCode = groupCode;
        
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
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("groupCode", this.groupCode == null ? null : Arrays.asList(this.groupCode));
        return queryParams;
    }




    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public List<RetrieveCountryGroupResponse> parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<RetrieveCountryGroupResponse>>() {});
        }
        throw new HttpResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("groupCode", "None");
        return result;
    }
}