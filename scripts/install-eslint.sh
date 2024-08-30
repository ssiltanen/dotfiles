#!/usr/bin/env sh

if [ -z "$1" ]; then
  echo "Error: requires a vscode-eslint tag"
  exit 1
fi

TAG="$1"
echo "Tag ${TAG}"

echo "Clone Microsoft/vscode-eslint"
rm -rf /tmp/vscode-eslint
mkdir /tmp/vscode-eslint
git clone git@github.com:Microsoft/vscode-eslint /tmp/vscode-eslint

# Checkout the required version with a tag
cd /tmp/vscode-eslint || exit 1
git clean -fd
git checkout tags/"${TAG}"

echo "Install and build"
npm ci
npm run esbuild

# Make into an executable and move to home bin
echo "Make executable"
{ echo "#!/usr/bin/env node"; cat ./server/out/eslintServer.js; } > "$HOME"/bin/eslint-language-server
chmod u+x "$HOME"/bin/eslint-language-server
