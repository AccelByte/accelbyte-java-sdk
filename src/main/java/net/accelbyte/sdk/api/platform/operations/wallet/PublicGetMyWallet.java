/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.wallet;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.WalletInfo;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * publicGetMyWallet
 *
 * get my wallet by currency code and namespace.
 * Other detail info:
 * 
 *   * Required permission : resource="NAMESPACE:{namespace}:WALLET", action=2 (READ)
 *   *  Returns : wallet info
 *   *  Path's namespace :
 *     * can be filled with publisher namespace in order to get publisher user wallet
 *     * can be filled with game namespace in order to get game user wallet
 */
@Getter
@Setter
public class PublicGetMyWallet extends Operation {
    /**
     * generated field's value
     */
    private String path = "/platform/public/namespaces/{namespace}/users/me/wallets/{currencyCode}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String currencyCode;
    private String namespace;

    /**
    * @param currencyCode required
    * @param namespace required
    */
    @Builder
    public PublicGetMyWallet(
            String currencyCode,
            String namespace
    )
    {
        this.currencyCode = currencyCode;
        this.namespace = namespace;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.currencyCode != null){
            pathParams.put("currencyCode", this.currencyCode);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }





    @Override
    public boolean isValid() {
        if(this.currencyCode == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public WalletInfo parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new WalletInfo().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}