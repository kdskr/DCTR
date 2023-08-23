#!/usr/bin/env bash
###
 # @Author: error: git config user.name && git config user.email & please set dead value or install git
 # @Date: 2022-10-21 20:03:07
 # @LastEditors: error: git config user.name && git config user.email & please set dead value or install git
 # @LastEditTime: 2022-11-01 16:49:36
 # @FilePath: /fzt_data/Restormer/train.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 

#CONFIG=$1

#python -m torch.distributed.launch --nproc_per_node=8 --master_port=4321 basicsr/train.py -opt $CONFIG --launcher pytorch

export NCCL_P2P_DISABLE=1

python setup.py develop --no_cuda_ext

CUDA_VISIBLE_DEVICES=0 python -m torch.distributed.launch --nproc_per_node=1 --master_port=4394 basicsr/train.py -opt Deraining/Options/Deraining_Restormer.yml --launcher pytorch

