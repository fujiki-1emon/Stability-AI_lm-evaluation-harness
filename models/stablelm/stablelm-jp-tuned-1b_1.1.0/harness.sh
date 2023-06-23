#!/bin/bash

PROJECT_DIR=""
MODEL_ARGS="pretrained=${PROJECT_DIR}/sft/checkpoints/stablelm-jp-tuned-1b_1.1.0,tokenizer=${PROJECT_DIR}/tokenizers/nai-hf-tokenizer_v2,use_fast=False"
TASK="jcommonsenseqa-1.1-0.5"
NUM_FEW_SHOTS="3"
python main.py \
    --model hf-causal \
    --model_args $MODEL_ARGS \
    --tasks $TASK \
    --num_fewshot $NUM_FEW_SHOTS \
    --device "cuda" \
    --output_path "models/stablelm/stablelm-jp-tuned-1b_1.1.0/result.json"


