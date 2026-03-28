# Starship
## Configuration
Créer le fichier de configuration de Starship `~/.config/starship.toml` :
```toml title="starship.toml"
# ─────────────────────────────────────────────
#  Starship — format par défaut
#  Gauche  : chemin uniquement
#  Droite  : tout le reste (contexte, git, langages, cloud…)
#  Shell   : Zsh  |  Terminal : Ghostty
# ─────────────────────────────────────────────

# ── Prompt gauche : chemin + curseur ──────────
format = """
$directory\
$character"""

# ── Prompt droit : tout le contexte par défaut ─
# Correspond au $all officiel, moins $directory,
# $line_break et $character qui restent à gauche.
right_format = """
$username\
$hostname\
$localip\
$shlvl\
$singularity\
$kubernetes\
$vcsh\
$fossil_branch\
$fossil_metrics\
$git_branch\
$git_commit\
$git_state\
$git_metrics\
$git_status\
$hg_branch\
$hg_state\
$pijul_channel\
$docker_context\
$package\
$c\
$cmake\
$cobol\
$daml\
$dart\
$deno\
$dotnet\
$elixir\
$elm\
$erlang\
$fennel\
$fortran\
$gleam\
$golang\
$guix_shell\
$haskell\
$haxe\
$helm\
$java\
$julia\
$kotlin\
$gradle\
$lua\
$nim\
$nodejs\
$ocaml\
$opa\
$perl\
$php\
$pulumi\
$purescript\
$python\
$quarto\
$raku\
$rlang\
$red\
$ruby\
$rust\
$scala\
$solidity\
$swift\
$terraform\
$typst\
$vlang\
$vagrant\
$zig\
$buf\
$nix_shell\
$conda\
$meson\
$spack\
$memory_usage\
$aws\
$gcloud\
$openstack\
$azure\
$nats\
$direnv\
$env_var\
$mise\
$crystal\
$custom\
$sudo\
$cmd_duration\
$jobs\
$battery\
$time\
$status\
$os\
$container\
$netns\
$shell"""

# ── Paramètres globaux ─────────────────────────
scan_timeout    = 30
command_timeout = 500
add_newline     = true

# ── Répertoire (gauche) ────────────────────────
# Chemin tronqué type ~/projets/app
[directory]
truncation_length = 3
truncate_to_repo  = true
```