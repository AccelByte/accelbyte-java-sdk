package net.accelbyte.sdk.api.lobby.wrappers;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.operations.notification.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Notification {

    private AccelByteSDK sdk;

    public Notification(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public void sendMultipleUsersFreeformNotificationV1Admin(SendMultipleUsersFreeformNotificationV1Admin input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new SendMultipleUsersFreeformNotificationV1Admin()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void sendUsersFreeformNotificationV1Admin(SendUsersFreeformNotificationV1Admin input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new SendUsersFreeformNotificationV1Admin()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void sendPartyFreeformNotificationV1Admin(SendPartyFreeformNotificationV1Admin input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new SendPartyFreeformNotificationV1Admin()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void sendPartyTemplatedNotificationV1Admin(SendPartyTemplatedNotificationV1Admin input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new SendPartyTemplatedNotificationV1Admin()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelNotificationTemplateResponse> getAllNotificationTemplatesV1Admin(GetAllNotificationTemplatesV1Admin input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetAllNotificationTemplatesV1Admin()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void createNotificationTemplateV1Admin(CreateNotificationTemplateV1Admin input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new CreateNotificationTemplateV1Admin()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void sendUsersTemplatedNotificationV1Admin(SendUsersTemplatedNotificationV1Admin input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new SendUsersTemplatedNotificationV1Admin()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelGetAllNotificationTemplateSlugResp getTemplateSlugLocalizationsTemplateV1Admin(GetTemplateSlugLocalizationsTemplateV1Admin input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetTemplateSlugLocalizationsTemplateV1Admin()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteNotificationTemplateSlugV1Admin(DeleteNotificationTemplateSlugV1Admin input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteNotificationTemplateSlugV1Admin()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelLocalization getSingleTemplateLocalizationV1Admin(GetSingleTemplateLocalizationV1Admin input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetSingleTemplateLocalizationV1Admin()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void updateTemplateLocalizationV1Admin(UpdateTemplateLocalizationV1Admin input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new UpdateTemplateLocalizationV1Admin()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteTemplateLocalizationV1Admin(DeleteTemplateLocalizationV1Admin input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteTemplateLocalizationV1Admin()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publishTemplateLocalizationV1Admin(PublishTemplateLocalizationV1Admin input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublishTemplateLocalizationV1Admin()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelGetAllNotificationTopicsResponse getAllNotificationTopicsV1Admin(GetAllNotificationTopicsV1Admin input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetAllNotificationTopicsV1Admin()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void createNotificationTopicV1Admin(CreateNotificationTopicV1Admin input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new CreateNotificationTopicV1Admin()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelNotificationTopicResponseV1 getNotificationTopicV1Admin(GetNotificationTopicV1Admin input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetNotificationTopicV1Admin()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void updateNotificationTopicV1Admin(UpdateNotificationTopicV1Admin input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new UpdateNotificationTopicV1Admin()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteNotificationTopicV1Admin(DeleteNotificationTopicV1Admin input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteNotificationTopicV1Admin()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void sendSpecificUserFreeformNotificationV1Admin(SendSpecificUserFreeformNotificationV1Admin input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new SendSpecificUserFreeformNotificationV1Admin()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void sendSpecificUserTemplatedNotificationV1Admin(SendSpecificUserTemplatedNotificationV1Admin input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new SendSpecificUserTemplatedNotificationV1Admin()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void freeFormNotification(FreeFormNotification input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new FreeFormNotification()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void notificationWithTemplate(NotificationWithTemplate input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new NotificationWithTemplate()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelTemplateResponse> getGameTemplate(GetGameTemplate input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetGameTemplate()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void createTemplate(CreateTemplate input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new CreateTemplate()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelTemplateLocalizationResponse getSlugTemplate(GetSlugTemplate input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetSlugTemplate()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteTemplateSlug(DeleteTemplateSlug input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteTemplateSlug()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelTemplateLocalization getLocalizationTemplate(GetLocalizationTemplate input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetLocalizationTemplate()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void updateLocalizationTemplate(UpdateLocalizationTemplate input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new UpdateLocalizationTemplate()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteTemplateLocalization(DeleteTemplateLocalization input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteTemplateLocalization()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publishTemplate(PublishTemplate input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublishTemplate()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelTopicByNamespacesResponse getTopicByNamespace(GetTopicByNamespace input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetTopicByNamespace()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void createTopic(CreateTopic input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new CreateTopic()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelNotificationTopicResponse getTopicByTopicName(GetTopicByTopicName input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetTopicByTopicName()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void updateTopicByTopicName(UpdateTopicByTopicName input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new UpdateTopicByTopicName()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteTopicByTopicName(DeleteTopicByTopicName input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteTopicByTopicName()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void freeFormNotificationByUserID(FreeFormNotificationByUserID input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new FreeFormNotificationByUserID()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void notificationWithTemplateByUserID(NotificationWithTemplateByUserID input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new NotificationWithTemplateByUserID()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
