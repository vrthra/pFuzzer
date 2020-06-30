rm -rf findings/
$HOME/chains/src/programs/afl-2.52b/afl-gcc mjs.c -o mjs -ldl
mkdir -p findings/queue findings/hangs
export AFL_SKIP_CPUFREQ=True
time timeout -k9 ${1}h ../../programs/afl-2.52b/afl-fuzz -i tests -o findings ./mjs > log.txt 2>&1
