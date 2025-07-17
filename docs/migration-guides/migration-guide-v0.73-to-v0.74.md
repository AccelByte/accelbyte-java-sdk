<a name="v0.74.0"></a>
## [v0.74.0] - 2025-07-17

### REMOVED SERVICE APIS
DSartifact, DSLogManager, DSMC, and QOSM APIs have been removed in this release.

### BREAKING CHANGE

### platform

- Operation `net.accelbyte.sdk.api.platform.operations.store.ImportStoreByCSV`
    - These required parameters now optional.
        - `category`
        - `display`
        - `item`
        - `notes`
        - `section`