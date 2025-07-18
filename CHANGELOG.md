<a name="v0.74.0"></a>
## [v0.74.0]
### ci
- **coverity:** do not run coverity stage as root
- **:** consolidate builder label lima
- **:** consolidate extend-builder-batch linux-amd64
- **github:** change label to extend-builder-ci
- **generate:** remove cli and integration test stage
- **nightly:** add params for cli and integration test
- **nightly-starter:** remove redundant Jenkinsfile.nightly-starter
### fix
- **:** use admin create user for create user test
### chore
- **core:** remove unnecessary log from default token repo
- **:** remove armada related apis
### test
- **integration:** iam - add missing username
### docs
- **:** fix url


<a name="v0.73.0"></a>
## [v0.73.0]
### REMOVED SERVICE APIS
The Matchmaking (V1), Sessionbrowser, and Sessionhistory APIs have been removed in this release.
### fix
- **test:** use create test user endpoint for integration test
- **:** delete iam client after csm test
### chore
- **:** remove mmv1 related apis
### test
- **integration:** inventory - adjust code snippet


<a name="v0.72.0"></a>
## [v0.72.0]
### ci
- **coverity:** add arm64 build machine support
- **coverity:** this job often stuck in ec2 build machine for certain language
- **coverity:** change coverity download path
### test
- **integration:** gametelemetry - remove deprecated endpoints
- **integration:** loginqueue - fix typo
- **integration:** csm - update changed model
### docs
- **common use cases:** update
### chore
- **sdk:** generated from openapi spec commit: a2c66653b15e9f6a946f1b0f72073f508f4f1299


<a name="v0.71.0"></a>
## [v0.71.0]
### test
- **integration:** skip login queue in ags shared cloud
### ci
- **coverity:** update coverity tool
### chore
- **sdk:** no code change
### fix
- **sdk:** do not start refresh token task when using on demand login client/user


<a name="v0.70.0"></a>
## [v0.70.0]
### feat
- **:** add upload and download helper methods
- **:** add makefile action for method integration test
- **:** update role fetch to use role override endpoint
- **:** add role override integration test
### test
- **:** add upload and download integration tests
### docs
- **readme:** update doc links


<a name="v0.69.0"></a>
## [v0.69.0]
### test
- **:** update junit due to https://github.com/microsoft/vscode-java-test/issues/1740
- **integration:** add csm
- **integration:** game telemetry - disable for shared cloud
- **integration:** challenge - remove unused imports
- **integration:** iam - replace deprecated endpoint
### feat
- **api:** add csm
### docs
- **common-use:** add csm
### chore
- **:** update dependencies to remove vulnerabilities
- **test:** integration - add unique display name on iam create user
- **integration:** integration - login with email address
- **test:** integration - add unique display name on iam create userv3
- **cli:** generate cli Main.java
- **test:** integration - typo on the email


<a name="v0.68.0"></a>
## [v0.68.0]
### feat
- **:** add challenge service integration tests


<a name="v0.67.0"></a>
## [v0.67.0]
### test
- **lobby:** fix lobby test change status checking logic close connection after test
- **ws:** sync test between modular->mono
- **integration:** match2 - fix option name
### fix
- **:** use scheduled timer for ws reconnect
### chore
- **:** remove event log
- **makefile:** improve mock server ready detection
- **:** remove mmv1 and sessionbrowser test
### docs
- **common use case:** remove deprecated services


<a name="v0.66.0"></a>
## [v0.66.0]
### feat
- **:** ws reconnect (added max num reconnect count, -1 for unlimited)
- **:** ws reconnect - add create() override for backward comp
- **:** ws reconnect - cleanup test
- **:** ws reconnect - fix test timing issue
### fix
- **:** ws reconnect tests timing issue
- **:** move ws reconnect tests to dedicated class to avoid affecting other tests
- **:** attempt to fix test failure due to timing issue
- **:** investigate timing related test (add more logging)
- **:** increase verbosity to logging to investigate timing related test issues
- **:** increase loggin verbosity to investigate timing related test issues
- **:** fix timing related issue - should be registerCb then notify for webSocketListener.onOpen
- **core:** query param collection format csv
### chore
- **:** adjust gradle jvm settings due to gc overhead limit exceeded
- **gitignore:** add .vscode
- **makefile:** clean up test_core target commands
- **makefile:** update test_cli to use standalone ws mock server
- **gradle:** due to GC overhead limit exceeded
- **gradle:** due to GC overhead limit exceeded
### test
- **integration:** match2 - update alliance ruleset
- **core:** improve websocket reconnect test
- **integration:** add inventory test


<a name="v0.65.0"></a>
## [v0.65.0]
### docs
- **migration-guide:** correction migration guide for v0.64.0
- **:** update links
- **readme:** fix url typo
### test
- **integration:** due to the service deprecated
- **cli:** use platform linux/amd64
- **integration:** matchmaking - disable  total matchmaking test
- **integration:** group - clear user group member first
- **nightly:** integration - delay sending packets due to db eventual consistency
- **integration:** seasonpass - fix currency code namespace
- **integration:** session history - remove xray
- **integration:** seasonpass - fix currency code namespace
- **generate:** integration - delay sending packets due to db eventual consistency
### fix
- **core:** update due to bigint removal
### ci
- **generate:** use stage_extend-sdk
- **:** use extend-builder-batch
- **:** update commitlint
- **coverity:** use no watch fs
- **:** use extend-builder-ci for all stages
- **:** use slack channel env var
- **:** set tc delay for integration test 200 ms
- **:** set tc delay for integration test back to 100 ms
### chore
- **gradle:** optimize jvmargs
- **makefile:** consolidate gradle image
- **gradle:** increase xmx to 3 gb
- **:** upgrade gradle to 8.5


<a name="v0.64.0"></a>
## [v0.64.0]
### feat
- **:** add ws reconnect logic
- **:** rename class + for onClosing() only reconnect when code is < 4000 and != 1000
- **:** ws add reconnect logic - README
- **:** ws add reconnect logic - rename vars
- **:** ws reconnect logic - added lobby sessionId preservation during reconnect + refactoring


<a name="v0.63.0"></a>
## [v0.63.0]
### fix
- **:** temporarily disable session browser test
### test
- **integration:** ams - add missing namespace param
### docs
- **common-use-case:** update


<a name="v0.62.0"></a>
## [v0.62.0]
### ci
- **:** do not use jenkins master
### test
- **match2:** update ruleset data
- **integration:** make login or refresh token more reliable


<a name="v0.61.0"></a>
## [v0.61.0]
### feat
- **api:** add sessionhistory service
### test
- **:** make compatible with docker desktop
- **integration:** reporting - use unique reason title on each test
- **integration:** add session history
- **integration:** session history - relax assert
- **integration:** session history - clean unused variables
### chore
- **:** increase gradle xmx to 3g
- **samples:** lambda - remove unused files
- **:** upgrade gradle to 7.6.4


<a name="v0.60.0"></a>
## [v0.60.0]
### test
- **integration:** disabled by default for now
### chore
- **:** remove unused imports and vars


<a name="v0.59.0"></a>
## [v0.59.0]
### feat
- **api:** add challenge service
### ci
- **:** switch to extend-builder-ci


<a name="v0.58.0"></a>
## [v0.58.0]
### feat
- **sdk:** initial dsartifact support
### test
- **integration:** legal - remove hardcoded test
### chore
- **github:** update github creds
### docs
- **common-use-cases:** update
### ci
- **generate:** update common use cases doc


<a name="v0.57.0"></a>
## [v0.57.0]
### ci
- **nightly-starter:** separate from nightly
### test
- **integration:** temporarily disable configuration template tests in ags starter
- **integration:** disable TestIntegrationLoginPlatform in ags starter
### feat
- **:** namespace revamp token validation


<a name="v0.56.0"></a>
## [v0.56.0]
### feat
- **:** flight id


<a name="v0.55.0"></a>
## [v0.55.0]
### test
- **integration:** armada is deprecated
### fix
- **test:** disable gdpr integration test for ags starter
### docs
- **migrations:** add migration-guide-v0.54-to-v0.55.md


<a name="v0.54.0"></a>
## [v0.54.0]
### fix
- **:** local token validation performance
### ci
- **coverity:** update cov-analysis to 2023.6.2
### test
- **integration:** add chat service
### docs
- **migrations:** add migration-guide-v0.53-to-v0.54.md


<a name="v0.53.0"></a>
## [v0.53.0]
### ci
- **nightly:** add integration tests for AGS starter
### chore
- **git:** ignore macOS files
### test
- **login:** add login user with no scope test
- **core:** add using AGS starter flag
- **eventlog:** remove count assert
- **integration:** adjust tests to use client credentials for AGS starter environments
- **integration:** disable some tests for AGS starter environments
- **integration:** fix dsmc client game version
### feat
- **api:** bootstrap chat service support
- **:** support extend delegate token
### fix
- **:** auto refresh websocket connection
### docs
- **:** update docs portal links
- **migrations:** add migration-guide-v0.52-to-v0.53.md


<a name="v0.52.0"></a>
## [v0.52.0]
### fix
- **:** make parse token payload ignore uknown


<a name="v0.51.0"></a>
## [v0.51.0]
### feat
- **sdk:** login user with scope
- **:** validate role permission
- **core:** okhttplogger - add logfilepath param
### fix
- **samples:** login or refresh - gc limit compile error
### docs
- **migrations:** add migration-guide-v0.50-to-v0.51.md


<a name="v0.50.0"></a>
## [v0.50.0]
### fix
- **:** concurrent issue on refresh token
- **integration-test:** ams breaking change 
### docs
- **migrations:** add migration-guide-v0.49-to-v0.50.md

<a name="v0.49.0"></a>
## [v0.49.0]
### feat
- **feat:** login or refresh implementation 
### fix
- **integration-test:** session issue because spec change 
### docs
- **migrations:** add migration-guide-v0.48-to-v0.49.md

<a name="v0.48.0"></a>
## [v0.48.0]
### test
- **integration:** public and confidential client test
- **integration:** reword warning about login client public oauth
- **integration:** remove test health in match2 and session
### docs
- **getting-started:** no need warning because prerequisites already mention that this needs confidential oauth client
- **readme:** reword warning about login client public oauth
- **migrations:** add migration-guide-v0.47-to-v0.48.md 
### fix
- **integration-test:** caused by gdpr tage renaming 

<a name="v0.47.0"></a>
## [v0.47.0]
### ci
- **generate:** use demo_extend-sdk
### docs
- **readme:** rearrange sections
- **readme:** fix broken validate access token docs link


<a name="v0.46.0"></a>
## [v0.46.0]
### fix
- **:** wrong file naming for migration guide v0.45
- **:** remove unused imports in parse access token test
### test
- **integration:** cloudsave player record
### feat
- **:** add parse access token function


<a name="v0.45.0"></a>
## [v0.45.0]
### fix
- **fix:** cli test failed for inventory service

### docs
- update changelog for ags 3.56
- **migration-guide:** v0.45.0 to v0.46.0 breaking change in social

<a name="v0.44.0"></a>
## [v0.44.0]
### docs
- **:** use docs-old for now for some docs


<a name="v0.43.0"></a>
## [v0.43.0]
### fix
- **:** integration test unable to delete session


<a name="v0.42.0"></a>
## [v0.42.0]
### feat
- **:** update jenkingenerate for mock-server


<a name="v0.41.0"></a>
## [v0.41.0]
### ci
- **generate:** wrong spec commit hash if no recent changes enough in stage_extend-sdk


<a name="v0.40.0"></a>
## [v0.40.0]


<a name="v0.39.0"></a>
## [v0.39.0]
### chore
- **sdk:** add ams
### docs
- **migration-guide:** v0.38.0 to v0.39.0 breaking change in legal

<a name="v0.38.0"></a>
## [v0.38.0]
### chore
- **jenkinsfile:** update generate spec target
### fix
- **jenkinsfile:** fix typo in generate target
- **integration:** fix issue on leaderboard test and dsmc


<a name="v0.37.0"></a>
## [v0.37.0]
### ci
- **generate:** refactor jenkinsfile.generate
- **generate:** generate changelog also

<a name="v0.36.0"></a>
## [v0.36.0]
We skipped this version, because some unexpected issue

<a name="v0.35.0"></a>
## [v0.35.0] - 2023-04-26
### Chore
- **sdk:** generate java extend sdk (230425.2153)

### Ci
- **jenkinsfile.generate:** fix error when there is no outstanding deprecation
- **jenkinsfile.generate:** add outstanding deprecation check
- **makefile:** add outstanding_deprecation target

### Fix
- follow-up issue after adding lobby doc rev.2
- follow-up issue after adding lobby docs
- update integration test DLC and the migration docs


<a name="v0.34.0"></a>
## [v0.34.0] - 2023-04-11
### Chore
- **sdk:** adjust sdk version because early cherry-pick
- **sdk:** generate java extend sdk (230410.0052)
- **sdk:** generate java extend sdk (230328.2153)

### Ci
- rename jenkins slack notif channel

### Docs
- update changelog for ags 3.46
- **migration-guide:** v0.33.0 to v0.34.0 breaking change in legal,ugc,platform


<a name="v0.33.0"></a>
## [v0.33.0] - 2023-03-28
### Chore
- **samples:** delete title matchmaking sample app
- **sdk:** generate java extend sdk (230327.2155)
- **sdk:** generate java extend sdk (230315.2156)

### Docs
- update changelog for ags 3.45
- **migration-guide:** v0.32.0 to v0.33.0 rename model in basic
- **samples:** fix broken link on custom-operation docs
- **samples:** add custom-operation sample
- **samples:** remove phantauth.net url since the site is down

### Fix
- **integration:** model renamed from UserProfilePrivateUpdate to UserProfileUpdate


<a name="v0.32.0"></a>
## [v0.32.0] - 2023-03-14
### Chore
- **docs:** rename ab gaming services, extend sdk
- **sdk:** generate java extend sdk (230313.2157)

### Docs
- update changelog for ags 3.44
- **migration-guide:** v0.31.0 to v0.32.0 update matchmaking v2 (again)
- **migration-guide:** v0.31.0 to v0.32.0 update matchmaking v2
- **migration-guide:** v0.31.0 to v0.32.0


<a name="v0.31.0"></a>
## [v0.31.0] - 2023-02-28
### Chore
- **lambda-sample-app:** remove credential information
- **sdk:** generate java server sdk (230226.2157)

### Ci
- updated coverity image

### Docs
- update changelog for ags 3.43
- **common use case:** add reporting service
- **migration-guide:** v0.30.0 to v0.31.0 update
- **migration-guide:** v0.30.0 to v0.31.0

### Feat
- **aws-lambda-example:** allow both local test and functionurl invokation

### Test
- **integration:** reporting service
- **integration:** lobby - update due to openapi tags renaming


<a name="v0.30.0"></a>
## [v0.30.0] - 2023-02-14
### Chore
- remove bypass build parameter
- tidy source code
- adjust pipeline credentials
- **sdk:** generate java server sdk (230213.0150)
- **sdk:** consolidate logging
- **sdk:** match2 - partial regenerate due to model breaking change

### Docs
- update changelog for ab cloud 3.42
- **common-use-case:** match2 - update
- **migration-guide:** v0.29 to v0.30

### Feat
- **api:** add initial reporting service support
- **aws-lambda-example:** integrated to generate FunctionURL
- **pipeline:** add breaking changes check in generate job

### Fix
- define variables and script
- **sdk:** review local token validation logic
- **sdk:** coverity defects

### Test
- **integration:** match2 - fix breaking due to model renaming
- **integration:** simplify validate token test


<a name="v0.29.0"></a>
## [v0.29.0] - 2023-01-31
### Chore
- copy openapi vendor ext docs
- sequentially run test stages
- separate jenkins job for broken link check
- **sdk:** generate java server sdk (230129.0041)

### Docs
- update changelog for ab cloud 3.41
- **migrations:** add migration-guide-v0.28-to-v0.29.md
- **samples:** lambda - readme
- **spec:** restore openapi-2.0-vendor-extensions.md

### Feat
- add sdk generate jenkins pipeline
- **core:** add local token validation config

### Test
- **integration:** fix wrong phantauth url
- **integration:** remove hardcoded AB_PHANTAUTH_URL


<a name="v0.28.0"></a>
## [v0.28.0] - 2023-01-17
### Chore
- bump to version 0.28 for ab cloud 3.40
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for ab cloud 3.40
- **spec:** update spec for ab cloud 3.40

### Ci
- add make version (again)
- add make version

### Docs
- update changelog for ab cloud 3.40

### Feat
- **core:** validate token

### Test
- **integration:** fix test identifier naming
- **integration:** fix password validation errors
- **integration:** match2 - fix create party


<a name="v0.27.0"></a>
## [v0.27.0] - 2023-01-04
### Chore
- bump to version 0.27 for ab cloud 3.39
- regenerate op index due to deprecation marker
- implement deprecation marker
- **operation:** remove unused variable security
- **samples:** getting started - bump sdk version
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for ab cloud 3.39
- **spec:** update spec for ab cloud 3.39

### Docs
- update changelog for ab cloud 3.39


<a name="v0.26.0"></a>
## [v0.26.0] - 2022-12-20
### Chore
- bump to version 0.26 for ab cloud 3.38
- code formatting
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for ab cloud 3.38
- **spec:** update spec for ab cloud 3.38

### Docs
- update changelog for ab cloud 3.38
- update changelog for ab cloud 3.38
- migration guide 0.26
- update common use cases
- **common use case:** update related to update achievement
- **readme:** add jdk and gradle info

### Test
- **integration:** achievement - update achievement now requires name and desc
- **integration:** iam - add create user v3


<a name="v0.25.0"></a>
## [v0.25.0] - 2022-12-06
### Chore
- disable changelog broken link test for now
- bump to version 0.25 for ab cloud 3.37
- **makefile:** test core httpbin
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for ab cloud 3.37
- **spec:** update spec for ab cloud 3.37

### Ci
- add check for openapi-2.0-vendor-extensions.md
- **brokenlink:** added check for getting started documentation
- **nightly:** include initial version of broken link check

### Docs
- update changelog for ab cloud 3.37
- update changelog for ab cloud 3.37
- remove link quotes in readme
- common use cases - add session & match2
- update getting-started
- add openapi-2.0-vendor-extensions.md

### Feat
- **samples:** getting started project

### Fix
- **sdk:** token refresh timer should not prolong lifetime of app

### Test
- **integration:** rename test helper methods
- **integration:** use alternate phantauth instance
- **integration:** session
- **integration:** match2


<a name="v0.24.0"></a>
## [v0.24.0] - 2022-11-22
### Chore
- bump to version 0.24 for ab cloud 3.36
- generate new match2 and session service sdk
- bump to version 0.23.2 for ab cloud 3.35 hotfix
- bump to version 0.23.1 for ab cloud 3.35 hotfix
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for ab cloud 3.36
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for ab cloud 3.36
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for ab cloud 3.35 hotfix
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for ab cloud 3.35 hotfix
- **spec:** update spec for ab cloud 3.36
- **spec:** update spec for ab cloud 3.36
- **spec:** update spec for ab cloud 3.35 hotfix
- **spec:** update spec for ab cloud 3.35 hotfix

### Docs
- update changelog for ab cloud 3.36
- add migration guide v0.23 -> v0.24
- update changelog for ab cloud 3.35 hotfix
- update changelog for ab cloud 3.35 hotfix

### Test
- **integration:** added initial tests for match2 and session


<a name="v0.23.2"></a>
## [v0.23.2] - 2022-11-14
### Chore
- bump to version 0.23.2 for ab cloud 3.35 hotfix
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for ab cloud 3.35 hotfix
- **spec:** update spec for ab cloud 3.35 hotfix

### Docs
- update changelog for ab cloud 3.35 hotfix


<a name="v0.23.1"></a>
## [v0.23.1] - 2022-11-11
### Chore
- bump to version 0.23.1 for ab cloud 3.35 hotfix
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for ab cloud 3.35 hotfix
- **spec:** update spec for ab cloud 3.35 hotfix

### Docs
- update changelog for ab cloud 3.35 hotfix


<a name="v0.23.0"></a>
## [v0.23.0] - 2022-11-08
### Chore
- bump to version 0.23 for ab cloud 3.35
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for ab cloud 3.35
- **spec:** update spec for ab cloud 3.35

### Ci
- **github:** publish,close, and release in one go

### Docs
- update changelog for ab cloud 3.35
- fix create oauth client link in getting started doc


<a name="v0.22.0"></a>
## [v0.22.0] - 2022-10-25
### Chore
- bump to version 0.22 for ab cloud 3.34
- regenerate due to template refactoring
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for ab cloud 3.34
- **spec:** update spec for ab cloud 3.34

### Ci
- enable codegen.txt check

### Docs
- update changelog for ab cloud 3.34

### Fix
- removed httpbin dependency
- **sdk:** handling endpoints which returns file
- **test:** fixed regex pattern to verify trace id

### Test
- **integration:** dsmc - pass the test even if we got 425 claim server
- **integration:** platform - export import store
- **integration:** social - export stats


<a name="v0.21.0"></a>
## [v0.21.0] - 2022-10-11
### Chore
- bump to version 0.21 for ab cloud 3.33
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for ab cloud 3.33
- **spec:** update spec for ab cloud 3.33

### Ci
- **github:** fix publish to maven central due to key issue

### Docs
- update changelog for ab cloud 3.33
- improve docs folder (fix broken links)


<a name="v0.20.0"></a>
## [v0.20.0] - 2022-09-28
### Chore
- bump to version 0.20 for ab cloud 3.32
- clean up dependencies
- improve dummy javadoc content
- fix gradle deprecation warning
- consolidate build.gradle
- **build.gradle:** enable nexus publish plugin only if necessary
- **makefile:** make output more readable in jenkins
- **makefile:** gradle no daemon
- **makefile:** make gradle less verbose
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for ab cloud 3.32
- **spec:** update spec for ab cloud 3.32

### Docs
- update changelog for ab cloud 3.32
- improve docs folder

### Feat
- use gradle-nexus.publish-plugin

### Fix
- **jenkinsfile.github:** publish maven central

### Test
- **integration:** replace deprecated methods


<a name="v0.19.0"></a>
## [v0.19.0] - 2022-09-12
### Chore
- bump to version 0.19 for ab cloud 3.31
- update gradle 7.5.1
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for ab cloud 3.31
- **spec:** update spec for ab cloud 3.31

### Docs
- update changelog for ab cloud 3.31
- **readme:** switch to maven central

### Feat
- publish to maven central
- **samples:** tictactoe

### Fix
- javadoc publish
- **samples:** title-matchmaking - directory structure


<a name="v0.18.0"></a>
## [v0.18.0] - 2022-08-30
### Chore
- bump to version 0.18 for ab cloud 3.30
- **samples:** title-matchmaking - code formatting
- **samples:** rename oidc-web to oidc
- **samples:** rename aws-lambda-example to lambda
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for ab cloud 3.30
- **sdk:** operations, models, ws models - deprecate all args constructor
- **spec:** update spec for ab cloud 3.30

### Ci
- update junit xml path

### Docs
- update changelog for ab cloud 3.30
- add common use cases

### Feat
- **samples:** title matchmaking sample app

### Fix
- **gradle:** rename test task to testCore
- **sdk:** login user invalid username/password

### Test
- **core:** replace deprecated methods
- **integration:** dsmc - switch namespace
- **integration:** split to smaller files + add case marker
- **integration:** replace deprecated methods
- **integration:** seasonpass - remove unused variables


<a name="v0.17.0"></a>
## [v0.17.0] - 2022-08-15
### Chore
- bump to version 0.17 for ab cloud 3.29
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for ab cloud 3.29 (again)
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for ab cloud 3.29
- **sdk:** remove more warnings
- **spec:** update spec for ab cloud 3.29 (again)
- **spec:** update spec for ab cloud 3.29
- **test:** integration - qosm - clean unused warnings

### Ci
- updated mock server path

### Docs
- update changelog for ab cloud 3.29
- update changelog for ab cloud 3.29

### Fix
- **ci:** fix mock server path
- **sdk:** model - exclude property if not required and the value is null

### Test
- added season pass integration tests
- added qosm integration test


<a name="v0.16.0"></a>
## [v0.16.0] - 2022-08-02
### Chore
- bump to version 0.16 for justice 3.28
- code warnings cleanup
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for justice 3.28 (again)
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for justice 3.28
- **spec:** update spec for justice 3.28

### Docs
- update changelog for justice 3.28 (again)
- update changelog for justice 3.28

### Feat
- **samples:** oidc login sample app

### Test
- regenerate ws lobby cli tests


<a name="v0.15.0"></a>
## [v0.15.0] - 2022-07-19
### Chore
- bump to version 0.15 for justice 3.27
- remove checkstyle
- code formatting
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for justice 3.27
- **spec:** update spec for justice 3.27

### Docs
- update changelog for justice 3.27

### Feat
- **sdk:** login platform

### Fix
- **sdk:** improve refresh token performance

### Test
- **integration:** login platform


<a name="v0.14.0"></a>
## [v0.14.0] - 2022-07-05
### Chore
- bump to version 0.14 for justice 3.26
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for justice 3.26
- **spec:** update spec for justice 3.26
- **test:** clean up unused import
- **test:** clean up integration

### Ci
- **github:** fix checkout problem
- **github:** implement point release
- **github:** fix wrong slack channel

### Docs
- update changelog for justice 3.26

### Fix
- **test:** coverity issue

### Test
- **integration:** basic - delete existing user profile first
- **integration:** re-enable gametelemetry test


<a name="v0.13.0"></a>
## [v0.13.0] - 2022-06-21
### Chore
- bump to version 0.13 for justice 3.25
- remove non-functioning coverity suppress warning
- **core:** clean up AccelByteSDK
- **makefile:** simplify mock server launch for testing
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for justice 3.25
- **spec:** update spec for justice 3.25

### Ci
- **github:** add release note input

### Docs
- update changelog for justice 3.25
- update changelog for justice 3.25
- **readme:** add token refresh

### Feat
- **core:** token repository, token refresh interface may throw exception
- **core:** finalize token refresh logic implementation
- **core:** make DefaultTokenRepository constructor public
- **core:** wip token refresh logic implementation
- **core:** store token refresh info at login user/client
- **core:** add TokenRefresh interface

### Fix
- **core:** wrong token repo type check
- **sdk:** unnecessary token repository instance check

### Test
- **core:** add token refresh tests
- **core:** clean up
- **integration:** add token refresh tests
- **integration:** clean up


<a name="v0.12.0"></a>
## [v0.12.0] - 2022-06-07
### Chore
- bump to version 0.12 for justice 3.24
- **sdk:** regenerate sdk, cli sample app, cli test, doc index for justice 3.24
- **spec:** update spec for justice 3.24

### Docs
- update changelog for justice 3.24

### Test
- **integration:** improve dsmc retry policy logic


<a name="v0.11.0"></a>
## [v0.11.0] - 2022-05-24
### Chore
- bump version
- fix coverity issues
- **doc:** regenerate doc index for justice 3.23
- **samples:** regenerate cli sample app for justice 3.23
- **sdk:** regenerate sdk for justice 3.23
- **sdk:** okhttpclient - refactor create request and response
- **sdk:** use more enums
- **spec:** update spec for justice 3.23
- **test:** regenerate cli sample app test for justice 3.23

### Ci
- **coverity:** do not run test

### Docs
- update changelog
- update changelog
- **samples:** cli - refresh readme

### Feat
- **sdk:** operation - add enum and builder for enum

### Fix
- **sdk:** sdkConfiguration is supposed to be private

### Test
- **integration:** use http retry for dsmc claim server
- **integration:** disable gametelemetry for now because it is unreliable
- **integration:** add gametelemetry


<a name="v0.10.0"></a>
## [v0.10.0] - 2022-05-10
### Chore
- gitignore tap test results
- bump version
- **core:** refactor sdkinfo class
- **core:** operation - remove unused toJson and createFromJson methods
- **core:** model - make abstract
- **core:** improve base64 encoding in okhttplogger
- **core:** operation - isValid method is abstract now
- **core:** operation - use parent GetFullUrl method
- **core:** helper - minor clean up
- **doc:** regenerate doc index for justice 3.22
- **model:** remove unused getFieldInfo method
- **samples:** regenerate cli sample app for justice 3.22
- **samples:** cli - use builder pattern
- **sdk:** regenerate sdk for justice 3.22
- **spec:** update spec for justice 3.22
- **test:** move cli test shell scripts
- **test:** rename test core and test integration
- **test:** revise HttpbinOperation for testing
- **test:** regenerate cli sample app test for justice 3.22

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
- **core:** operation - remove unused method getHeaderParams
- **core:** refactor okhttpclient send request logic
- **core:** revise core Header to HttpHeaders
- **core:** operation - remove unnecessary jsonignore
- **core:** operation - remove parseResponse, handleEmptyResponse methods
- **core:** operation - make abstract
- **core:** operation - make createFullUrl protected
- **core:** operation - move createFullUrl logic to helper
- **core:** operation - remove unused method getAllParams
- **core:** operation - make getCollectionFormatMap protected
- **doc:** regenerate doc index for justice 3.21
- **gradle:** use gradle lombok plugin
- **makefile:** pin gradle docker image to version 7-jdk8
- **samples:** cli - regenerate cli (cookie support)
- **sdk:** operation - rename getFormParams
- **sdk:** regenerate sdk for justice 3.21
- **sdk:** regenerate sdk (add enum)
- **sdk:** regenerate sdk (prepare to add enum)
- **sdk:** regenerate sdk (cookie support)
- **sdk:** refactor accelbytesdk
- **spec:** update spec for justice 3.21
- **spec:** update spec for more cookie support
- **spec:** update spec
- **spec:** update spec for cookie support
- **test:** remove run-java-cli-all-unit-test.sh
- **test:** regenerate cli test for justice 3.21

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
- clean up build
- clean up test
- clean up checkstyle
- add gradle check (checkstyle)
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
- **api:** add builder pattern to the model classes
- **api:** add builder feature to the operation class constructor
- **api:** add documentation and deprecated annotation
- **core:** inject 'User-Agent' automatically in each request
- **core:** add optional 'X-Amzn-Trace-Id' header in each request
- **samples:** add unit test mode to websocket cli app
- **samples:** add cli app for lobby websocket

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
- **core:** set default content type if not declared
- **core:** invalid request method and body
- **core:** change function for converting inputstream to string
- **core:** adjust login method to the new sdk version
- **core:** invalid get form data params checking
- **makefile:** test_cli not tty error in jenkins
- **sample:** invalid exit code on cli apps
- **sample:** change input stream to file for cli input
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
- add junit
- websocket core class
- **api:** add function to get collection format and array query string
- **api:** add websocket message models
- **core:** add logic to handle array within query string
- **core:** add helper functions for websocket implementation
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


[v0.35.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.34.0...v0.35.0
[v0.34.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.33.0...v0.34.0
[v0.33.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.32.0...v0.33.0
[v0.32.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.31.0...v0.32.0
[v0.31.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.30.0...v0.31.0
[v0.30.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.29.0...v0.30.0
[v0.29.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.28.0...v0.29.0
[v0.28.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.27.0...v0.28.0
[v0.27.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.26.0...v0.27.0
[v0.26.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.25.0...v0.26.0
[v0.25.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.24.0...v0.25.0
[v0.24.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.23.2...v0.24.0
[v0.23.2]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.23.1...v0.23.2
[v0.23.1]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.23.0...v0.23.1
[v0.23.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.22.0...v0.23.0
[v0.22.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.21.0...v0.22.0
[v0.21.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.20.0...v0.21.0
[v0.20.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.19.0...v0.20.0
[v0.19.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.18.0...v0.19.0
[v0.18.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.17.0...v0.18.0
[v0.17.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.16.0...v0.17.0
[v0.16.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.15.0...v0.16.0
[v0.15.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.14.0...v0.15.0
[v0.14.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.13.0...v0.14.0
[v0.13.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.12.0...v0.13.0
[v0.12.0]: https://github.com/AccelByte/accelbyte-java-sdk/compare/v0.11.0...v0.12.0
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
