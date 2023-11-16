#### Apache Benchmark tool for stress testing web services
1. Modify `perform.bash`
- Change `target` to what you need to test
- Change `requests` and `concurrency`
- Add Headers what you need for access to endpoint

##### Interest links
  - https://github.com/juanluisbaptiste/apachebench-graphs

##### Install dependencies
```bash
brew install ab gnuplot -y
```

##### Run tests
```bash
./perform.bash
```
##### Generate and build graphs
```bash
ab -n 120 -c 30 -g out-int.csv https://google.com/
gnuplot
gnuplot> set terminal dumb
gnuplot> plot "out-int-2.csv" using 9 w l
```


