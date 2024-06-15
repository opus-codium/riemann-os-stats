# Riemann OpenSearch Stats

Gather stats on data stored in OpenSearch by your Riemann monitoring.

## What is this intended for?

We use [Riemann](https://riemann.io/) to gather logs and metrics, and persist them into [OpenSearch](https://opensearch.org/) (sampling metrics with [samplerr](https://github.com/ccin2p3/samplerr)).

We wanted to know how much data we store in OpenSearch per host to better understand our sizing needs.

```sh-session
$ bundle exec ./riemann-os-stats -k -u admin:admin > data.json
$ jq -r '.logs[]' data.json | ministat -w 72
x <stdin>
+------------------------------------------------------------------------+
|                                       x    x                           |
|                                       x    x                           |
|                                       x    x                           |
|                            x         xx    x                           |
|                            x      x  xxx   x                           |
|                            x      x  xxx   x                           |
|                            x      x  xxx   x                           |
|                           xx     xx  xxx   x                           |
|                           xx  x  xxx xxx x x                           |
|                           xx  xxxxxx xxxxx x                           |
|                           xx xxxxxxx xxxxxxx          x                |
|                           xx xxxxxxx xxxxxxx x        x                |
|                           xx xxxxxxx xxxxxxx x        x                |
|                           xxxxxxxxxx xxxxxxx x    x x x                |
|                           xxxxxxxxxx xxxxxxxxx    x x x                |
|                          xxxxxxxxxxxxxxxxxxxxxx   x x x                |
|                          xxxxxxxxxxxxxxxxxxxxxx   x x x                |
|                  x x    xxxxxxxxxxxxxxxxxxxxxxxx  xxx x                |
|                  x x   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx xxx   x          |
|x                 x x   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx x x         x|
|x     x        x xxxx xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx x  xx x|
|                            |_________MA_________|                      |
+------------------------------------------------------------------------+
    N           Min           Max        Median           Avg        Stddev
x 366       2952280      35987638      20826880      20898454       4888746
```

So each the daily logs for each host take about 20.8 MB on disk.
