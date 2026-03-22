FROM runpod/worker-comfyui:5.5.1-base

RUN comfy model download --url https://huggingface.co/Comfy-Org/flux2-dev/resolve/main/split_files/vae/flux2-vae.safetensors --relative-path models/vae --filename flux2-vae.safetensors
RUN comfy model download --url https://huggingface.co/kp-forks/FLUX.2-klein-9B/resolve/main/flux-2-klein-9b.safetensors --relative-path models/diffusion_models --filename flux-2-klein-9b.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/vae-text-encorder-for-flux-klein-9b/resolve/main/split_files/text_encoders/qwen_3_8b_fp8mixed.safetensors --relative-path models/clip --filename qwen_3_8b_fp8mixed.safetensors

COPY start-with-lora.sh /start-with-lora.sh
RUN chmod +x /start-with-lora.sh

CMD ["/start-with-lora.sh"]
