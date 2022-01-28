package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.eventlog.event_descriptions.*;
import net.accelbyte.sdk.cli.api.eventlog.event.*;
import net.accelbyte.sdk.cli.api.eventlog.user_information.*;
import net.accelbyte.sdk.cli.api.eventlog.event_registry.*;
import net.accelbyte.sdk.cli.api.eventlog.event_v2.*;

import picocli.CommandLine.Command;

@Command(name = "eventlog",
        mixinStandardHelpOptions = true,
        subcommands = {
                AgentTypeDescriptionHandler.class,
                SpecificAgentTypeDescriptionHandler.class,
                EventIDDescriptionHandler.class,
                SpecificEventIDDescriptionHandler.class,
                EventLevelDescriptionHandler.class,
                SpecificEventLevelDescriptionHandler.class,
                EventTypeDescriptionHandler.class,
                SpecificEventTypeDescriptionHandler.class,
                UXNameDescriptionHandler.class,
                SpecificUXDescriptionHandler.class,
                GetEventByNamespaceHandler.class,
                PostEventHandler.class,
                GetEventByEventIDHandler.class,
                GetEventByEventTypeHandler.class,
                GetEventByEventTypeAndEventIDHandler.class,
                GetEventByUserIDHandler.class,
                GetUserActivitiesHandler.class,
                DeleteUserActivitiesHandler.class,
                GetEventByUserIDAndEventIDHandler.class,
                GetEventByUserIDAndEventTypeHandler.class,
                GetEventByUserEventIDAndEventTypeHandler.class,
                LastUserActivityTimeHandler.class,
                GetRegisteredEventsHandler.class,
                RegisterEventHandler.class,
                GetRegisteredEventIDHandler.class,
                UpdateEventRegistryHandler.class,
                UnregisterEventIDHandler.class,
                GetRegisteredEventsByEventTypeHandler.class,
                QueryEventStreamHandler.class,
                GetEventSpecificUserV2Handler.class,
                GetPublicEditHistory.class,
                GetUserEventsV2Public.class,
        }
)
public class Eventlog implements Runnable {

    @Override
    public void run() {

    }
}