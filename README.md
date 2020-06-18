# Opinion Maximization in Social Trust Networks
Matlab implementation of methods proposed in "Opinion Maximization in Social Trust Networks", Pinghua Xu, Wenbin Hu, Jia Wu and Weiwei Liu, IJCAI 2020.

## Overview
- `input/` contains four graphs `Bitcoin-Alpha` `Bitcoin` `WikiElec` `WikiRfa` used in the experiments;
- `SIOP.mlx` is the implementation of SIOP method proposed in the paper;
- `SEOP.mlx` is the implementation of SEOP method;
- `initOP.m` is a Matlab function for initializing internal opinion, and it is called by `SIOP.mlx` and `SEOP.mlx`.

## Requirements
The implementation is tested under Matlab R2019b. The other version of Matlab, which supports live script, is also optional.

## Input
We used **directed signed (un)weighted** graphs in this work.

The code takes an input graph in `.mat` format.
Such a data file should contain the following four variables:
- `D` Degree matrix;
- `I` Identity matrix;
- `L` Laplacian matrix of the graph;
- `numNodes` Maximal node ID;
You can directly load any file in `input\` to see an example.

**NOTE** Node ID starts from any positve number (excluding 0).

## Instruction
Copy this project to your Matlab. Run `SIOP.mlx` to test SIOP method, or run `SEOP.mlx` to test SEOP method.

In the parameter section of the live scripts, you can change `mode` to determine how to initialize internal opinions. And there are four options:

- `mode='uniform'` The internal opinions follow a uniform distribution;
- `mode='normal'` The internal opinions follow a standard normal distribution;
- `mode=pow` The absolute values of the internal opinions follow a power-law distribution, and each entry is negated with aprobability of 0.5.
- `mode=degree` The internal opinion of a node positively correlates to that node’s column connectivity, and each entry is negated with aprobability of 0.5.

And you can change `budget`, which is the budget of intervening, to any positve number for SIOP and to any positve integer for SEOP.

## cite
If you find this repository useful in your research, please cite our paper:
```
Unpublished.
To be updated.
```

