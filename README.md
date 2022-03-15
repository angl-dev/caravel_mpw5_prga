# ORDER PRGA Tapeout

This repository is a branch of the caravel_user_project repository, modified for the tapeout of a 512-LUT4 FPGA generated using PRGA.


A 512-LUT4 FPGA generated using PRGA (Princeton Reconfigurable Gate Array)
 - An 8x8 array of CLBs, each containing 8 LUT4s and 8 DFFs and a local programmable crossbar for intra-CLB routing
 - 24-track routing channel with L1 tracks
 - Capable of implementing 16 out of 30 ISCAS'89 circuits
 

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![UPRJ_CI](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml) [![Caravel Build](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml)

## Design

We used a three level hierarchical design:

- 1x Caravel user project wrapper
  - 1x PRGA top
    - 64x CLB tile
