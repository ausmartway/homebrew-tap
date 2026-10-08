# Homebrew cask for bar-helper — free, open source menu bar manager.
#
# Install:
#   brew tap ausmartway/tap
#   brew install --cask bar-helper
#
# The `version`/`sha256` are kept in sync with the GitHub release by the
# bar-helper repo's release workflow (or updated by hand from the sha256 that
# scripts/package-app.sh prints). They are intentionally inert until the first
# release is published.
cask "bar-helper" do
  version "0.1.0"
  sha256 "9ab657bac6202e41e28811fb9a2796bd867fd1cade5a749901424411ac02789a"

  url "https://github.com/ausmartway/bar-helper/releases/download/v#{version}/bar-helper-#{version}.zip"
  name "bar-helper"
  desc "Menu bar manager that hides, reveals, and styles status items"
  homepage "https://github.com/ausmartway/bar-helper"

  # bar-helper relies on system APIs and the menu-bar model finalized in
  # macOS 16+ (validated on macOS 26 "Tahoe").
  depends_on macos: :sequoia

  app "bar-helper.app"

  # Quit the running agent before upgrading/uninstalling.
  uninstall quit: "app.barhelper.bar-helper"

  # bar-helper is free and unsigned (no paid Apple Developer ID), so it is not
  # notarized. macOS Gatekeeper asks you to confirm it once on first launch.
  caveats <<~EOS
    bar-helper is not notarized (it's free and ad-hoc signed). The first time
    you open it, macOS will block it. To allow it:

      Open it once, then go to
        System Settings → Privacy & Security → "Open Anyway".

    Or clear the quarantine flag in one command:
      xattr -dr com.apple.quarantine "#{appdir}/bar-helper.app"
  EOS

  # Remove preferences and saved state on `brew uninstall --zap`.
  zap trash: [
    "~/Library/Preferences/app.barhelper.bar-helper.plist",
    "~/Library/Saved Application State/app.barhelper.bar-helper.savedState",
  ]
end
