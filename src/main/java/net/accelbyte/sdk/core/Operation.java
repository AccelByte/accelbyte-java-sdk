/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.util.Helper;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
public abstract class Operation {
    protected String path = "";
    protected String method = "";
    protected List<String> consumes = new ArrayList<>();
    protected List<String> produces = new ArrayList<>();
    @Deprecated
    protected String security = "";
    protected String preferredSecurityMethod = "";
    protected List<String> securities = new ArrayList<>();
    protected String locationQuery = "";

    public Map<String, String> getPathParams() {
        return new HashMap<>();
    }

    public Map<String, List<String>> getQueryParams() {
        return new HashMap<>();
    }

    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Helper.createFullUrl(baseUrl, this.getPath(), this.getPathParams(),
                this.getQueryParams(), this.getCollectionFormatMap());
    }

    public Map<String, String> getCookieParams() {
        return new HashMap<>();
    }

    public Object getBodyParams() {
        return null;
    }

    public Map<String, Object> getFormParams() {
        return new HashMap<>();
    }

    public abstract boolean isValid();

    protected Map<String, String> getCollectionFormatMap() {
        return new HashMap<>();
    }
}
