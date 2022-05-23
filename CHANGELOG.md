<a name="v0.11.0"></a>
## [v0.11.0] - 2022-05-23
### Chore
- bump version
- fix coverity issues
- **doc:** regenerate doc index for justice 3.23
- **samples:** regenerate cli sample app for justice 3.23
- **sdk:** use more enums
- **sdk:** regenerate sdk for justice 3.23
- **sdk:** okhttpclient - refactor create request and response
- **spec:** update spec for justice 3.23
- **test:** regenerate cli sample app test for justice 3.23

### Ci
- **coverity:** do not run test

### Docs
- update changelog
- **samples:** cli - refresh readme

### Feat
- **sdk:** operation - add enum and builder for enum

### Fix
- **sdk:** sdkConfiguration is supposed to be private

### Test
- **integration:** disable gametelemetry for now because it is unreliable
- **integration:** add gametelemetry


<a name="v0.10.0"></a>
## [v0.10.0] - 2022-05-10
### Chore
- gitignore tap test results
- bump version
- **core:** helper - minor clean up
- **core:** operation - remove unused toJson and createFromJson methods
- **core:** model - make abstract
- **core:** operation - isValid method is abstract now
- **core:** operation - use parent GetFullUrl method
- **core:** improve base64 encoding in okhttplogger
- **core:** refactor sdkinfo class
- **doc:** regenerate doc index for justice 3.22
- **model:** remove unused getFieldInfo method
- **samples:** cli - use builder pattern
- **samples:** regenerate cli sample app for justice 3.22
- **sdk:** regenerate sdk for justice 3.22
- **spec:** update spec for justice 3.22
- **test:** move cli test shell scripts
- **test:** revise HttpbinOperation for testing
- **test:** regenerate cli sample app test for justice 3.22
- **test:** rename test core and test integration

### Ci
- **jenkinsfile:** rename core tests
- **jenkinsfile:** revise lint code
- **jenkinsfile:** send build status earlier
- **jenkinsfile.nightly:** revise integration tests
- **nightly:** fix wrong cli test tap result path

### Docs
- update changelog
- **index:** add example column

### Fix
- **core:** okhttpclient - empty body handling
- **helper:** createFullUrl - query string key not escaped properly
- **samples:** cli - make logging optional on login, loginclient, logout

### Test
- **core:** fix string equals problem
- **core:** add http response test
- **core:** revise http request test
- **integration:** fix possible null error when parsing date
- **integration:** rename tests
- **integration:** fix execution ordering


<a name="v0.9.0"></a>
## [v0.9.0] - 2022-04-26
### Chore
- bump version
- **core:** refactor okhttpclient send request logic
- **core:** operation - make getCollectionFormatMap protected
- **core:** operation - remove unused method getAllParams
- **core:** operation - remove unused method getHeaderParams
- **core:** operation - remove parseResponse, handleEmptyResponse methods
- **core:** operation - make abstract
- **core:** operation - make createFullUrl protected
- **core:** operation - move createFullUrl logic to helper
- **core:** revise core Header to HttpHeaders
- **core:** operation - remove unnecessary jsonignore
- **doc:** regenerate doc index for justice 3.21
- **gradle:** use gradle lombok plugin
- **makefile:** pin gradle docker image to version 7-jdk8
- **samples:** cli - regenerate cli (cookie support)
- **sdk:** regenerate sdk (add enum)
- **sdk:** regenerate sdk (cookie support)
- **sdk:** operation - rename getFormParams
- **sdk:** refactor accelbytesdk
- **sdk:** regenerate sdk (prepare to add enum)
- **sdk:** regenerate sdk for justice 3.21
- **spec:** update spec
- **spec:** update spec for justice 3.21
- **spec:** update spec for cookie support
- **spec:** update spec for more cookie support
- **test:** regenerate cli test for justice 3.21
- **test:** remove run-java-cli-all-unit-test.sh

### Ci
- publish unit test core junit xml
- **makefile:** use jdk8 container
- **nightly:** fix publish integration test junit xml
- **nightly:** publish integration test junit xml
- **nightly:** publish tap report

### Docs
- update changelog
- **cli:** use installdist instead of fatjar
- **readme:** mention reference docs + fix wording

### Feat
- **core:** add more cookie support
- **core:** add cookie support

### Fix
- **core:** okhttp websocket client lifecycle
- **sdk:** run request missing cookies
- **sdk:** escape cookie key
- **sdk:** regenerate sdk (fix add enum)

### Test
- **cli:** use nailgun to make it faster
- **cli:** use installdist instead of fatjar
- **cli:** revise shell script
- **cli:** generate tap files
- **core:** add cookie & cookie access_token test
- **integration:** workaround execute session browser test before matchmaking


<a name="v0.8.0"></a>
## [v0.8.0] - 2022-04-12
### Chore
- bump version
- **cli-test:** regenerate cli test for justice 3.20
- **sdk:** regenerate sdk for justice 3.20
- **sdk:** regenerate sdk for justice 3.20
- **spec:** update spec for justice 3.20
- **spec:** update spec for justice 3.20

### Ci
- **nightly:** change integration test lock to justice-demo-serversdktest

### Docs
- update changelog
- update changelog
- update doc index
- added service indexes

### Fix
- **core:** random is instantiated but only used once in helper
- **core:** do not rely on filewriter default encoding in okhttplogger
- **core:** fix potential race condition on okhttpwebsocketclient create
- **core:** potential null exception in okhttplogger

### Test
- **integration:** fix legal integration test
- **integration:** fix potential null exception
- **integration:** fix group integration test
- **integration:** fix event log integration test


<a name="v0.7.0"></a>
## [v0.7.0] - 2022-03-29
### Chore
- bump version
- add gradle check (checkstyle)
- clean up build
- clean up test
- clean up checkstyle
- **cli-test:** regenerate cli test for justice 3.19.0
- **makefile:** improve speed
- **samples:** remove redundant samples
- **sdk:** regenerate sdk for justice 3.19.0
- **spec:** update spec for justice 3.19.0

### Ci
- fix build (exclude test)
- fix lint
- integrate integration test
- add gradle check + report
- **nightly:** make integration test error more informative

### Docs
- update changelog
- standardize readme.md

### Fix
- **core:** use builder for login client token grant v3
- **samples:** cli not running in windows due to path issues

### Test
- **integration:** adjust matchmaking test order
- **integration:** fix test setup
- **integration:** fix remaining issues (legal consent, lobby ws, lobby, matchmaking, social)
- **integration:** fix coverity build error
- **integration:** initial implementation


<a name="v0.6.0"></a>
## [v0.6.0] - 2022-03-15
### Chore
- bump version
- **samples:** regenerate cli
- **samples:** regenerate cli
- **sdk:** regenerate sdk
- **sdk:** regenerate sdk
- **spec:** update spec
- **spec:** update spec
- **tests:** regenerate cli tests
- **tests:** regenerate cli tests

### Docs
- update changelog

### Feat
- **logging:** initial logging implementation

### Test
- **cli:** fix language code format
- **cli:** fix lobby ws cli test


<a name="v0.5.0"></a>
## [v0.5.0] - 2022-03-02
### Chore
- update changelog
- version bump
- add gradle properties for faster build
- add copyright header
- **api:** regenerate services
- **sample:** regenerate cli
- **spec:** update spec files
- **test:** regenerate test

### Ci
- **coverity:** use updated cov-analysis
- **github:** run github jenkins job in codegen build machine

### Feat
- **api:** add documentation and deprecated annotation
- **api:** add builder pattern to the model classes
- **api:** add builder feature to the operation class constructor
- **core:** inject 'User-Agent' automatically in each request
- **core:** add optional 'X-Amzn-Trace-Id' header in each request
- **samples:** add cli app for lobby websocket
- **samples:** add unit test mode to websocket cli app

### Fix
- add missing shebang
- add missing copyright header
- **core:** change login operation to use builder pattern
- **core:** add 'X-Amzn-Trace-Id' header in each request to be default

### Test
- add unit test against mock server for websocket api


<a name="v0.4.0"></a>
## [v0.4.0] - 2022-02-14
### Chore
- version bump
- **api:** regenerate services
- **specs:** regenerate test files
- **specs:** update spec files

### Ci
- **nightly:** initial commit

### Docs
- update changelog
- update readme file

### Feat
- **test:** add unit tests against mock server

### Fix
- **api:** incorrect form data params value assignment
- **api:** response message handling
- **core:** adjust login method to the new sdk version
- **core:** invalid request method and body
- **core:** invalid get form data params checking
- **core:** change function for converting inputstream to string
- **core:** set default content type if not declared
- **makefile:** test_cli not tty error in jenkins
- **sample:** change input stream to file for cli input
- **sample:** invalid exit code on cli apps
- **samples:** set null on unfilled parameter in form data
- **samples:** response handling and log
- **tests:** change unit test parameters


<a name="v0.3.0"></a>
## [v0.3.0] - 2022-02-02
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
- **core:** add helper functions for websocket implementation
- **core:** add logic to handle array within query string
- **sample:** add java sdk cli
- **samples:** update dependency
- **samples:** java-sdk-poc - get dependency from nexus
- **samples:** java sdk websocket poc

### Fix
- upload file handling
- **api:** delete unnecessary variable
- **core:** websocket singleton object
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
### Chore
- version bump
- **api:** regenerate services
- **spec:** update spec files

### Docs
- add changelog
- update readme

### Feat
- add spec files

### Fix
- keep tokengrantv3 security while login


<a name="v0.1.0"></a>
## v0.1.0 - 2022-01-06
### Ci
- add Jenkinsfile.github
- initial commit

### Docs
- update README.md
- add README.md
- add license

### Feat
- add publish gradle
- add logout function
- add login functions
- add generated wrapper classes
- add generated operation classes
- add generated model classes for platform
- add generated model classes except platform
- add core package
- add root package and gradle
- add java sdk sample project structure

### Fix
- group name
- envar name
- root project name
- change envar name
- remove invalid todo
- add json ignore properties
- add json ignore
- form data params handling
- form data params key
- root project name
- core classes
- security type
- return type for auth functions
- generated operation classes constructor
- operation core class

### Refactor
- replace unnecessary object


[v0.11.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.10.0...v0.11.0
[v0.10.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.9.0...v0.10.0
[v0.9.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.8.0...v0.9.0
[v0.8.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.7.0...v0.8.0
[v0.7.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.6.0...v0.7.0
[v0.6.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.5.0...v0.6.0
[v0.5.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.4.0...v0.5.0
[v0.4.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.3.0...v0.4.0
[v0.3.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.2.0...v0.3.0
[v0.2.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.1.0...v0.2.0
