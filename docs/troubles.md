# Trouble shooting

This page is a collection of possible solutions.


## GTKWave

If you are trying to generate the traces to be visualized with GTKWave on Mr. Wolf and you are getting

```
TypeError: unsupported operand type(s) for <<: 'int' and 'NoneType'
```

It might be due to the different commits of the pulp-sdk. Try to change

```
gen_gtkw_icache_traces(gtkw, tp, 'sys.board.chip.soc.fc_icache', 1<<config.get_int('**/fc_icache/nb_ways_bits'), 1<<config.get_int('**/fc_icache/nb_sets_bits'))
```

in `pulp-sdk/pkg/sdk/dev/install/ws/python/vp_runner.py` to

```
gen_gtkw_icache_traces(gtkw, tp, 'sys.board.chip.soc.fc_icache', 1<<2, 1<<4)
```
