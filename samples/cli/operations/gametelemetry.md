## Java Extend SDK CLI Sample App Operation Index for Gametelemetry service

### Operation GetNamespacesGameTelemetryV1AdminNamespacesGet

```sh
$ build/install/cli/bin/cli gametelemetry getNamespacesGameTelemetryV1AdminNamespacesGet
```

### Operation GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet

```sh
$ build/install/cli/bin/cli gametelemetry getEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet \
    --namespace <namespace value> \
    --deviceType <deviceType value - optional> \
    --endTime <endTime value - optional> \
    --eventId <eventId value - optional> \
    --eventName <eventName value - optional> \
    --eventPayload <eventPayload value - optional> \
    --flightId <flightId value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --startTime <startTime value - optional> \
    --userId <userId value - optional>
```

### Operation ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost

```sh
$ build/install/cli/bin/cli gametelemetry protectedSaveEventsGameTelemetryV1ProtectedEventsPost \
    --body <json string for request body>
```

### Operation ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet

```sh
$ build/install/cli/bin/cli gametelemetry protectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet \
    --steamId <steamId value> \

```

### Operation ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut

```sh
$ build/install/cli/bin/cli gametelemetry protectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut \
    --playtime <playtime value> \
    --steamId <steamId value> \

```

