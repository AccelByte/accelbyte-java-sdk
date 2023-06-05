/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.roles;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AddRolePermission
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>Required permission 'ROLE:ADMIN [UPDATE]' Or 'ADMIN:ROLE [UPDATE]'
 *
 * <p>This endpoint will update existing permission (bitwise OR the action) if found one with same
 * resource, otherwise it will append a new permission
 *
 * <p>Schedule contains cron string or date range (both are UTC, also in cron syntax) to indicate
 * when a permission and action are in effect.
 *
 * <p>Both schedule types accepts quartz compatible cron syntax e.g. * * * * * * *.
 *
 * <p>In ranged schedule, first element will be start date, and second one will be end date
 *
 * <p>If schedule is set, the scheduled action must be valid too, that is between 1 to 15, inclusive
 *
 * <p>Syntax reference
 *
 * <p>Fields:
 *
 * <p>1. Seconds: 0-59 * / , -
 *
 * <p>2. Minutes: 0-59 * / , -
 *
 * <p>3. Hours: 0-23 * / , -
 *
 * <p>4. Day of month: 1-31 * / , - L W
 *
 * <p>5. Month: 1-12 JAN-DEC * / , -
 *
 * <p>6. Day of week: 0-6 SUN-SAT * / , - L #
 *
 * <p>7. Year: 1970-2099 * / , -
 *
 * <p>Special characters:
 *
 * <p>1. *: all values in the fields, e.g. * in seconds fields indicates every second
 *
 * <p>2. /: increments of ranges, e.g. 3-59/15 in the minute field indicate the third minute of the
 * hour and every 15 minutes thereafter
 *
 * <p>3. ,: separate items of a list, e.g. MON,WED,FRI in day of week
 *
 * <p>4. -: range, e.g. 2010-2018 indicates every year between 2010 and 2018, inclusive
 *
 * <p>5. L: last, e.g. When used in the day-of-week field, it allows you to specify constructs such
 * as "the last Friday" (5L) of a given month. In the day-of-month field, it specifies the last day
 * of the month.
 *
 * <p>6. W: business day, e.g. if you were to specify 15W as the value for the day-of-month field,
 * the meaning is: "the nearest business day to the 15th of the month."
 *
 * <p>7. #: must be followed by a number between one and five. It allows you to specify constructs
 * such as "the second Friday" of a given month.
 *
 * <p>Endpoint migration guide
 *
 * <p>* Substitute endpoint(update): /iam/v3/admin/roles/{roleId}/permissions [PUT]
 *
 * <p>* Substitute endpoint(create): /iam/v3/admin/roles/{roleId}/permissions [POST]
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class AddRolePermission extends Operation {
  /** generated field's value */
  private String path = "/iam/roles/{roleId}/permissions/{resource}/{action}";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private Integer action;

  private String resource;
  private String roleId;
  private ModelUpdatePermissionScheduleRequest body;

  /**
   * @param action required
   * @param resource required
   * @param roleId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AddRolePermission(
      Integer action, String resource, String roleId, ModelUpdatePermissionScheduleRequest body) {
    this.action = action;
    this.resource = resource;
    this.roleId = roleId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.action != null) {
      pathParams.put("action", this.action == null ? null : String.valueOf(this.action));
    }
    if (this.resource != null) {
      pathParams.put("resource", this.resource);
    }
    if (this.roleId != null) {
      pathParams.put("roleId", this.roleId);
    }
    return pathParams;
  }

  @Override
  public ModelUpdatePermissionScheduleRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.action == null) {
      return false;
    }
    if (this.resource == null) {
      return false;
    }
    if (this.roleId == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
