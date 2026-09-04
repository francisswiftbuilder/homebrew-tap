#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
REPOSITORY="francisswiftbuilder/Groves"
TAG="$(gh api "repos/$REPOSITORY/releases/latest" --jq '.tag_name')"
VERSION="${TAG#v}"
ASSET_NAME="Groves-$VERSION.dmg"
ASSET_URL="https://github.com/$REPOSITORY/releases/download/$TAG/$ASSET_NAME"
WORK_DIR="$(mktemp -d "${TMPDIR:-/tmp}/groves-cask.XXXXXX")"
DMG_PATH="$WORK_DIR/$ASSET_NAME"
CASK_PATH="$ROOT_DIR/Casks/groves.rb"

cleanup() {
  if [[ -d "$WORK_DIR" ]]; then
    /bin/rm -rf "$WORK_DIR"
  fi
}
trap cleanup EXIT

curl --fail --silent --show-error --location "$ASSET_URL" --output "$DMG_PATH"
SHA256="$(shasum -a 256 "$DMG_PATH" | awk '{ print $1 }')"

sed -E \
  -e "s/version \"[^\"]+\"/version \"$VERSION\"/" \
  -e "s/sha256 \"[0-9a-f]+\"/sha256 \"$SHA256\"/" \
  "$CASK_PATH" > "$WORK_DIR/groves.rb"

mv "$WORK_DIR/groves.rb" "$CASK_PATH"
printf 'Updated Groves Cask to %s\n' "$VERSION"
