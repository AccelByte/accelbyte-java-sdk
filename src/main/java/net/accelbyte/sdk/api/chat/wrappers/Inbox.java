/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.wrappers;

import java.util.*;

import net.accelbyte.sdk.api.chat.models.*;
import net.accelbyte.sdk.api.chat.operations.inbox.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Inbox {

    private AccelByteSDK sdk;

    public Inbox(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    /**
     * @see AdminGetInboxCategories
     */
    public List<ModelsGetInboxCategoriesResponseItem> adminGetInboxCategories(AdminGetInboxCategories input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminAddInboxCategory
     */
    public ModelsAddInboxCategoryResponse adminAddInboxCategory(AdminAddInboxCategory input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminDeleteInboxCategory
     */
    public void adminDeleteInboxCategory(AdminDeleteInboxCategory input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        input
            .handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminUpdateInboxCategory
     */
    public void adminUpdateInboxCategory(AdminUpdateInboxCategory input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        input
            .handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminGetCategorySchema
     */
    public ModelsJSONSchemaType adminGetCategorySchema(AdminGetCategorySchema input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminDeleteInboxMessage
     */
    public void adminDeleteInboxMessage(AdminDeleteInboxMessage input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        input
            .handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminGetInboxMessages
     */
    public ModelsGetInboxMessagesResponse adminGetInboxMessages(AdminGetInboxMessages input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminSaveInboxMessage
     */
    public ModelsSaveInboxMessageResponse adminSaveInboxMessage(AdminSaveInboxMessage input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminUnsendInboxMessage
     */
    public ModelsUnsendInboxMessageResponse adminUnsendInboxMessage(AdminUnsendInboxMessage input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminGetInboxUsers
     */
    public ModelsGetInboxUsersResponse adminGetInboxUsers(AdminGetInboxUsers input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminUpdateInboxMessage
     */
    public void adminUpdateInboxMessage(AdminUpdateInboxMessage input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        input
            .handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminSendInboxMessage
     */
    public ModelsSendInboxMessageResponse adminSendInboxMessage(AdminSendInboxMessage input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminGetInboxStats
     */
    public ModelsGetInboxStatsResponse adminGetInboxStats(AdminGetInboxStats input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}
