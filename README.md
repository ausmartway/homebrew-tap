# ausmartway/homebrew-tap

A [Homebrew](https://brew.sh) tap for my free, open-source macOS apps.

## Usage

```bash
brew tap ausmartway/tap
brew install --cask bar-helper
```

`brew tap ausmartway/tap` points at this repository (`ausmartway/homebrew-tap`).
Once tapped, install any cask listed below by name.

## Available casks

| Cask | Description |
|------|-------------|
| [`bar-helper`](Casks/bar-helper.rb) | Menu bar manager that hides, reveals, and styles status items. Source: [ausmartway/bar-helper](https://github.com/ausmartway/bar-helper). |

## Notes

These apps are free and **not notarized** (no paid Apple Developer ID), so
macOS Gatekeeper asks you to confirm them once on first launch. Each cask's
`caveats` explains how — see the app's own README for details.

## How updates work

Casks here are kept in sync with each app's GitHub Releases. For `bar-helper`,
the [bar-helper release workflow](https://github.com/ausmartway/bar-helper/blob/main/.github/workflows/release.yml)
publishes the zipped `.app` and updates this cask's `version` and `sha256`.
