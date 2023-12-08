/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.operations.inbox;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.chat.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminSendInboxMessage
 *
 * Send inbox message
 */
@Getter
@Setter
public class AdminSendInboxMessage extends Operation {
    /**
     * generated field's value
     */
    private String path = "/chat/v1/admin/inbox/namespaces/{namespace}/messages/{messageId}/send";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String messageId;
    private String namespace;
    private ModelsSendInboxMessageRequest body;

    /**
    * @param messageId required
    * @param namespace required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public AdminSendInboxMessage(
            String messageId,
            String namespace,
            ModelsSendInboxMessageRequest body
    )
    {
        this.messageId = messageId;
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.messageId != null){
            pathParams.put("messageId", this.messageId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public ModelsSendInboxMessageRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.messageId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public ModelsSendInboxMessageResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);    
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ModelsSendInboxMessageResponse().createFromJson(json);
    }

}