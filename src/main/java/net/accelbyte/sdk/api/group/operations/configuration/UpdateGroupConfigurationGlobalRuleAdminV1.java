/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.operations.configuration;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.models.ModelsUpdateGroupConfigurationResponseV1;
import net.accelbyte.sdk.api.group.models.ModelsUpdateGroupConfigurationGlobalRulesRequestV1;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * updateGroupConfigurationGlobalRuleAdminV1
 *
 * 
 * 
 * Required permission 'ADMIN:NAMESPACE:{namespace}:GROUP:CONFIGURATION [UPDATE]'
 * 
 * 
 * 
 * 
 * This endpoint is used to update existing global rule configuration based on the allowed action. It will replace the permission with the request
 * 
 * 
 * 
 * 
 * Action Code: 73106
 */
@Getter
@Setter
public class UpdateGroupConfigurationGlobalRuleAdminV1 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/group/v1/admin/namespaces/{namespace}/configuration/{configurationCode}/rules/{allowedAction}";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String allowedAction;
    private String configurationCode;
    private String namespace;
    private ModelsUpdateGroupConfigurationGlobalRulesRequestV1 body;

    /**
    * @param allowedAction required
    * @param configurationCode required
    * @param namespace required
    * @param body required
    */
    @Builder
    public UpdateGroupConfigurationGlobalRuleAdminV1(
            String allowedAction,
            String configurationCode,
            String namespace,
            ModelsUpdateGroupConfigurationGlobalRulesRequestV1 body
    )
    {
        this.allowedAction = allowedAction;
        this.configurationCode = configurationCode;
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.allowedAction != null){
            pathParams.put("allowedAction", this.allowedAction);
        }
        if (this.configurationCode != null){
            pathParams.put("configurationCode", this.configurationCode);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public ModelsUpdateGroupConfigurationGlobalRulesRequestV1 getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.allowedAction == null) {
            return false;
        }
        if(this.configurationCode == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public ModelsUpdateGroupConfigurationResponseV1 parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsUpdateGroupConfigurationResponseV1().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}