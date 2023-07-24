#!/bin/bash

PROJECT_DIR=""
PRETRAINED="${PROJECT_DIR}/sft/models/stablelm-jp-instruct-3b_1.5.2/"
TOKENIZER="${PROJECT_DIR}/tokenizers/nai-hf-tokenizer/,use_fast=False"
MODEL_ARGS="pretrained=${PRETRAINED},tokenizer=${TOKENIZER}"
TASK="jsquad-1.1-0.3,jcommonsenseqa-1.1-0.3,jnli-1.1-0.3,marc_ja-1.1-0.3,jaqket_v2-0.1-0.3,xlsum_ja-1.0-0.3,mgsm-1.0-0.3"
NUM_FEWSHOT="2,3,3,3,1,1,4"
# TASK="xwinograd_ja"
# NUM_FEWSHOT="0"
OUTPUT_PATH="models/stablelm/stablelm-jp-instruct-3b_1.5.2/result.json"
python main.py \
    --model hf-causal \
    --model_args $MODEL_ARGS \
    --tasks $TASK \
    --num_fewshot $NUM_FEWSHOT \
    --device "cuda" \
    --no_cache \
    --output_path $OUTPUT_PATH