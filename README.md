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
modelhub continue sync
gemma4 serve
qwen3 serve
```

`./setup.sh` installs `llama.cpp` if needed. `./install.sh` adds the command shortcuts to `~/.local/bin`.

## What it ships with

- `gemma4` -> `ggml-org/gemma-4-E4B-it-GGUF`
- `qwen3` -> `ggml-org/Qwen3-4B-Instruct-2507-Q8_0-GGUF`

Each model gets its own port so Continue can list them separately.

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
