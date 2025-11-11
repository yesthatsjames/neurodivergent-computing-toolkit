#!/bin/bash
# Security Scan Workflow
# Links to your existing security scripts

echo "🛡️ Running Security Scans..."
echo ""

if [ -f "$HOME/local_security_audit.sh" ]; then
    echo "Running local security audit..."
    bash "$HOME/local_security_audit.sh"
else
    echo "⚠️ Local security audit script not found"
    echo "Expected location: $HOME/local_security_audit.sh"
fi

echo ""
echo "✅ Security scan complete!"
