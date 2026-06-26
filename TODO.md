# Neovim on NixOS — Config Handoff

## Goal

A single Neovim config (Lua + lazy.nvim) that works identically on NixOS (blind-warrior)
and Arch Linux (primary laptop) — no duplication, no per-OS workarounds, no Nix required on Arch.

## Current Progress

- `nix-ld` added to `hosts/blind-warrior/configuration.nix` (committed, needs rebuild)
- `nixfmt` stdin fix applied to `lua/configs/conform.lua` (committed)
- `devenv.nix` created in DSA-from-Scratch project (`languages.c.enable`, `pkgs.marksman`)
- direnv + nix-direnv already configured in home-manager

## What Worked

- **`nix-ld`** unblocks Mason-installed binaries (clang-format, stylua, etc.) on NixOS
  by providing a dynamic linker. One line in `configuration.nix`, zero Lua changes.
- **devenv per-project** works for project-scoped tools when direnv auto-activates the shell.
- **`nixfmt` fix** — newer nixfmt requires `args = { "-" }` in conform for stdin mode.

## What Didn't Work / Dead Ends

- **`languages.markdown.enable`** — does not exist in devenv. Use `packages = [ pkgs.marksman ]` instead.
- **`lazy-lsp.nvim`** — requires Nix on the host, only supports ~135/386 lspconfig servers.
- **`nix-ld` alone** doesn't fix `prettierd` — that error ("node not found") is a PATH issue,
  not a dynamic linker issue. `prettierd` shells out to `node` which must be in PATH separately.
- **nixvim / nvf / nixCats** — all require Nix installed on Arch. Ruled out unless Nix is added there.
- **nixCats** — also in maintenance mode, replaced by `nix-wrapper-modules`.
- **`lazy-lsp.nvim`** — requires Nix on host to wrap LSP commands in `nix shell`.

## Remaining Formatter Errors (conform.log)

| Formatter | Error | Fix |
|---|---|---|
| `clang-format` | ENOENT — dynamic linker | Fixed by `nix-ld` after rebuild |
| `prettierd` | `node` not found | Needs Node.js in PATH (see Next Steps) |
| `nixfmt` | stdin deprecation warning | Fixed — `args = { "-" }` applied |

## Options Researched (no Nix on Arch constraint)

| Approach | Nix on Arch? | Lua changes? | Nix changes per tool? |
|---|---|---|---|
| `nix-ld` (current) | no | no | no |
| `extraPackages` + env vars | no | no | sometimes |
| `lazy-nix-helper.nvim` | no | yes (conditionals) | yes |
| `buildFHSEnv` | NixOS-only | no | yes |
| `nixvim` / `nvf` / `nixCats` | yes | full rewrite | no |

### `home-manager extraPackages + env vars` (geanmar approach)
More thorough than `nix-ld` — provides actual build dependencies (`gcc`, `cmake`, `ninja`,
`pkg-config`) and sets `CPATH`, `LD_LIBRARY_PATH`, `PKG_CONFIG_PATH` on the nvim wrapper
so Mason can compile and run any binary. Zero Lua changes. Best next step if `nix-ld` alone
isn't enough.
Reference: https://geanmar.com/posts/how-to-setup-nvim-on-nixos/

### `lazy-nix-helper.nvim`
On Arch: standard Lazy + Mason, no Nix needed. On NixOS: reads plugins from Nix store,
`mason_enabled()` gates Mason. Single config file but requires adding `if mason_enabled()`
conditionals in Lua. Not actively developed.
Reference: https://github.com/b-src/lazy-nix-helper.nvim

## References

| Resource | What it covers |
|---|---|
| https://github.com/b-src/lazy-nix-helper.nvim | lazy-nix-helper plugin — Mason conditional on NixOS |
| https://geanmar.com/posts/how-to-setup-nvim-on-nixos/ | extraPackages + env vars approach to keep Mason working |
| https://blog.hyperboly.net/posts/guides/my-neovim-workflow-2026/ | nixCats-based NixOS workflow, works on non-NixOS with tweaks |
| https://github.com/nix-community/nixvim | nixvim — full Neovim config in Nix |
| https://github.com/NotAShelf/nvf | nvf — modular Neovim framework for Nix |
| https://github.com/BirdeeHub/nixCats-nvim | nixCats — keep Lua config, Nix manages deps (maintenance mode) |
| https://github.com/nix-community/kickstart-nix.nvim | kickstart-nix — dead simple Nix flake template for Neovim |
| https://ayats.org/blog/neovim-wrapper | Neovim wrapper with Nix from scratch |
| https://nixcats.org/nix_LSPS.html | nixCats LSP/formatter setup guide |
| https://discourse.nixos.org/t/configuring-neovim-how-to-run-non-nix-executables/49631 | NixOS Discourse: running non-Nix executables in Neovim |
| https://discourse.nixos.org/t/poll-about-potential-neovim-wrapper-changes/76804 | NixOS Discourse: upcoming wrapper changes poll |
| https://github.com/NixOS/nixpkgs/issues/498672 | nixpkgs 2026 neovim roadmap |
| https://github.com/dundalek/lazy-lsp.nvim | lazy-lsp.nvim — wraps LSP in nix shell (requires Nix) |

## Next Steps

### Short term (unblock current issues)

1. **Rebuild NixOS** to apply `nix-ld`:
   ```
   sudo nixos-rebuild switch --flake .#blind-warrior
   ```

2. **Fix `prettierd`** — add Node.js globally via home-manager (`home/features/cli/default.nix`):
   ```nix
   home.packages = [ pkgs.nodejs ];
   ```
   Or switch to `deno fmt` for TS/JS files (deno is already a Nix package).

3. **If Mason still breaks after nix-ld** — upgrade to the `extraPackages` + env vars approach
   from geanmar (adds gcc, cmake, ninja, pkg-config to the nvim wrapper).

### Long term (if Nix gets installed on Arch laptop)

Migrate to **nixvim** — entire Neovim config declared in Nix, portable via `nix run`.

- Install Nix on Arch: `sh <(curl -L https://nixos.org/nix/install)`
- Template: `nix flake init --template github:nix-community/nixvim`
- Remove Mason entirely — nixvim installs everything via Nix
- Single flake, works on both machines, no dynamic linker issues anywhere

Reference: https://github.com/nix-community/nixvim

### 2026 nixpkgs roadmap

The Nix team is actively working on stabilizing `wrapNeovimUnstable` and improving Mason
UX for NixOS in the 26.05/26.11 cycle. Worth checking back:
https://github.com/NixOS/nixpkgs/issues/498672
