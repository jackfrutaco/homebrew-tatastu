# homebrew-tatastu

Homebrew tap for [Tatastu](https://tatastu.dev) — a local-first desktop app for AI-powered code assistance.

## Install

```bash
brew install --cask JakeVartanian/tatastu/tatastu
```

Or tap first, then install:

```bash
brew tap JakeVartanian/tatastu
brew install --cask tatastu
```

## Update

```bash
brew upgrade --cask tatastu
```

> Tatastu also updates itself in-app via its built-in auto-updater. Homebrew is
> just an alternative way to install and stay current.

## Uninstall

```bash
brew uninstall --cask tatastu
```

To also remove app data, settings, and caches:

```bash
brew uninstall --zap --cask tatastu
```

## Notes

- **Apple Silicon only.** Tatastu ships an `arm64` build; there is no Intel/x64
  cask. On Intel Macs `brew install` will refuse with an architecture error.
- The cask installs the app freely. Feature licensing is enforced inside the app
  at runtime.
- The DMG is downloaded from `https://cdn.tatastu.dev` (Cloudflare R2) and is
  Apple-notarized.

## For maintainers

The cask formula lives at [`Casks/tatastu.rb`](Casks/tatastu.rb). On each
release, the `version` and `sha256` are stamped by
`scripts/update-homebrew-cask.sh` in the main Tatastu repo (run as part of
`bun run release`). Do not edit those two fields by hand.
