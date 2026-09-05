# frozen_string_literal: true

cask "tatastu" do
  version "0.2.110"

  # Per-arch payloads. electron-builder names the arm64 DMG with an "-arm64"
  # suffix and the Intel (x64) DMG with NO arch suffix, so the URLs differ in
  # shape and each arch carries its own sha256. update-homebrew-cask.sh stamps
  # both hashes from the locally-built, notarized DMGs on release.
  on_arm do
    sha256 "4b150a4f41124dbee4ba7afdf1465c792d5001354a256fdfc5197936f80d6db6"

    url "https://cdn.tatastu.dev/Tatastu-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "69a14f9c7303ecdf88e7d0de9a64ff00b871ef0ed0a85cd62c2701f379a94da6"

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
