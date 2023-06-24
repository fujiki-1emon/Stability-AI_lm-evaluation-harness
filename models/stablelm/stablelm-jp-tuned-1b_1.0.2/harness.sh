#!/bin/bash
PROJECT_DIR=""
MODEL_ARGS="pretrained=${PROJECT_DIR}/sft/checkpoints/stablelm-jp-tuned-1b-1.0.2/,tokenizer=${PROJECT_DIR}/tokenizers/nai-hf-tokenizer,use_fast=False"
TASK="jsquad-1.1-0.6,jcommonsenseqa-1.1-0.6,jnli-1.1-0.6,marc_ja-1.1-0.6"
NUM_FEW_SHOTS="2,3,3,3"
python main.py \
    --model hf-causal \
    --model_args $MODEL_ARGS \
    --tasks $TASK \
    --num_fewshot $NUM_FEW_SHOTS \
    --device "cuda" \
    --output_path "models/stablelm/stablelm-jp-tuned-1b_1.0.2/result.json"