# PowerShell script to organize files

# Create directories
New-Item -ItemType Directory -Force -Path src, tests, docs, examples, scripts, explanations | Out-Null

# Move Python source files to src
$sourceFiles = @(
    "app_context.py",
    "explanation_models.py",
    "inference_engine.py",
    "inference_engine_enhanced.py",
    "llm_reasoning.py",
    "main.py",
    "models.py",
    "router_inference.py",
    "web_intelligence.py"
)
foreach ($file in $sourceFiles) {
    if (Test-Path $file) {
        Move-Item -Path $file -Destination src\ -Force
        Write-Host "Moved $file to src/"
    }
}

# Move rules.yaml to src
if (Test-Path "rules.yaml") {
    Move-Item -Path "rules.yaml" -Destination src\ -Force
    Write-Host "Moved rules.yaml to src/"
}

# Move test files to tests
$testFiles = @(
    "test_api.py",
    "test_enhanced_engine.py",
    "test_inference_engine.py"
)
foreach ($file in $testFiles) {
    if (Test-Path $file) {
        Move-Item -Path $file -Destination tests\ -Force
        Write-Host "Moved $file to tests/"
    }
}

# Move scripts
$scriptFiles = @(
    "check_python.py",
    "test_manual.py",
    "setup.bat"
)
foreach ($file in $scriptFiles) {
    if (Test-Path $file) {
        Move-Item -Path $file -Destination scripts\ -Force
        Write-Host "Moved $file to scripts/"
    }
}

# Move documentation
$docFiles = @(
    "ENHANCED_INFERENCE_ENGINE.md",
    "INSTALL_PYTHON.md",
    "PROJECT_STRUCTURE.md",
    "QUICKSTART.md",
    "SIGNALS_UPDATE_SUMMARY.md",
    "signals.md",
    "TESTING_GUIDE.md"
)
foreach ($file in $docFiles) {
    if (Test-Path $file) {
        Move-Item -Path $file -Destination docs\ -Force
        Write-Host "Moved $file to docs/"
    }
}

# Move examples
if (Test-Path "example_payloads.json") {
    Move-Item -Path "example_payloads.json" -Destination examples\ -Force
    Write-Host "Moved example_payloads.json to examples/"
}

Write-Host "`nFile organization complete!"

