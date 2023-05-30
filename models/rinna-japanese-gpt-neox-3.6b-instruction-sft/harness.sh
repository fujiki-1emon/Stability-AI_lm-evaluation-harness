#!/bin/bash
#SBATCH --account="stablegpt"
#SBATCH --job-name="jp-eval"
#SBATCH --partition=g40
#SBATCH --cpus-per-task=12
#SBATCH --gpus=1
#SBATCH --mem-per-cpu=11G
#SBATCH --output=/fsx/home-mkshing/slurm_outs/%x_%j.out
#SBATCH --error=/fsx/home-mkshing/slurm_outs/%x_%j.err

source /fsx/home-mkshing/.bashrc
micromamba activate stable-neox-env
MODEL_ARGS="pretrained=rinna/japanese-gpt-neox-3.6b-instruction-sft,use_fast=False"
TASK="jsquad-1.1-0.4,jcommonsenseqa-1.1-0.4,jnli-1.1-0.4,marc_ja-1.1-0.4"
python main.py     --model hf-causal     --model_args $MODEL_ARGS     --tasks $TASK     --num_fewshot "2,3,3,3"     --device "cuda"     --output_path "models/rinna-japanese-gpt-neox-3.6b-instruction-sft/result.json"