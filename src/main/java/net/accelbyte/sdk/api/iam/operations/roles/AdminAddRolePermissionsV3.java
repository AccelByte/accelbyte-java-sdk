/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.iam.operations.roles;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.AccountcommonPermissionsV3;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminAddRolePermissionsV3
 *
 * 
 * 
 * Required permission 'ADMIN:ROLE [UPDATE]'
 * 
 * 
 * 
 * 
 * This endpoint will ATTACH permission(s) into the role
 * 
 * 
 * 
 * action code: 10404
 * 
 * 
 * 
 * Schedule contains cron string or date range (both are UTC, also in cron syntax) to indicate when a permission and action are in effect.
 * 
 * 
 * 
 * 
 * Both schedule types accepts quartz compatible cron syntax e.g. * * * * * * *.
 * 
 * 
 * 
 * 
 * In ranged schedule, first element will be start date, and second one will be end date
 * 
 * 
 * 
 * 
 * If schedule is set, the scheduled action must be valid too, that is between 1 to 15, inclusive
 * 
 * 
 * 
 * 
 * Syntax reference
 * 
 * 
 * 
 * 
 * Fields:
 * 
 * 
 * 
 * 
 *                 1. Seconds: 0-59 * / , -
 * 
 * 
 *                 2. Minutes: 0-59 * / , -
 * 
 * 
 *                 3. Hours: 0-23 * / , -
 * 
 * 
 *                 4. Day of month: 1-31 * / , - L W
 * 
 * 
 *                 5. Month: 1-12 JAN-DEC * / , -
 * 
 * 
 *                 6. Day of week: 0-6 SUN-SAT * / , - L #
 * 
 * 
 *                 7. Year: 1970-2099 * / , -
 * 
 * 
 * 
 * 
 * Special characters:
 * 
 * 
 * 
 * 
 *                 1. *: all values in the fields, e.g. * in seconds fields indicates every second
 * 
 * 
 *                 2. /: increments of ranges, e.g. 3-59/15 in the minute field indicate the third minute of the hour and every 15 minutes thereafter
 * 
 * 
 *                 3. ,: separate items of a list, e.g. MON,WED,FRI in day of week
 * 
 * 
 *                 4. -: range, e.g. 2010-2018 indicates every year between 2010 and 2018, inclusive
 * 
 * 
 *                 5. L: last, e.g. When used in the day-of-week field, it allows you to specify constructs such as "the last Friday" (5L) of a given month. In the day-of-month field, it specifies the last day of the month.
 * 
 * 
 *                 6. W: business day, e.g. if you were to specify 15W as the value for the day-of-month field, the meaning is: "the nearest business day to the 15th of the month."
 * 
 * 
 *                 7. #: must be followed by a number between one and five. It allows you to specify constructs such as "the second Friday" of a given month.
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class AdminAddRolePermissionsV3 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/admin/roles/{roleId}/permissions";

    @JsonIgnore
    private String method = "POST";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/json");

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = null;

    /**
     * fields as input parameter
     */
    private String roleId;
    private AccountcommonPermissionsV3 body;

    /**
    * @param roleId required
    * @param body required
    */
    public AdminAddRolePermissionsV3(
            String roleId,
            AccountcommonPermissionsV3 body
    )
    {
        this.roleId = roleId;
        this.body = body;
    }

    @JsonIgnore
    public AdminAddRolePermissionsV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.roleId != null){
            pathParams.put("roleId", this.roleId);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public AccountcommonPermissionsV3 getBodyParams(){
        return this.body;
    }


    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("roleId","roleId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "roleId"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.roleId == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}