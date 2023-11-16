#!/bin/bash
# INFO: Bash Date formats: https://www.cyberciti.biz/faq/unix-linux-appleosx-bsd-shell-appending-date-to-filename/
version=feature-version
proceed_at=$(date +%Y-%m-%d_%H:%M)
timeout=120
stage=int
target=https://google.com/
requests=512
concurrency=8
results_dir=results
name=$proceed_at-$version-$stage-$requests-$concurrency

# INFO: Create dir
mkdir -p $results_dir

# 512 requests with 8 concurrent threads
ab -n $requests -s $timeout -c $concurrency -g $results_dir/$name.csv \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
  -H 'Accept-Language: en-GB,en-US;q=0.9,en;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Pragma: no-cache' \
$target >> $results_dir/$name.log
