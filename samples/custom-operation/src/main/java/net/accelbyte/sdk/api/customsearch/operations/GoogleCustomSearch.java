package net.accelbyte.sdk.api.customsearch.operations;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.Sets;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldNameConstants;
import net.accelbyte.sdk.api.customsearch.models.CustomSearchResult;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import org.apache.commons.lang3.StringUtils;

@Setter
@Getter
@FieldNameConstants
public class GoogleCustomSearch extends Operation {
  /** generated field's value */
  private final String path = "/customsearch/v1";

  private final String method = "GET";
  private final List<String> produces = Arrays.asList("application/json");

  /** fields as input parameter */
  private String cx;

  private String key;

  private Integer num;

  private String q;

  private String safe;

  @Getter(AccessLevel.NONE)
  private final Set<String> safePossibleValues = Sets.newHashSet("active", "off");

  @Builder
  private GoogleCustomSearch(String cx, String key, int num, String q, String safe) {
    this.cx = cx;
    this.key = key;
    this.num = num;
    this.q = q;
    this.safe = safe;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    HashMap<String, List<String>> queryParams = new HashMap<>();
    if (StringUtils.isNotBlank(cx)) {
      queryParams.put(Fields.cx, ImmutableList.of(cx));
    }
    if (StringUtils.isNotBlank(key)) {
      queryParams.put(Fields.key, ImmutableList.of(key));
    }
    if (Objects.nonNull(num)) {
      queryParams.put(Fields.num, ImmutableList.of(String.valueOf(num)));
    }
    if (StringUtils.isNotBlank(q)) {
      queryParams.put(Fields.q, ImmutableList.of(q));
    }
    if (StringUtils.isNotBlank(safe)) {
      queryParams.put(Fields.safe, ImmutableList.of(safe));
    }
    return queryParams;
  }

  @Override
  public boolean isValid() {
    return StringUtils.isNotBlank(cx)
        && StringUtils.isNotBlank(key)
        && Objects.nonNull(num)
        && num >= 1
        && num <= 10
        && StringUtils.isNotBlank(q)
        && safePossibleValues.contains(safe);
  }

  public CustomSearchResult parseResponse(int code, String contentType, InputStream payload)
      throws IOException, HttpResponseException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new CustomSearchResult().createFromJson(json);
  }
}
