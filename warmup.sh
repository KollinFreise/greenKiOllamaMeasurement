#!/bin/bash

# Usage: ./runtime.sh [llm-model]
# Beispiel: ./runtime.sh llama3.2:1b

LLM_MODEL="${1:-llama3.2:1b}"

echo "Warming up model using a good variety of example prompts"

echo "The value for OLLAMA_REQUEST_TIMEOUT is: $OLLAMA_REQUEST_TIMEOUT"

echo "What is the capital of France?" | ollama run "$LLM_MODEL"
echo "Was ist schwerer. Ein Kilogramm Stahl oder ein Kilogramm Federn?" | ollama run "$LLM_MODEL"
echo "Tôi đang phát triển một ứng dụng Spring Boot với Kotlin và Maven. Làm thế nào để cấu hình Liquibase để nó chạy khi ứng dụng của tôi khởi động?" | ollama run "$LLM_MODEL"
echo "Explain the difference between supervised and unsupervised learning in machine learning." | ollama run "$LLM_MODEL"
echo "Write a haiku about autumn leaves." | ollama run "$LLM_MODEL"
echo "¿Cuál es el impacto del cambio climático en los océanos?" | ollama run "$LLM_MODEL"
echo "Give me a recipe for a vegan chocolate cake." | ollama run "$LLM_MODEL"
echo "Summarize the plot of Shakespeare's Hamlet in two sentences." | ollama run "$LLM_MODEL"
echo "How do you optimize a SQL query for faster performance?" | ollama run "$LLM_MODEL"
echo "What are the main differences between HTTP and HTTPS protocols?" | ollama run "$LLM_MODEL"

echo "Sleeping for 10 seconds to allow the model to warm up..."
sleep 10
