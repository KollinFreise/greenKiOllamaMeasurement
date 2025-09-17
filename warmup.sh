#!/bin/bash

# Usage: ./runtime.sh [llm-model]
# Example: ./runtime.sh llama3.2:1b

LLM_MODEL="${1:-llama3.2:1b}"

SYSTEMPROMPT="You are a helpful, precise, and concise AI assistant. Always respond clearly, accurately, and without unnecessary verbosity."

function run_with_timing() {
    local prompt="$1"
    local taskname="$2"
    echo
    echo "===== $taskname ====="
    local start=$(date +%s)
    local timestamp_start=$(date +"%Y-%m-%d %H:%M:%S")
    echo "[$timestamp_start] Start"
    echo -e "$SYSTEMPROMPT\n\n$prompt" | ollama run "$LLM_MODEL"
    local end=$(date +%s)
    local timestamp_end=$(date +"%Y-%m-%d %H:%M:%S")
    echo "[$timestamp_end] End"
    echo "Duration: $((end - start)) seconds"
}

echo "Warming up model using a good variety of example prompts"
echo "The value for OLLAMA_REQUEST_TIMEOUT is: $OLLAMA_REQUEST_TIMEOUT"

run_with_timing "What is the capital of France?" "Capital of France"
run_with_timing "Was ist schwerer. Ein Kilogramm Stahl oder ein Kilogramm Federn?" "Steel vs. Feathers"
run_with_timing "Tôi đang phát triển một ứng dụng Spring Boot với Kotlin và Maven. Làm thế nào để cấu hình Liquibase để nó chạy khi ứng dụng của tôi khởi động?" "Liquibase with Spring Boot and Kotlin"
run_with_timing "Explain the difference between supervised and unsupervised learning in machine learning." "Supervised vs. Unsupervised Learning"
run_with_timing "Write a haiku about autumn leaves." "Haiku about Autumn Leaves"
run_with_timing "¿Cuál es el impacto del cambio climático en los océanos?" "Climate Change and Oceans"
run_with_timing "Give me a recipe for a vegan chocolate cake." "Vegan Chocolate Cake Recipe"
run_with_timing "Summarize the plot of Shakespeare's Hamlet in two sentences." "Hamlet Summary"
run_with_timing "How do you optimize a SQL query for faster performance?" "SQL Query Optimization"
run_with_timing "What are the main differences between HTTP and HTTPS protocols?" "HTTP vs. HTTPS"

echo "Sleeping for 10 seconds to allow the model to warm up..."
sleep 10
