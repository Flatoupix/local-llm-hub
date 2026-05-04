# Local Model Hub

Local Model Hub is a small repo for downloading and serving local LLMs and exposing them to Continue.

It gives you:

- one manifest for local models
- one command to install shortcuts
- one command to sync Continue's local config
- one command to serve a chosen model on its own port

## Commands

```bash
./setup.sh
./install.sh
modelhub list
modelhub profiles
modelhub continue sync
modelhub up
modelhub up daily
gemma4 serve
qwen3 serve
```

`./setup.sh` installs `llama.cpp` if needed. `./install.sh` adds the command shortcuts from `models.json` to `~/.local/bin`.

## What it ships with

- `gemma4` -> `ggml-org/gemma-4-E4B-it-GGUF`
- `gemma4-26b` -> `ggml-org/gemma-4-26B-A4B-it-GGUF`
- `qwen3` -> `ggml-org/Qwen3-4B-Instruct-2507-Q8_0-GGUF`
- `qwen3-14b` -> `ggml-org/Qwen3-14B-GGUF`
- `qwen3-coder` -> `ggml-org/Qwen3-Coder-30B-A3B-Instruct-Q8_0-GGUF`

Each model gets its own port so Continue can list them separately.

Profiles:

- `all` starts every model
- `daily` starts the lightweight pair
- `heavy` starts the larger models
- `code` starts the coding-focused models

## Continue

Run:

```bash
modelhub continue sync
```

That writes a local Continue config to:

```bash
~/.continue/config.yaml
```

Continue reloads the file automatically when you save it.

## Extend it

Add more entries to `models.json` with:

- `id`
- `label`
- `hf_repo`
- `port`
- `roles`
- `capabilities`
- optional `system_message`

If you want remote OpenAI-compatible endpoints too, the manifest can be extended later with `apiBase`-style entries.
