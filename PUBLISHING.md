# Publishing the tap (one-time + per-release)

## One-time setup

1. Create a **public** GitHub repo named exactly `homebrew-tatastu` under the
   `JakeVartanian` account. The `homebrew-` prefix is what makes
   `brew tap JakeVartanian/tatastu` resolve.

2. Push the contents of this directory (`dist/homebrew-tatastu/`) to it:

   ```bash
   cd dist/homebrew-tatastu
   git init -b main
   git add -A
   git commit -m "Initial tap: tatastu cask"
   git remote add origin git@github.com:JakeVartanian/homebrew-tatastu.git
   git push -u origin main
   ```

3. Check out the tap somewhere stable for the release script to update, e.g.
   alongside the main repo:

   ```bash
   git clone git@github.com:JakeVartanian/homebrew-tatastu.git ../homebrew-tatastu
   ```

   `scripts/update-homebrew-cask.sh` looks for the tap at
   `../homebrew-tatastu` (sibling of the main repo) by default; override with
   `TAP_DIR=...`.

## Per-release

`scripts/update-homebrew-cask.sh` (in the main repo) stamps the new `version`
and the DMG's `sha256` into `Casks/tatastu.rb`. It prefers hashing the artifact
served from `cdn.tatastu.dev` so the cask always matches what users download.

Run it after the DMG is built, notarized, and uploaded:

```bash
TAP_DIR=../homebrew-tatastu CASK_PUSH=1 ./scripts/update-homebrew-cask.sh
```

`CASK_PUSH=1` commits and pushes to the tap automatically. Omit it to review
the change first.

### Wiring into `bun run release`

Append the cask update to the end of the `release` script in `package.json`
(after `upload-release-wrangler.sh`, so the CDN object exists to hash):

```
... && ./scripts/upload-release-wrangler.sh && CASK_PUSH=1 ./scripts/update-homebrew-cask.sh
```

Leave it off the chain if you'd rather publish the cask manually per release.

## Verifying

```bash
brew style Casks/tatastu.rb        # DSL + style lint (must be clean)
brew audit --cask Casks/tatastu.rb # full audit; downloads the DMG to verify sha256
```

`brew audit` only passes once the versioned DMG is actually live on the CDN.

## Notes / decisions

- **arm64 only.** The electron-builder config builds an `arm64` DMG only, so the
  cask declares `depends_on arch: :arm64`. If an Intel build is added later, this
  becomes an `on_arm` / `on_intel` cask with two `url`/`sha256` pairs.
- **Download path.** `upload-release-wrangler.sh` uploads to the R2 bucket root,
  so the public URL is `https://cdn.tatastu.dev/Tatastu-<version>-arm64.dmg`
  (no `releases/desktop/` prefix, despite the electron-builder `publish.url`).
