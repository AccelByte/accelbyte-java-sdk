FILE_NAME='test-results.md'

append_to_file() {
  echo $1 >> $2
}

delete_file() {
    [ ! -e $1 ] || rm $1
}

run_script() {
  echo "Running script $1"
  append_to_file '```tap' $FILE_NAME
  append_to_file $1 $FILE_NAME
  append_to_file '' $FILE_NAME
  $1 >> $FILE_NAME
  append_to_file '```' $FILE_NAME
  append_to_file '' $FILE_NAME
}

delete_file $FILE_NAME

append_to_file '# Test Results' $FILE_NAME
append_to_file '' $FILE_NAME

chmod +x *

run_script ./run-java-cli-dsmc-unit-test.sh
run_script ./run-java-cli-achievement-unit-test.sh
run_script ./run-java-cli-iam-unit-test.sh
run_script ./run-java-cli-seasonpass-unit-test.sh
run_script ./run-java-cli-lobby-unit-test.sh
run_script ./run-java-cli-gdpr-unit-test.sh
run_script ./run-java-cli-social-unit-test.sh
run_script ./run-java-cli-platform-unit-test.sh
run_script ./run-java-cli-sessionbrowser-unit-test.sh
run_script ./run-java-cli-leaderboard-unit-test.sh
run_script ./run-java-cli-eventlog-unit-test.sh
run_script ./run-java-cli-ugc-unit-test.sh
run_script ./run-java-cli-group-unit-test.sh
run_script ./run-java-cli-qosm-unit-test.sh
run_script ./run-java-cli-legal-unit-test.sh
run_script ./run-java-cli-matchmaking-unit-test.sh
run_script ./run-java-cli-cloudsave-unit-test.sh
run_script ./run-java-cli-dslogmanager-unit-test.sh
run_script ./run-java-cli-basic-unit-test.sh
run_script ./run-java-cli-gametelemetry-unit-test.sh
