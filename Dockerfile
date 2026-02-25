# GLM-4.7-Flash (glm4_moe_lite) 지원용 커스텀 이미지
# ref: https://discuss.vllm.ai/t/glm-4-7-flash-with-nvidia/2256
FROM vllm/vllm-openai:latest

RUN apt-get update && apt-get install -y git

RUN pip install -U vllm --pre \
    --index-url https://pypi.org/simple \
    --extra-index-url https://wheels.vllm.ai/nightly

RUN pip install "flashinfer-python>=0.6.4" "flashinfer-cubin>=0.6.4" 
RUN pip install --upgrade flashinfer-jit-cache --index-url https://flashinfer.ai/whl/cu129
RUN pip install -U --no-deps git+https://github.com/huggingface/transformers.git
RUN pip install --upgrade --no-deps huggingface-hub
