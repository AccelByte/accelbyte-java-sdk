/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.eventlog.event.*;
import net.accelbyte.sdk.cli.api.eventlog.event_descriptions.*;
import net.accelbyte.sdk.cli.api.eventlog.event_registry.*;
import net.accelbyte.sdk.cli.api.eventlog.event_v2.*;
import net.accelbyte.sdk.cli.api.eventlog.user_information.*;
import picocli.CommandLine.Command;

@Command(
    name = "eventlog",
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
    })
public class Eventlog implements Runnable {

  @Override
  public void run() {}
}
