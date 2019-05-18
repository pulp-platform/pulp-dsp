#!/bin/bash

LIB_NAME=plp_math_ibex
OBJ_DIR=/home/xiaywang/pulp/PULP-DSP/obj/obj_ibex

ar rcs lib$LIB_NAME.a $OBJ_DIR/*.o
