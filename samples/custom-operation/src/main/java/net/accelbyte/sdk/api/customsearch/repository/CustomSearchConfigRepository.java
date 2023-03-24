package net.accelbyte.sdk.api.customsearch.repository;

import net.accelbyte.sdk.core.repository.DefaultConfigRepository;

public class CustomSearchConfigRepository extends DefaultConfigRepository {

    @Override
    public String getBaseURL() {
        return "https://www.googleapis.com";
    }
}
