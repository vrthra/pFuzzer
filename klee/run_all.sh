RUNTIME=$1
: ${RUNTIME:=0.01}

( (cd csv; sh run_exp.sh $RUNTIME) ; (cd csv/eval/; sh comp_run.sh csvparser) ) &
( (cd ini; sh run_exp.sh $RUNTIME) ; (cd ini/eval/; sh comp_run.sh ini) ) &
( (cd cjson; sh run_exp.sh $RUNTIME) ; (cd cjson/eval/; sh comp_run.sh cJSON) ) &
( (cd tinyc; sh run_exp.sh $RUNTIME) ; (cd tinyc/eval/; sh comp_run.sh tiny) ) &
( (cd mjs; sh run_exp.sh $RUNTIME) ; (cd mjs/eval/; sh comp_run.sh mjs) ) &

#/bin/sleep ${RUNTIME}h

wait
