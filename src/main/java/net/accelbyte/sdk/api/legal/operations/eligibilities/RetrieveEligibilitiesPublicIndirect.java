/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.eligibilities;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.models.RetrieveUserEligibilitiesIndirectResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * retrieveEligibilitiesPublicIndirect
 *
 * Retrieve the active policies and its conformance status by userThis process only supports cross-namespace checking between game namespace and publisher namespace , that means if the active policy already accepted by the same user in publisher namespace, then it will also be considered as eligible in non-publisher namespace.
 * 
 * Other detail info:
 * 
 *   * Required permission : login user
 */
@Getter
@Setter
public class RetrieveEligibilitiesPublicIndirect extends Operation {
    /**
     * generated field's value
     */
    private String path = "/agreement/public/eligibilities/namespaces/{namespace}/countries/{countryCode}/clients/{clientId}/users/{userId}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String clientId;
    private String countryCode;
    private String namespace;
    private String userId;

    /**
    * @param clientId required
    * @param countryCode required
    * @param namespace required
    * @param userId required
    */
    @Builder
    public RetrieveEligibilitiesPublicIndirect(
            String clientId,
            String countryCode,
            String namespace,
            String userId
    )
    {
        this.clientId = clientId;
        this.countryCode = countryCode;
        this.namespace = namespace;
        this.userId = userId;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.clientId != null){
            pathParams.put("clientId", this.clientId);
        }
        if (this.countryCode != null){
            pathParams.put("countryCode", this.countryCode);
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
    public boolean isValid() {
        if(this.clientId == null) {
            return false;
        }
        if(this.countryCode == null) {
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

    public RetrieveUserEligibilitiesIndirectResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new RetrieveUserEligibilitiesIndirectResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}