# homebrew-rig

Homebrew tap for [rig](https://github.com/christomaszewski/rig) — the vehicle-level
sensor-stack orchestrator.

```sh
brew install christomaszewski/rig/rig
rig setup     # once per user: ~/.rig + the default public registry
```

Upgrades ride `brew upgrade` (rig never self-updates). Uninstall: `rig setup --purge`
(user state), then `brew uninstall rig` (the program — it never touches `~/.rig`).

The formula is bumped automatically by rig's release workflow when the
`TAP_PUSH_TOKEN` secret is configured, or by hand: update `url` + the first
`sha256` for the new tag.
