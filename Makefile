# Copyright (c) 2022 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

.PHONY: build samples

build:
	docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/ gradle:jdk17 gradle build

samples:
	rm -f samples.err
	find samples -type f -iname build.gradle -exec dirname {} \; | while read DIRECTORY; do \
		echo "# $$DIRECTORY"; \
		docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/$$DIRECTORY gradle:jdk17 gradle build || touch samples.err; \
	done
	[ ! -f samples.err ] || (rm samples.err && exit 1)

lint:
	docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/ gradle:jdk17 gradle check

test:
	docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/ gradle:jdk17 gradle test

test_cli:
	@test -n "$(SDK_MOCK_SERVER_PATH)" || (echo "SDK_MOCK_SERVER_PATH is not set" ; exit 1)
	rm -f test.err
	docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/ gradle:jdk17 sh -c 'cd samples/cli && gradle fatJar'
	bash -c 'sed -i "s/\r//" "$(SDK_MOCK_SERVER_PATH)/mock-server.sh" && \
			trap "docker stop justice-codegen-sdk-mock-server" EXIT && \
			(DOCKER_RUN_ARGS="-t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data -w /data --network host --name justice-codegen-sdk-mock-server" bash "$(SDK_MOCK_SERVER_PATH)/mock-server.sh" -s /data/spec &) && \
			(for i in $$(seq 1 10); do bash -c "timeout 1 echo > /dev/tcp/127.0.0.1/8080" 2>/dev/null && exit 0 || sleep 10; done; exit 1) && \
			sed -i "s/\r//" tests/sh/* && \
			(for FILE in $$(ls tests/sh/*.sh | grep -v run-java-cli-all-unit-test.sh); do docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data -w /data --network host -e MODULE_PATH="samples/cli" gradle:jdk17 bash $$FILE || touch test.err; done)'
	[ ! -f test.err ]

publish:
	docker run -e AB_NEXUS_USERNAME=${AB_NEXUS_USERNAME} -e AB_NEXUS_PASSWORD=${AB_NEXUS_PASSWORD} -t --rm -u  \
			$$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/ gradle:jdk17 gradle publish