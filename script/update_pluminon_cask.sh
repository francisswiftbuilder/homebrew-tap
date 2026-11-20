#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
REPOSITORY="francisswiftbuilder/pluminon"
RELEASE="$(gh api "repos/$REPOSITORY/releases/latest" --jq '
  .tag_name as $tag
  | ($tag | ltrimstr("v")) as $version
  | [.assets[].name] as $assets
  | ["Pluminon", "Groves"]
  | map(select(. as $package | $assets | index("\($package)-\($version).dmg")))
  | if length == 0 then error("Release has no supported DMG")
    else [$tag, .[0]] | @tsv
    end
')"
IFS=$'\t' read -r TAG PACKAGE <<< "$RELEASE"
VERSION="${TAG#v}"
ASSET_NAME="$PACKAGE-$VERSION.dmg"
ASSET_URL="https://github.com/$REPOSITORY/releases/download/$TAG/$ASSET_NAME"
WORK_DIR="$(mktemp -d "${TMPDIR:-/tmp}/pluminon-cask.XXXXXX")"
DMG_PATH="$WORK_DIR/$ASSET_NAME"
CASK_PATH="$ROOT_DIR/Casks/pluminon.rb"

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
  -e "s|/releases/download/v#\{version\}/[A-Za-z]+-#\{version\}\.dmg|/releases/download/v#{version}/$PACKAGE-#{version}.dmg|" \
  -e "s/^  app \"[^\"]+\"/  app \"$PACKAGE.app\"/" \
  "$CASK_PATH" > "$WORK_DIR/pluminon.rb"

mv "$WORK_DIR/pluminon.rb" "$CASK_PATH"
printf 'Updated PLUMINON cask to %s\n' "$VERSION"
