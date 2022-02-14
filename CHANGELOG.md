<a name="v0.4.0"></a>
## [v0.4.0] - 2022-02-15

### Chore
- version bump
- fix broken gradle files
- publish to nexus on release stage
- add missing timestamp check
- add test stage
- **api:** regenerate services
- **samples:** regenerate cli
- **spec:** update spec files
- **spec:** add timestamp and lobby wsm spec

### Ci
- build samples
- **coverity:** initial commit

### Docs
- update changelog
- **samples:** fix readme cli

### Feat
- websocket core class
- add junit
- **api:** add websocket message models
- **api:** add function to get collection format and array query string
- **core:** add logic to handle array within query string
- **core:** add helper functions for websocket implementation
- **sample:** add java sdk cli
- **samples:** update dependency
- **samples:** java-sdk-poc - get dependency from nexus
- **samples:** java sdk websocket poc
- **test:** add unit tests against mock server

### Fix
- upload file handling
- **api:** delete unnecessary variable
- **api:** incorrect form data params value assignment
- **core:** set encoding to utf8 instead of system default
- **core:** handle tsv, ssv, pipes collection format
- **core:** invalid get form data params checking
- **core:** invalid request method and body
- **core:** set default content type if not declared
- **core:** websocket singleton object
- **core:** thread safe singleton declaration
- **okhttpclient:** use shared okhttpclient and don't swallow jsonprocessingexception
- **operation:** revise create url a little bit
- **operation:** make convertInputStreamToString protected
- **sample:** invalid exit code on cli apps
- **sample:** change input stream to file for cli input
- **samples:** set null on unfilled parameter in form data
- **samples:** change websocket class implementation
- **wrappers:** close httpresponse payload stream after parsing

### Test
- add test for all collection format type
- add test for query string params

<a name="v0.3.0"></a>
## [v0.3.0] - 2022-02-03

### Breaking change
- **core:** rename TokenRepositoryImpl to DefaultTokenRepository
- **core:** rename ConfigRepositoryImpl to DefaultConfigRepository

### Chore
- fix broken gradle files
- publish to nexus on release stage
- add missing timestamp check
- add test stage
- **api:** regenerate services
- **samples:** regenerate cli
- **spec:** update spec files
- **spec:** add timestamp and lobby wsm spec

### Ci
- build samples
- **coverity:** initial commit

### Docs
- **samples:** fix readme cli

### Feat
- websocket core class
- add junit
- **api:** add websocket message models
- **api:** add function to get collection format and array query string
- **core:** add helper functions for websocket implementation
- **core:** add logic to handle array within query string
- **sample:** add java sdk cli
- **samples:** update dependency
- **samples:** java-sdk-poc - get dependency from nexus
- **samples:** java sdk websocket poc

### Fix
- **core:** websocket singleton object
- **api:** delete unnecessary variable
- upload file handling
- **core:** set encoding to utf8 instead of system default
- **core:** thread safe singleton declaration
- **core:** handle tsv, ssv, pipes collection format
- **okhttpclient:** use shared okhttpclient and don't swallow jsonprocessingexception
- **operation:** revise create url a little bit
- **operation:** make convertInputStreamToString protected
- **samples:** change websocket class implementation
- **wrappers:** close httpresponse payload stream after parsing

### Test
- add test for all collection format type
- add test for query string params

<a name="v0.2.0"></a>
## [v0.2.0] - 2022-01-19

### Feat
- add spec files
- add license to gradle

### Fix
- keep tokengrantv3 security while login
- README.md

### Chore
- **spec:** update spec files
- **api:** regenerate services
- update APIs:
  - cloudsave
    - add, update endpoints
  - group
    - update endpoints
  - iam
    - add, update endpoints
  - legal
    - add, update endpoints
  - lobby
    - update endpoints
  - platform
    - add, update endpoints

[v0.4.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.3.0...v0.4.0
[v0.3.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.2.0...v0.3.0
[v0.2.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.1.0...v0.2.0
