# frozen_string_literal: true

cask "tatastu" do
  version "0.2.111"

  # Per-arch payloads. electron-builder names the arm64 DMG with an "-arm64"
  # suffix and the Intel (x64) DMG with NO arch suffix, so the URLs differ in
  # shape and each arch carries its own sha256. update-homebrew-cask.sh stamps
  # both hashes from the locally-built, notarized DMGs on release.
  on_arm do
    sha256 "ad44ec9d4fb1e3daee62a9ad6fb81dc8568ebea558d166fb03855bc0206bf843"

    url "https://cdn.tatastu.dev/Tatastu-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "09f77a8201964279868f5dff067f74ec1150c9e57e6ed93d590098606dce69d5"

    url "https://cdn.tatastu.dev/Tatastu-#{version}.dmg"
  end

  name "Tatastu"
  desc "Local-first desktop app for AI-powered code assistance"
  homepage "https://tatastu.dev/"

  # The app's auto-updater (electron-updater) handles in-app updates.
  auto_updates true
  depends_on macos: :big_sur

  app "Tatastu.app"

  zap trash: [
    "~/Library/Application Support/Tatastu",
    "~/Library/Caches/dev.tatastu.app",
    "~/Library/HTTPStorages/dev.tatastu.app",
    "~/Library/Preferences/dev.tatastu.app.plist",
    "~/Library/Saved Application State/dev.tatastu.app.savedState",
  ]
end
