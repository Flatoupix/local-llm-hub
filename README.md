# Local Model Hub

Télécharge, lance et branche tes modèles locaux en une commande.

Local Model Hub est un petit repo pour:

- installer `llama.cpp` si besoin
- enregistrer des raccourcis de lancement local
- servir plusieurs modèles sur des ports distincts
- générer une config Continue exploitable tout de suite

## Ce que ce repo fait

- expose un manifeste central des modèles dans [`models.json`](./models.json)
- installe des commandes dans `~/.local/bin`
- démarre un modèle local avec `llama-server`
- exporte les modèles vers `~/.continue/config.yaml`
- permet de lancer des profils complets avec `modelhub up`

## Installation

```bash
cd /Users/pierrenowak/Desktop/projets/sandbox/local-model-hub
./setup.sh
./install.sh
```

`setup.sh` installe `llama.cpp` via Homebrew si `llama-server` n'est pas encore disponible.  
`install.sh` crée les raccourcis depuis le manifeste vers `~/.local/bin`.

## Commandes

Afficher les modèles disponibles:

```bash
modelhub list
```

Afficher les profils:

```bash
modelhub profiles
```

Synchroniser la config Continue:

```bash
modelhub continue sync
```

Démarrer tous les modèles du profil par defaut:

```bash
modelhub up
```

Démarrer un profil plus leger:

```bash
modelhub up daily
```

Démarrer un modele precis:

```bash
gemma4 serve
qwen3 serve
qwen3-coder serve
```

## Modeles inclus

Les modeles configures dans ce repo sont:

- `gemma4` -> `ggml-org/gemma-4-E4B-it-GGUF`
- `gemma4-26b` -> `ggml-org/gemma-4-26B-A4B-it-GGUF`
- `qwen3` -> `ggml-org/Qwen3-4B-Instruct-2507-Q8_0-GGUF`
- `qwen3-14b` -> `ggml-org/Qwen3-14B-GGUF`
- `qwen3-coder` -> `ggml-org/Qwen3-Coder-30B-A3B-Instruct-Q8_0-GGUF`

Chaque entree a son propre port local pour que Continue puisse les distinguer.

## Profils

Les profils permettent de lancer un groupe de modeles sans memoriser les IDs:

- `all` -> tous les modeles
- `daily` -> `gemma4`, `qwen3`
- `heavy` -> `gemma4-26b`, `qwen3-14b`, `qwen3-coder`
- `code` -> `qwen3`, `qwen3-14b`, `qwen3-coder`

## Continue

Une fois `modelhub continue sync` execute, Continue lit:

```bash
~/.continue/config.yaml
```

Tu peux ensuite ouvrir Continue dans VS Code et choisir un modele local dans la liste.

Si tu modifies `models.json`, relance:

```bash
modelhub continue sync
```

## Ajouter un nouveau modele

Ajoute une entree dans [`models.json`](./models.json) avec:

- `id`
- `label`
- `hf_repo`
- `port`
- `roles`
- `capabilities`
- `system_message` optionnel

Ensuite relance:

```bash
./install.sh
modelhub continue sync
```

## Utilisation recommandee

Pour un usage quotidien:

```bash
modelhub up daily
```

Puis lance Continue dans ton editeur et choisis:

- `Gemma 4 Local`
- `Qwen 3 Local`

Pour du code plus lourd:

```bash
modelhub up code
```

## Depannage

Si `llama-server` n'est pas trouve:

```bash
./setup.sh
```

Si les commandes ne sont pas dans ton shell:

```bash
rehash
```

Si Continue ne voit pas les modeles:

```bash
modelhub continue sync
```

Si un port est deja pris, change le `port` de l'entree concernee dans `models.json`.

