# ORDER PRGA Tapeout

This repository is a branch of the caravel_user_project repository, modified for the tapeout of a 512-LUT4 FPGA generated using PRGA.


A 512-LUT4 FPGA generated using PRGA (Princeton Reconfigurable Gate Array)
 - An 8x8 array of CLBs, each containing 8 LUT4s and 8 DFFs and a local programmable crossbar for intra-CLB routing
 - 24-track routing channel with L1 tracks with [cycle-free routing](https://ieeexplore.ieee.org/document/9221519)(published at FPL'20, [paper.pdf](http://parallel.princeton.edu/papers/FPL20-Li.pdf))
 - Capable of implementing 16 out of 30 ISCAS'89 circuits
 

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![UPRJ_CI](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml) [![Caravel Build](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml)

## Layout Photo

![image](https://efabless-production-marketplace.s3.amazonaws.com/attachments/projects/5c8e5e20-6b84-4a5a-a1c1-a37fd0c1cbf8/Capture.PNG)

## Design

- 1x Caravel user project wrapper
  - 1x PRGA top
    - 64x CLB tile

## Key design techniques:

### Hierarchical design flow

CLB tile is first synthesized, placed, and routed into a hard macro. The macro routes up to met2 and contains a customized met2 PDN that drives the standard cell power rails.

The PRGA top is then synthesized, placed, and routed as the top-level caravel user design. The PRGA top module contains 64 CLB tile instances and other synthesizable logic. The CLB macros are manually placed in a 2-dimensional array, in which the physical location of each CLB matches the logical location. The switch boxes and configuration circuitry are flattened and synthesized under timing constraints.

### Custom PDN

The CLB tile uses a customized met2 PDN that drives the standard cell power rails.

The PRGA top adds an additional met3 PDN over the CLB tiles to connnect the CLB tiles' local PDN to the global PDN which is on met4/met5. This is also the key factor in determining the size/shape of the CLB tile as well as the horizontal/vertical spacing between CLB tiles.
