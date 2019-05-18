#!/bin/bash

LIB_NAME=plp_math_ibex
OBJ_DIR=/home/xiaywang/pulp/PULP-DSP/obj/obj_ibex

#LIB_NAME=plp_math_riscy_singlecore
#OBJ_DIR=/home/xiaywang/pulp/PULP-DSP/obj/obj_riscy_singlecore

ar rcs lib$LIB_NAME.a $OBJ_DIR/*.o
