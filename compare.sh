#!/bin/sh

if [ $# -ne 2 ]; then
	echo "Need two files for comparison" >&2
	exit 1
fi

for file; do
	jq -r '.logs[]' $file > /tmp/${file}-logs
	jq -r '.metrics.daily[]' $file > /tmp/${file}-daily-metrics
	jq -r '.metrics.monthly[]' $file > /tmp/${file}-monthly-metrics
	jq -r '.metrics.yearly[]' $file > /tmp/${file}-yearly-metrics
done

ministat -w 72 /tmp/$1-logs /tmp/$2-logs
ministat -w 72 /tmp/$1-daily-metrics /tmp/$2-daily-metrics
ministat -w 72 /tmp/$1-monthly-metrics /tmp/$2-monthly-metrics
ministat -w 72 /tmp/$1-yearly-metrics /tmp/$2-yearly-metrics
