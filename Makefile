# Copyright (c) 2022 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

SHELL := /bin/bash

GRADLE_IMAGE := gradle:8.5-jdk8

.PHONY: build samples

build:
	docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/ -e GRADLE_USER_HOME=/data/.gradle $(GRADLE_IMAGE) \
			gradle --console=plain -i --no-daemon build

samples:
	rm -f samples.err
	find samples -type f -iname build.gradle -exec dirname {} \; | while read DIRECTORY; do \
		echo -e "\n# $$DIRECTORY\n"; \
		docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/$$DIRECTORY -e GRADLE_USER_HOME=/data/.gradle $(GRADLE_IMAGE) \
				gradle --console=plain -i --no-daemon build || touch samples.err; \
	done
	[ ! -f samples.err ] || (rm samples.err && exit 1)

test_core:
	@test -n "$(SDK_MOCK_SERVER_PATH)" || (echo "SDK_MOCK_SERVER_PATH is not set" ; exit 1)
	rm -f test_core.err
	trap "docker stop --time 1 justice-codegen-sdk-mock-server justice-codegen-sdk-ws-mock-server; docker rm --force mylocal_httpbin" EXIT && \
		echo "[info] running httpbin" && \
			docker run -d -p 8070:80 --name mylocal_httpbin --rm kennethreitz/httpbin && \
			echo "[info] httpbin ready" && \
		echo "[info] running mock-server" && \
			(bash "$(SDK_MOCK_SERVER_PATH)/mock-server.sh" -s /data/spec -t "-" --save_files y &) && \
			(for i in $$(seq 1 10); do echo "[info] pinging mock-server" && curl http://localhost:8080/ 2>/dev/null && exit 0 || sleep 10; done; echo "[erro] can't connect to mock-server"; exit 1) && \
			echo "[info] mock-server ready" && \
		echo "[info] running ws-mock-server" && \
			(SPEC_DIR=/data/spec bash "$(SDK_MOCK_SERVER_PATH)/ws/ws-mock-server.sh" &) && \
			(for i in $$(seq 1 10); do echo "[info] pinging ws-mock-server" && bash -c "timeout 1 echo > /dev/tcp/127.0.0.1/8000" 2>/dev/null && exit 0 || sleep 10; done; echo "[erro] can't connect to ws-mock-server"; exit 1) && \
			echo "[info] ws-mock-server ready" && \
		docker run --rm --tty --network host \
			--user $$(id -u):$$(id -g) \
			--volume $$(pwd):/data --workdir /data \
			--env GRADLE_USER_HOME=/data/.gradle \
			--env AB_HTTPBIN_URL=http://localhost:8070 \
			$(GRADLE_IMAGE) \
				gradle --console=plain -i --no-daemon testCore
	[ ! -f test_core.err ]
	
test_integration:
	@test -n "$(ENV_FILE_PATH)" || (echo "ENV_FILE_PATH is not set" ; exit 1)
	docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/ --env-file $(ENV_FILE_PATH) -e GRADLE_USER_HOME=/data/.gradle $(GRADLE_IMAGE) \
			gradle --console=plain -i --no-daemon testIntegration

test_method:
	@test -n "$(ENV_FILE_PATH)" || (echo "ENV_FILE_PATH is not set" ; exit 1)
	@test -n "$(TEST_METHOD)" || (echo "TEST_METHOD is not set" ; exit 1)
	docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/ --env-file $(ENV_FILE_PATH) -e GRADLE_USER_HOME=/data/.gradle $(GRADLE_IMAGE) \
			gradle --console=plain -i testIntegration --tests $(TEST_METHOD)

test_cli:
	@test -n "$(SDK_MOCK_SERVER_PATH)" || (echo "SDK_MOCK_SERVER_PATH is not set" ; exit 1)
	rm -f test.err
	docker run --rm --tty \
		--user $$(id -u):$$(id -g) \
		--volume $$(pwd):/data --workdir /data/samples/cli \
		--env GRADLE_USER_HOME=/data/.gradle \
		$(GRADLE_IMAGE) \
			gradle --console=plain -i --no-daemon installDist
	trap "docker stop --time 1 justice-codegen-sdk-mock-server justice-codegen-sdk-ws-mock-server" EXIT && \
		echo "[info] running mock-server" && \
			(bash "$(SDK_MOCK_SERVER_PATH)/mock-server.sh" -s /data/spec -t "-" --save_files y &) && \
			(for i in $$(seq 1 10); do echo "[info] pinging mock-server" && curl http://localhost:8080/ 2>/dev/null && exit 0 || sleep 10; done; echo "[erro] can't connect to mock-server"; exit 1) && \
			echo "[info] mock-server ready" && \
		echo "[info] running ws-mock-server" && \
			(SPEC_DIR=/data/spec bash "$(SDK_MOCK_SERVER_PATH)/ws/ws-mock-server.sh" &) && \
			(for i in $$(seq 1 10); do echo "[info] pinging ws-mock-server" && bash -c "timeout 1 echo > /dev/tcp/127.0.0.1/8000" 2>/dev/null && exit 0 || sleep 10; done; echo "[erro] can't connect to ws-mock-server"; exit 1) && \
			echo "[info] ws-mock-server ready" && \
		sed -i "s/\r//" samples/cli/tests/* && \
		rm -f samples/cli/tests/*.tap && \
		for FILE in $$(ls samples/cli/tests/*.sh); do \
			echo "# $$(basename "$$FILE")"; \
			(set -o pipefail; \
				docker run --rm --tty --network host \
				--platform linux/amd64 \
				--user $$(id -u):$$(id -g) \
				--volume $$(pwd):/data --workdir /data/samples/cli  \
				--env GRADLE_USER_HOME=/data/.gradle \
				$(GRADLE_IMAGE) \
					bash "/data/$${FILE}" | tee "$${FILE}.tap") \
			|| touch test.err; \
		done
	[ ! -f test.err ]

publish:
	docker run -t --rm -u  $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/ -e GRADLE_USER_HOME=/data/.gradle \
			-e PUBLISH_OSSRH_USERNAME="$$PUBLISH_OSSRH_USERNAME" -e PUBLISH_OSSRH_PASSWORD="$$PUBLISH_OSSRH_PASSWORD" \
			-e PUBLISH_ASC_KEY="$$(cat "$$PUBLISH_ASC_KEY_FILE_PATH")" -e PUBLISH_ASC_KEY_PASSWORD="$$PUBLISH_ASC_KEY_PASSWORD" \
			$(GRADLE_IMAGE) gradle --console=plain -i --no-daemon publishToSonatype closeAndReleaseSonatypeStagingRepository

test_broken_link:
	@test -n "$(SDK_MD_CRAWLER_PATH)" || (echo "SDK_MD_CRAWLER_PATH is not set" ; exit 1)
	rm -f test.err
	bash "$(SDK_MD_CRAWLER_PATH)/md-crawler.sh" -i README.md
	#DOCKER_SKIP_BUILD=1 bash "$(SDK_MD_CRAWLER_PATH)/md-crawler.sh" -i CHANGELOG.md
	(for FILE in $$(find docs -type f); do \
			(set -o pipefail; DOCKER_SKIP_BUILD=1 bash "$(SDK_MD_CRAWLER_PATH)/md-crawler.sh" -i $$FILE) || touch test.err; \
	done)
	DOCKER_SKIP_BUILD=1 bash "$(SDK_MD_CRAWLER_PATH)/md-crawler.sh" -i "https://docs.accelbyte.io/gaming-services/services/extend/extend-sdk/get-started-with-extend-sdk/"
	[ ! -f test.err ]

version:
	if [ -n "$$MAJOR" ]; then VERSION_PART=1; elif [ -n "$$PATCH" ]; then VERSION_PART=3; else VERSION_PART=2; fi &&	# Bump minor version if MAJOR or MINOR is not set \
			VERSION_OLD=$$(cat version.txt | tr -d '\n') && \
			VERSION_NEW=$$(awk -v part=$$VERSION_PART -F. "{OFS=\".\"; \$$part+=1; print \$$0}" version.txt) && \
			echo $${VERSION_NEW} > version.txt &&	# Bump version.txt \
			sed -i "s/version = '[0-9]\+\.[0-9]\+\.[0-9]\+'/version = '$$VERSION_NEW'/" build.gradle &&		# Bump build.gradle \
			sed -i "s/private String sdkVersion = \"[0-9]\+\.[0-9]\+\.[0-9]\+\";\+/private String sdkVersion = \"$$VERSION_NEW\";/" src/main/java/net/accelbyte/sdk/core/SDKInfo.java &&		# Bump SDK \
			sed -i "s/implementation 'net.accelbyte.sdk:sdk:[0-9]\+\.[0-9]\+\.[0-9]\+'\+/implementation 'net.accelbyte.sdk:sdk:$$VERSION_OLD'/" samples/getting-started/app/build.gradle		# Bump getting-started sample app

outstanding_deprecation:
	find * -type f -iname '*.java' \
		| xargs awk ' \
				BEGIN { \
					count_ok = 0; \
					count_not_ok = 0; \
					"date +%s -d \"6 months ago\"" | getline limit_epoch; \
				} \
				match($$0,/@deprecated +([0-9]{4}-[0-9]{1,2}-[0-9]{1,2})/,since_date) { \
					"date +%s -d " since_date[1] | getline since_epoch; \
					if (limit_epoch < since_epoch) { \
						count_ok += 1; \
						print "ok - " FILENAME ":" $$0; \
					} \
					else { \
						count_not_ok += 1; \
						print "not ok - " FILENAME ":" $$0; \
					} \
				} \
				END { \
					exit (count_not_ok ? 1 : 0); \
				}' \
		| tee outstanding_deprecation.out
	@echo 1..$$(grep -c '^\(not \)\?ok' outstanding_deprecation.out) 