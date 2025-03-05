/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.operations.game_session;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * createGameSession
 *
 * <p>Create a game session. Session configuration "name" is mandatory, this API will refer
 * following values from the session template if they're not provided in the request: - type -
 * joinability - autoJoin. If enabled (set to true), players provided in the request will
 * automatically joined the initial game session creation. Game session will not send any invite and
 * players dont need to act upon it. - minPlayers - maxPlayers - inviteTimeout - inactiveTimeout -
 * attributes - dsSource - tieTeamsSessionLifetime - matchPool - clientVersion - deployment -
 * serverName - textChat - autoJoin - requestedRegions - preferredClaimKeys - fallbackClaimKeys -
 * customURLGRPC
 *
 * <p>When the tieTeamsSessionLifetime is true, the lifetime of any partyId inside teams attribute
 * will be tied to the game session. Only applies when the teams partyId is a game session.
 *
 * <p>Session has 2 fields for user status: "status" and "statusV2". The "status" is there for
 * backward-compatibility, therefore we encourage to just rely on "statusV2" for the more updated
 * statuses. User statuses: 1. INVITED: by default, to join a session (except session with OPEN
 * joinability or if session configuration has "autoJoin" sets to True) a user will receive an
 * invite. The invitee will have the chance to respond within "inviteTimeout" which you can
 * configure through session configuration. 2. TIMEOUT: when a user is invited to a session, they
 * will receive an invite. Unless "disableResendInvite" sets to True in the session configuration,
 * the user will also receive invite reminder every 30s until they respond to the invite. 3.
 * REJECTED: when a user rejects an invite. To rejoin an INVITE_ONLY session, they will need to be
 * re-invited and accept the invite. 4. JOINED: there are few ways of a user to join a session, by
 * invite, direct join (depends on session joinability) or join by code. upon invite, once a user
 * accepts an invite, their status will be changed to JOINED. 5. LEFT: user can leave a session. in
 * case of party, a user can only be in 1 party at a time. therefore when they decide to create or
 * join another party, they will be automatically removed from their initial party and their status
 * will be changed to LEFT. 6. KICKED: only party leader can kick a member. 7. DISCONNECTED: if user
 * still have reserved seat in the session and they disconnect lobby websocket, their status in the
 * session will be changed to DISCONNECTED and field "members.previousStatus" of that user will
 * contains the initial status before they disconnect lobby websocket. the user will be given chance
 * to reconnect within "inactiveTimeout" which you can configure through session configuration. 8.
 * CONNECTED: when a user reconnect their lobby websocket, their status will change from
 * DISCONNECTED to CONNECTED, only if they previously JOINED session. if they were on INVITED state
 * before the disconnect happened, the user's status will return back to INVITED after they
 * reconnect. 9. DROPPED: when "inactiveTimeout" is due and user never re-establish their websocket
 * connection, we will drop them from the session. 10. TERMINATED: only applies to game session. If
 * a game session (match) is ended, DS will end/delete the session and we will mark all remaining
 * users' status to be TERMINATED. 11. CANCELLED: when a session joinability changes to CLOSED, any
 * remaining invites will be canceled.
 *
 * <p>User is considered as active if they're present in the session, which their status either
 * CONNECTED or JOINED. User has a reserved seat in the session if their status either INVITED,
 * JOINED, CONNECTED, DISCONNECTED. When user's' status change to other than these mentioned
 * statuses, we will release the seat for other players to occupy.
 *
 * <p>Managing the relation between session and lobby websocket connection: - Session relies on
 * lobby to consider player's connection health to our backend. therefore a disruption to lobby
 * websocket will be reflected in the user's status in all of their session(s). - If user still have
 * a reserved seat in the session and they disconnect lobby websocket, their status in session(s)
 * will be changed to DISCONNECTED and field "members.previousStatus" of that user will contains the
 * initial status before they disconnect lobby websocket. This "members.previousStatus" used to
 * track user's previous status before they disconnect websocket, since we still reserve a seat for
 * them, therefore this field will be empty again after they websocket. - If the disconnected user
 * is the leader of the session they're disconnected from, we will wait until
 * "leaderElectionGracePeriod" is due, to promote the next oldest member as the new leader of the
 * session. You can configure "leaderElectionGracePeriod" through session configuration. - The user
 * will be given chance to reconnect within "inactiveTimeout" which you can configure through
 * session configuration. If until "inactiveTimeout" is due and the user doesn't reconnect their
 * websocket, they will be removed from session and their status will change to DROPPED. If the
 * dropped user was the leader of the session, we will promote the next oldest member as leader. -
 * By default, we will update user's status to what it was before disconnect, when the user
 * reconnects lobby websocket, unless "manualRejoin" sets to True in the session configuration. When
 * "manualRejoin" is enabled, after lobby websocket reconnect, the game client will need to manually
 * invoke join session again to rejoin the session. - If the user was on INVITED state before the
 * disconnect happened, the user's status will return back to INVITED after they reconnect.
 *
 * <p>When the session type is a DS, a DS creation request will be sent if number of active players
 * reaches session's minPlayers. Session service has several DSInformation status to track DS
 * request to DS providers: - NEED_TO_REQUEST: number of active players hasn't reached session's
 * minPlayers therefore DS has not yet requested. - REQUESTED: DS is being requested to DSMC. -
 * PREPARING: DS needs to call manual set ready for the game session - AVAILABLE: DS is ready to
 * use. The DSMC status for this DS is either READY/BUSY. - FAILED_TO_REQUEST: DSMC fails to spin up
 * a DS for session. - DS_ERROR: DS provider fails to spin up the DS or the DS itself becomes
 * unreachable - DS_CANCELLED: when DSMC is preparing the DS, DSMC will give a temporary DS. In this
 * phase, if you delete the game session, the DS request will be canceled. - ENDED: when a game
 * session (match) has finished and DS has done its job, it will terminate itself. - UNKNOWN: if any
 * unknown DS status is detected. DSInformation has 2 fields for DS status: "status" and "statusV2".
 * The "status" is there for backward-compatibility, therefore we encourage to just rely on
 * "statusV2" for the more updated statuses. DS Source can be DSMC, AMS or custom. In DSMC, a DS
 * request will be put in queue if they dont have available buffers, and DSMC will let the service
 * knows when they finished spinning it up. While AMS doesn't have a concept of queue. Therefore
 * some "DSInformation.statusV2" only applicable for DSMC.
 *
 * <p>By default, DS requests are sent to DSMC, but if dsSource is set to "AMS": - A DS will be
 * requested from AMS instead of DSMC. - The server will be chosen based on a set of claim keys, in
 * order of preference, to match with fleets. - The claim key list is built build from the
 * preferredClaimKeys, fallbackClaimKeys, and clientVersion as follows: [preferredClaimKeys..,
 * clientVersion, fallbackClaimKeys...] - ttlHours is how long the session will active, only non
 * persistent can use this, max value is 168 hours for session override can follow guideline in here
 * https://docs.accelbyte.io/gaming-services/services/extend/override-ags-feature/getting-started-with-session-customization-server-dsm/
 */
@Getter
@Setter
public class CreateGameSession extends Operation {
  /** generated field's value */
  private String path = "/session/v1/public/namespaces/{namespace}/gamesession";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private ApimodelsCreateGameSessionRequest body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreateGameSession(String namespace, ApimodelsCreateGameSessionRequest body) {
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public ApimodelsCreateGameSessionRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public ApimodelsGameSessionResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelsGameSessionResponse().createFromJson(json);
  }
}
