#!/bin/sh

for file; do
	echo "logs"
	jq -r '.logs[]' $file | ministat -w 72
	echo "daily metrics"
	jq -r '.metrics.daily[]' $file | ministat -w 72
	echo "monthly metrics"
	jq -r '.metrics.monthly[]' $file | ministat -w 72
	echo "yearly metrics"
	jq -r '.metrics.yearly[]' $file | ministat -w 72
done
