#!/bin/bash
set -eu

PROJECT_DIR=""
MODEL_NAME="mixv2_5btok_7b_javocab-vocab"

PRETRAINED="${PROJECT_DIR}/llama2/pretrain/hf/${MODEL_NAME}/"
TOKENIZER="${PROJECT_DIR}/tokenizers/llama2-ja-hf-lt/,use_fast=False"
MODEL_ARGS="pretrained=${PRETRAINED},tokenizer=${TOKENIZER}"

TASK="jcommonsenseqa-1.1-0.2,jnli-1.1-0.2,marc_ja-1.1-0.2,jsquad-1.1-0.2,jaqket_v2-0.2-0.2,xlsum_ja,xwinograd_ja,mgsm"
NUM_FEWSHOT="3,3,3,2,1,1,0,5"

OUTPUT_PATH="models/llama2-ja/${MODEL_NAME}/result.json"
python main.py \
    --model hf-causal \
    --model_args $MODEL_ARGS \
    --tasks $TASK \
    --num_fewshot $NUM_FEWSHOT \
    --device "cuda" \
    --output_path $OUTPUT_PATH