#!/bin/bash
set -e

LORA_DIR="/comfyui/models/loras"
LORA_FILE="pussydiffusion-shaved_innie-f2-klein-9b_v1.safetensors"
LORA_URL="${LORA_URL:-https://huggingface.co/Meomemewew/pussydif/resolve/main/pussydiffusion-shaved_innie-f2-klein-9b_v1.safetensors}"

mkdir -p "$LORA_DIR"

if [ ! -f "$LORA_DIR/$LORA_FILE" ]; then
  curl -L \
    -H "Authorization: Bearer ${HF_TOKEN}" \
    "$LORA_URL" \
    -o "$LORA_DIR/$LORA_FILE"
fi

exec /start.sh
