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
import net.accelbyte.sdk.api.basic.models.CountryGroupObject;
import net.accelbyte.sdk.api.basic.models.UpdateCountryGroupRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * updateCountryGroup
 *
 * Update a country groups. The countryGroupCode must be exist beforehand.
 * Valid update behaviour :
 * - To update countryGroupName only, do not include countries key or just specify it with empty array.
 * - To update countries only, do not include countryGroupName key or just specify it with blank value.
 * Other detail info:
 * 
 *   * Required permission : resource = "ADMIN:NAMESPACE:{namespace}:MISC" , action=4 (UPDATE)
 *   *  Action code : 11202
 *   *  Returns : updated country group
 */
@Getter
@Setter
public class UpdateCountryGroup extends Operation {
    /**
     * generated field's value
     */
    private String path = "/basic/v1/admin/namespaces/{namespace}/misc/countrygroups/{countryGroupCode}";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String countryGroupCode;
    private String namespace;
    private UpdateCountryGroupRequest body;

    /**
    * @param countryGroupCode required
    * @param namespace required
    */
    @Builder
    public UpdateCountryGroup(
            String countryGroupCode,
            String namespace,
            UpdateCountryGroupRequest body
    )
    {
        this.countryGroupCode = countryGroupCode;
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.countryGroupCode != null){
            pathParams.put("countryGroupCode", this.countryGroupCode);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public UpdateCountryGroupRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.countryGroupCode == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public CountryGroupObject parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new CountryGroupObject().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}