#!/bin/sh

rm -f /tmp/logs /tmp/daily-metrics /tmp/monthly-metrics /tmp/yearly-metrics

for file; do
	jq -r '.logs[]' $file >> /tmp/logs
	jq -r '.metrics.daily[]' $file >> /tmp/daily-metrics
	jq -r '.metrics.monthly[]' $file >> /tmp/monthly-metrics
	jq -r '.metrics.yearly[]' $file >> /tmp/yearly-metrics
done

ministat -w 72 /tmp/logs
ministat -w 72 /tmp/daily-metrics
ministat -w 72 /tmp/monthly-metrics
ministat -w 72 /tmp/yearly-metrics
