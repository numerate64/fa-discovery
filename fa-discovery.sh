#!/bin/bash

#############################################
# Pure FlashArray Discovery Script
# Requirements:
# - Passwordless SSH configured
# - pureuser access
#############################################

# ====== CONFIGURATION ======
ARRAY_IP="${1:-192.168.1.100}"   # Pass IP as argument or default
USER="pureuser"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
OUTPUT_FILE="flasharray_${ARRAY_IP}_${TIMESTAMP}.txt"

# ====== VALIDATION ======
if [[ -z "$ARRAY_IP" ]]; then
    echo "Usage: $0 <FlashArray_IP>"
    exit 1
fi

echo "Starting data collection from FlashArray: $ARRAY_IP"
echo "Output file: $OUTPUT_FILE"

# ====== COMMAND EXECUTION FUNCTION ======
run_cmd() {
    local cmd="$1"

    echo "========================================"
    echo "=== $cmd"
    echo "========================================"

    ssh -o BatchMode=yes -o ConnectTimeout=5 "${USER}@${ARRAY_IP}" "$cmd"
    echo ""
}

# ====== EXECUTION ======
{
    echo "FlashArray Discovery Output"
    echo "Target IP: $ARRAY_IP"
    echo "Date: $(date)"
    echo ""

    run_cmd "purearray list"
    run_cmd "purearray list --controller"
    run_cmd "purearray list --security-token"

    run_cmd "puredrive list"
    run_cmd "puredrive list --spec"

    run_cmd "purehw list"
    run_cmd "purehw list --spec"

} | tee "$OUTPUT_FILE"

# ====== COMPLETION ======
echo ""
echo "✅ Collection complete."
echo "📄 Output saved to: $OUTPUT_FILE"
