# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
RUN comfy node install --exit-on-fail comfyui-gguf@1.1.9
RUN comfy node install --exit-on-fail comfyui-kjnodes@1.2.0
RUN comfy node install --exit-on-fail comfy-mtb@0.5.4
RUN comfy node install --exit-on-fail comfyui-videohelpersuite@1.7.8
RUN comfy node install --exit-on-fail comfyui-easy-use@1.3.4
RUN comfy node install --exit-on-fail comfyui-frame-interpolation@1.0.7
RUN comfy node install --exit-on-fail rgthree-comfy@1.0.2512092137

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors --relative-path models/vae --filename wan_2.1_vae.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors --relative-path models/clip --filename umt5_xxl_fp8_e4m3fn_scaled.safetensors
# RUN # Could not find URL for WanVideo\wan2.2_i2v_low_noise_14B_Q8_0.gguf
# RUN # Could not find URL for WanVideo\wan2.2_i2v_high_noise_14B_Q8_0.gguf
# RUN # Could not find URL for rife49.pth
# RUN # Could not find URL for WanVideo/smoothMixWan22I2VT2V_i2vHigh.safetensors
# RUN # Could not find URL for WanVideo/smoothMixWan22I2VT2V_i2vLow.safetensors
# RUN # Could not find URL for wan21NSFWClipVisionH_v10.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
