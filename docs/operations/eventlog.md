# Eventlog Service Index

&nbsp;  

## Operations

### Event Descriptions Wrapper:  [EventDescriptions](../../src/main/java/net/accelbyte/sdk/api/eventlog/wrappers/EventDescriptions.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| [DEPRECATED] `/event/descriptions/agentType` | GET | AgentTypeDescriptionHandler | [AgentTypeDescriptionHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event_descriptions/AgentTypeDescriptionHandler.java) | [AgentTypeDescriptionHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event_descriptions/AgentTypeDescriptionHandler.java) |
| [DEPRECATED] `/event/descriptions/agentType/listByAgentTypes` | GET | SpecificAgentTypeDescriptionHandler | [SpecificAgentTypeDescriptionHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event_descriptions/SpecificAgentTypeDescriptionHandler.java) | [SpecificAgentTypeDescriptionHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event_descriptions/SpecificAgentTypeDescriptionHandler.java) |
| [DEPRECATED] `/event/descriptions/eventId` | GET | EventIDDescriptionHandler | [EventIDDescriptionHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event_descriptions/EventIDDescriptionHandler.java) | [EventIDDescriptionHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event_descriptions/EventIDDescriptionHandler.java) |
| [DEPRECATED] `/event/descriptions/eventId/listByEventIds` | GET | SpecificEventIDDescriptionHandler | [SpecificEventIDDescriptionHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event_descriptions/SpecificEventIDDescriptionHandler.java) | [SpecificEventIDDescriptionHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event_descriptions/SpecificEventIDDescriptionHandler.java) |
| [DEPRECATED] `/event/descriptions/eventLevel` | GET | EventLevelDescriptionHandler | [EventLevelDescriptionHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event_descriptions/EventLevelDescriptionHandler.java) | [EventLevelDescriptionHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event_descriptions/EventLevelDescriptionHandler.java) |
| [DEPRECATED] `/event/descriptions/eventLevel/listByEventLevels` | GET | SpecificEventLevelDescriptionHandler | [SpecificEventLevelDescriptionHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event_descriptions/SpecificEventLevelDescriptionHandler.java) | [SpecificEventLevelDescriptionHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event_descriptions/SpecificEventLevelDescriptionHandler.java) |
| [DEPRECATED] `/event/descriptions/eventType` | GET | EventTypeDescriptionHandler | [EventTypeDescriptionHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event_descriptions/EventTypeDescriptionHandler.java) | [EventTypeDescriptionHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event_descriptions/EventTypeDescriptionHandler.java) |
| [DEPRECATED] `/event/descriptions/eventType/listByEventTypes` | GET | SpecificEventTypeDescriptionHandler | [SpecificEventTypeDescriptionHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event_descriptions/SpecificEventTypeDescriptionHandler.java) | [SpecificEventTypeDescriptionHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event_descriptions/SpecificEventTypeDescriptionHandler.java) |
| [DEPRECATED] `/event/descriptions/ux` | GET | UXNameDescriptionHandler | [UXNameDescriptionHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event_descriptions/UXNameDescriptionHandler.java) | [UXNameDescriptionHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event_descriptions/UXNameDescriptionHandler.java) |
| [DEPRECATED] `/event/descriptions/ux/listByUx` | GET | SpecificUXDescriptionHandler | [SpecificUXDescriptionHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event_descriptions/SpecificUXDescriptionHandler.java) | [SpecificUXDescriptionHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event_descriptions/SpecificUXDescriptionHandler.java) |

### Event Wrapper:  [Event](../../src/main/java/net/accelbyte/sdk/api/eventlog/wrappers/Event.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| [DEPRECATED] `/event/namespaces/{namespace}` | GET | GetEventByNamespaceHandler | [GetEventByNamespaceHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event/GetEventByNamespaceHandler.java) | [GetEventByNamespaceHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event/GetEventByNamespaceHandler.java) |
| [DEPRECATED] `/event/namespaces/{namespace}` | POST | PostEventHandler | [PostEventHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event/PostEventHandler.java) | [PostEventHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event/PostEventHandler.java) |
| [DEPRECATED] `/event/namespaces/{namespace}/eventId/{eventId}` | GET | GetEventByEventIDHandler | [GetEventByEventIDHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event/GetEventByEventIDHandler.java) | [GetEventByEventIDHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event/GetEventByEventIDHandler.java) |
| [DEPRECATED] `/event/namespaces/{namespace}/eventType/{eventType}` | GET | GetEventByEventTypeHandler | [GetEventByEventTypeHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event/GetEventByEventTypeHandler.java) | [GetEventByEventTypeHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event/GetEventByEventTypeHandler.java) |
| [DEPRECATED] `/event/namespaces/{namespace}/eventType/{eventType}/eventId/{eventId}` | GET | GetEventByEventTypeAndEventIDHandler | [GetEventByEventTypeAndEventIDHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event/GetEventByEventTypeAndEventIDHandler.java) | [GetEventByEventTypeAndEventIDHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event/GetEventByEventTypeAndEventIDHandler.java) |
| [DEPRECATED] `/event/namespaces/{namespace}/users/{userId}` | GET | GetEventByUserIDHandler | [GetEventByUserIDHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event/GetEventByUserIDHandler.java) | [GetEventByUserIDHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event/GetEventByUserIDHandler.java) |
| [DEPRECATED] `/event/namespaces/{namespace}/users/{userId}/eventId/{eventId}` | GET | GetEventByUserIDAndEventIDHandler | [GetEventByUserIDAndEventIDHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event/GetEventByUserIDAndEventIDHandler.java) | [GetEventByUserIDAndEventIDHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event/GetEventByUserIDAndEventIDHandler.java) |
| [DEPRECATED] `/event/namespaces/{namespace}/users/{userId}/eventType/{eventType}` | GET | GetEventByUserIDAndEventTypeHandler | [GetEventByUserIDAndEventTypeHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event/GetEventByUserIDAndEventTypeHandler.java) | [GetEventByUserIDAndEventTypeHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event/GetEventByUserIDAndEventTypeHandler.java) |
| [DEPRECATED] `/event/namespaces/{namespace}/users/{userId}/eventType/{eventType}/eventId/{eventId}` | GET | GetEventByUserEventIDAndEventTypeHandler | [GetEventByUserEventIDAndEventTypeHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event/GetEventByUserEventIDAndEventTypeHandler.java) | [GetEventByUserEventIDAndEventTypeHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event/GetEventByUserEventIDAndEventTypeHandler.java) |

### User Information Wrapper:  [UserInformation](../../src/main/java/net/accelbyte/sdk/api/eventlog/wrappers/UserInformation.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| [DEPRECATED] `/event/namespaces/{namespace}/users/{userId}/activities` | GET | GetUserActivitiesHandler | [GetUserActivitiesHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/user_information/GetUserActivitiesHandler.java) | [GetUserActivitiesHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/user_information/GetUserActivitiesHandler.java) |
| [DEPRECATED] `/event/namespaces/{namespace}/users/{userId}/activities` | DELETE | DeleteUserActivitiesHandler | [DeleteUserActivitiesHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/user_information/DeleteUserActivitiesHandler.java) | [DeleteUserActivitiesHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/user_information/DeleteUserActivitiesHandler.java) |
| [DEPRECATED] `/event/namespaces/{namespace}/users/{userId}/lastActivityTime` | GET | LastUserActivityTimeHandler | [LastUserActivityTimeHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/user_information/LastUserActivityTimeHandler.java) | [LastUserActivityTimeHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/user_information/LastUserActivityTimeHandler.java) |

### Event Registry Wrapper:  [EventRegistry](../../src/main/java/net/accelbyte/sdk/api/eventlog/wrappers/EventRegistry.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| [DEPRECATED] `/event/registry/eventIds` | GET | GetRegisteredEventsHandler | [GetRegisteredEventsHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event_registry/GetRegisteredEventsHandler.java) | [GetRegisteredEventsHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event_registry/GetRegisteredEventsHandler.java) |
| [DEPRECATED] `/event/registry/eventIds` | POST | RegisterEventHandler | [RegisterEventHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event_registry/RegisterEventHandler.java) | [RegisterEventHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event_registry/RegisterEventHandler.java) |
| [DEPRECATED] `/event/registry/eventIds/{eventId}` | GET | GetRegisteredEventIDHandler | [GetRegisteredEventIDHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event_registry/GetRegisteredEventIDHandler.java) | [GetRegisteredEventIDHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event_registry/GetRegisteredEventIDHandler.java) |
| [DEPRECATED] `/event/registry/eventIds/{eventId}` | POST | UpdateEventRegistryHandler | [UpdateEventRegistryHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event_registry/UpdateEventRegistryHandler.java) | [UpdateEventRegistryHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event_registry/UpdateEventRegistryHandler.java) |
| [DEPRECATED] `/event/registry/eventIds/{eventId}` | DELETE | UnregisterEventIDHandler | [UnregisterEventIDHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event_registry/UnregisterEventIDHandler.java) | [UnregisterEventIDHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event_registry/UnregisterEventIDHandler.java) |
| [DEPRECATED] `/event/registry/eventTypes/{eventType}` | GET | GetRegisteredEventsByEventTypeHandler | [GetRegisteredEventsByEventTypeHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event_registry/GetRegisteredEventsByEventTypeHandler.java) | [GetRegisteredEventsByEventTypeHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event_registry/GetRegisteredEventsByEventTypeHandler.java) |

### Event V2 Wrapper:  [EventV2](../../src/main/java/net/accelbyte/sdk/api/eventlog/wrappers/EventV2.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/event/v2/admin/namespaces/{namespace}/query` | POST | QueryEventStreamHandler | [QueryEventStreamHandler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event_v2/QueryEventStreamHandler.java) | [QueryEventStreamHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event_v2/QueryEventStreamHandler.java) |
| `/event/v2/admin/namespaces/{namespace}/users/{userId}/event` | GET | GetEventSpecificUserV2Handler | [GetEventSpecificUserV2Handler](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event_v2/GetEventSpecificUserV2Handler.java) | [GetEventSpecificUserV2Handler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event_v2/GetEventSpecificUserV2Handler.java) |
| `/event/v2/public/namespaces/{namespace}/users/{userId}/edithistory` | GET | GetPublicEditHistory | [GetPublicEditHistory](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event_v2/GetPublicEditHistory.java) | [GetPublicEditHistory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event_v2/GetPublicEditHistory.java) |
| `/event/v2/public/namespaces/{namespace}/users/{userId}/event` | GET | GetUserEventsV2Public | [GetUserEventsV2Public](../../src/main/java/net/accelbyte/sdk/api/eventlog/operations/event_v2/GetUserEventsV2Public.java) | [GetUserEventsV2Public](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/eventlog/event_v2/GetUserEventsV2Public.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `models.AgentType` | [ModelsAgentType](../../src/main/java/net/accelbyte/sdk/api/eventlog/models/ModelsAgentType.java) |
| `models.Event` | [ModelsEvent](../../src/main/java/net/accelbyte/sdk/api/eventlog/models/ModelsEvent.java) |
| `models.EventID` | [ModelsEventID](../../src/main/java/net/accelbyte/sdk/api/eventlog/models/ModelsEventID.java) |
| `models.EventLevel` | [ModelsEventLevel](../../src/main/java/net/accelbyte/sdk/api/eventlog/models/ModelsEventLevel.java) |
| `models.EventRegistry` | [ModelsEventRegistry](../../src/main/java/net/accelbyte/sdk/api/eventlog/models/ModelsEventRegistry.java) |
| `models.EventResponse` | [ModelsEventResponse](../../src/main/java/net/accelbyte/sdk/api/eventlog/models/ModelsEventResponse.java) |
| `models.EventResponseV2` | [ModelsEventResponseV2](../../src/main/java/net/accelbyte/sdk/api/eventlog/models/ModelsEventResponseV2.java) |
| `models.EventType` | [ModelsEventType](../../src/main/java/net/accelbyte/sdk/api/eventlog/models/ModelsEventType.java) |
| `models.EventV2` | [ModelsEventV2](../../src/main/java/net/accelbyte/sdk/api/eventlog/models/ModelsEventV2.java) |
| `models.GenericQueryPayload` | [ModelsGenericQueryPayload](../../src/main/java/net/accelbyte/sdk/api/eventlog/models/ModelsGenericQueryPayload.java) |
| `models.MultipleAgentType` | [ModelsMultipleAgentType](../../src/main/java/net/accelbyte/sdk/api/eventlog/models/ModelsMultipleAgentType.java) |
| `models.MultipleEventID` | [ModelsMultipleEventID](../../src/main/java/net/accelbyte/sdk/api/eventlog/models/ModelsMultipleEventID.java) |
| `models.MultipleEventLevel` | [ModelsMultipleEventLevel](../../src/main/java/net/accelbyte/sdk/api/eventlog/models/ModelsMultipleEventLevel.java) |
| `models.MultipleEventType` | [ModelsMultipleEventType](../../src/main/java/net/accelbyte/sdk/api/eventlog/models/ModelsMultipleEventType.java) |
| `models.MultipleUX` | [ModelsMultipleUX](../../src/main/java/net/accelbyte/sdk/api/eventlog/models/ModelsMultipleUX.java) |
| `models.Pagination` | [ModelsPagination](../../src/main/java/net/accelbyte/sdk/api/eventlog/models/ModelsPagination.java) |
| `models.Paging` | [ModelsPaging](../../src/main/java/net/accelbyte/sdk/api/eventlog/models/ModelsPaging.java) |
| `models.UX` | [ModelsUX](../../src/main/java/net/accelbyte/sdk/api/eventlog/models/ModelsUX.java) |
| `models.UserLastActivity` | [ModelsUserLastActivity](../../src/main/java/net/accelbyte/sdk/api/eventlog/models/ModelsUserLastActivity.java) |
