rm -rf findings/
../../programs/afl-2.52b/afl-gcc tiny.c -o tiny
mkdir -p findings/queue findings/hangs
export AFL_SKIP_CPUFREQ=True
time timeout -k9 ${1}h ../../programs/afl-2.52b/afl-fuzz -i tests -o findings ./tiny > log.txt 2>&1
