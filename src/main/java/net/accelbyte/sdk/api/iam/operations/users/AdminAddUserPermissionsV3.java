/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.AccountcommonPermissions;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminAddUserPermissionsV3
 *
 * 
 * 
 * Required permission 'ADMIN:NAMESPACE:{namespace}:PERMISSION:USER:{userId} [CREATE]'
 * 
 * 
 * 
 * 
 * This endpoint will APPEND user's permissions with the ones defined in body
 * 
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
public class AdminAddUserPermissionsV3 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/admin/namespaces/{namespace}/users/{userId}/permissions";

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
    private String namespace;
    private String userId;
    private AccountcommonPermissions body;

    /**
    * @param namespace required
    * @param userId required
    * @param body required
    */
    @Builder
    public AdminAddUserPermissionsV3(
            String namespace,
            String userId,
            AccountcommonPermissions body
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.body = body;
    }

    @JsonIgnore
    public AdminAddUserPermissionsV3 createFromJson(String json) throws JsonProcessingException {
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
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public AccountcommonPermissions getBodyParams(){
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
        result.put("namespace","namespace");
        result.put("userId","userId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "userId"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.userId == null) {
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