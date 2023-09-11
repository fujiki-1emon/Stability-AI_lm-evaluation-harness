#!/bin/bash
#
#SBATCH --account="stablegpt"
#SBATCH --comment="stablegpt"
#SBATCH --job-name="eval-jp-stablegpt"
#SBATCH --partition=g40
#SBATCH --cpus-per-task=12
#SBATCH --gpus=1
#SBATCH --mem-per-cpu=11G
#SBATCH --output=/fsx/home-fujiki/workspace/Stability-AI_lm-evaluation-harness/logs/%x_%j.out
#SBATCH --error=/fsx/home-fujiki/workspace/Stability-AI_lm-evaluation-harness/logs/%x_%j.out

set -eu

MODEL_NAME="llama2-7b-chat"
PRETRAINED="meta-llama/Llama-2-7b-chat-hf,use_accelerate=True"
MODEL_ARGS="pretrained=${PRETRAINED}"
TASK="jsquad-1.1-0.7,jaqket_v2-0.2-0.7,xlsum_ja-1.0-0.7"
NUM_FEWSHOT="2,1,1"
OUTPUT_PATH="models/llama2/${MODEL_NAME}/result_0.7.json"

time python main.py \
    --model hf-causal-experimental \
    --model_args $MODEL_ARGS \
    --tasks $TASK \
    --num_fewshot $NUM_FEWSHOT \
    --device "cuda" \
    --output_path $OUTPUT_PATH \
    --batch_size 2

# - [x] 92182