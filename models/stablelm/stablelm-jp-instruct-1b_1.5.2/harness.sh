#!/bin/bash

set -eu

PROJECT_DIR=""
MODEL_ARGS="pretrained=${PROJECT_DIR}/sft/checkpoints/stablelm-jp-instruct-1b_1.5.2,tokenizer=${PROJECT_DIR}/tokenizers/nai-hf-tokenizer/,use_fast=False"
TASK="jsquad-1.1-0.3,jcommonsenseqa-1.1-0.3,jnli-1.1-0.3,marc_ja-1.1-0.3"
python main.py \
    --model hf-causal \
    --model_args $MODEL_ARGS \
    --tasks $TASK \
    --num_fewshot "2,3,3,3" \
    --device "cuda" \
    --output_path "models/stablelm/stablelm-jp-instruct-1b_1.5.2/result.json"