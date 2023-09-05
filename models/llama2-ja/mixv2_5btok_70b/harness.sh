#!/bin/bash
set -eu

PROJECT_DIR=""
MODEL_NAME="mixv2_5btok_70b"

PRETRAINED="${PROJECT_DIR}/llama2/pretrain/hf/${MODEL_NAME}/"
TOKENIZER="meta-llama/Llama-2-70b-hf"
MODEL_ARGS="pretrained=${PRETRAINED},dtype=float16,use_accelerate=True,tokenizer=${TOKENIZER}"

TASK="jcommonsenseqa-1.1-0.2,jnli-1.1-0.2,marc_ja-1.1-0.2,jsquad-1.1-0.2,jaqket_v2-0.2-0.2,xlsum_ja,xwinograd_ja,mgsm"
NUM_FEWSHOT="3,3,3,2,1,1,0,5"

OUTPUT_PATH="models/llama2-ja/${MODEL_NAME}/result.2.json"
time python main.py \
    --model hf-causal-experimental \
    --model_args $MODEL_ARGS \
    --tasks $TASK \
    --num_fewshot $NUM_FEWSHOT \
    --device "cuda" \
    --output_path $OUTPUT_PATH