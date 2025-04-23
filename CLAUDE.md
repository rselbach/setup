# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build/Test Commands
- Execute setup scripts: `./setup-[arch|debian|mac].sh`
- No formal build or test process; scripts are standalone shell scripts

## Code Style Guidelines
- Shell scripts: Use POSIX-compatible shell syntax (sh/bash)
- File naming: OS-specific files use `-[os]` suffix (e.g., `setup-mac.sh`)
- Script modules in `setup.d/` follow `XX-name-[os|all]` pattern
- Conditional execution: Check for OS type before running commands
- Error handling: Verify commands succeed where critical
- Comments: Document non-obvious commands or setup steps
- Config files: Store in `configs/` directory with appropriate naming
- Shell style: Use double brackets for conditionals when appropriate
- Command paths: Use absolute paths when necessary for reliability