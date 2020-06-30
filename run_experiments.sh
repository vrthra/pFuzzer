RUNTIME=$1
: ${RUNTIME:=0.1}
(cd afl; sh run_all.sh $RUNTIME) &
(cd klee; sh run_all.sh $RUNTIME) &
(cd pfuzzer/samples/; sh run_all.sh $RUNTIME) &
wait
