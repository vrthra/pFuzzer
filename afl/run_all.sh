RUNTIME=$1
: ${RUNTIME:=0.01}

# Unfortunately parallel running does not work with AFL somehow.

(cd csv; sh run_exp.sh $RUNTIME) ;
(cd ini; sh run_exp.sh $RUNTIME) ;
(cd cjson; sh run_exp.sh $RUNTIME) ;
(cd tinyc; sh run_exp.sh $RUNTIME) ;
(cd mjs; sh run_exp.sh $RUNTIME) ;

#/bin/sleep ${RUNTIME}h

#some safety buffer s.t. all is properly closed and everything had enough time to stop
#/bin/sleep 15m
# wait

(cd csv/eval/; sh comp_run.sh csvparser) ;
(cd ini/eval/; sh comp_run.sh ini) ;
(cd cjson/eval/; sh comp_run.sh cJSON) ;
(cd tinyc/eval/; sh comp_run.sh tiny) ;
(cd mjs/eval/; sh comp_run.sh mjs) ;
# wait
