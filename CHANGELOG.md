<a name="v0.8.0"></a>
## [v0.8.0] - 2022-04-11
### Chore
- bump version
- **cli-test:** regenerate cli test for justice 3.20
- **sdk:** regenerate sdk for justice 3.20
- **spec:** update spec for justice 3.20

### Ci
- **nightly:** change integration test lock to justice-demo-serversdktest

### Docs
- update doc index
- update changelog
- added service indexes

### Fix
- **core:** random is instantiated but only used once in helper
- **core:** do not rely on filewriter default encoding in okhttplogger
- **core:** fix potential race condition on okhttpwebsocketclient create
- **core:** potential null exception in okhttplogger

### Test
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


[v0.8.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.7.0...v0.8.0
[v0.7.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.6.0...v0.7.0
[v0.6.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.5.0...v0.6.0
[v0.5.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.4.0...v0.5.0
[v0.4.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.3.0...v0.4.0
[v0.3.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.2.0...v0.3.0
[v0.2.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.1.0...v0.2.0
