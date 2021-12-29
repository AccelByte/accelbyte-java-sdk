package net.accelbyte.sdk.api.eventlog.wrappers;

import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.operations.event_registry.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class EventRegistry {

    private AccelByteSDK sdk;

    public EventRegistry(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public ModelsEventRegistry getRegisteredEventsHandler(GetRegisteredEventsHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetRegisteredEventsHandler()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void registerEventHandler(RegisterEventHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new RegisterEventHandler()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsEventRegistry getRegisteredEventIDHandler(GetRegisteredEventIDHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetRegisteredEventIDHandler()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void updateEventRegistryHandler(UpdateEventRegistryHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new UpdateEventRegistryHandler()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void unregisterEventIDHandler(UnregisterEventIDHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new UnregisterEventIDHandler()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsEventRegistry getRegisteredEventsByEventTypeHandler(GetRegisteredEventsByEventTypeHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetRegisteredEventsByEventTypeHandler()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
