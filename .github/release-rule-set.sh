#!/bin/bash
set -e -o pipefail

# -----------------------------
# Update geoip branch
# -----------------------------
cd sing-geoip/rule-set

# 配置 git 用户
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
git config user.name "github-actions[bot]"

# 初始化或重置仓库
git init
git remote remove origin 2>/dev/null || true
git remote add origin https://github-actions:$GITHUB_TOKEN@github.com/77160860/singbox-geo.git

# 检查是否有文件需要提交
if [ -n "$(git status --porcelain)" ]; then
    git checkout -B geoip
    git add .
    git commit -m "Update geoip rule-set"
    git push -f origin geoip
else
    echo "No changes to commit for geoip"
fi
cd -

# -----------------------------
# Update geosite branch
# -----------------------------
if [ ! -d "sing-geosite/rule-set" ]; then
    echo "sing-geosite/rule-set not found, skipping geosite update"
else
    cd sing-geosite/rule-set

    git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
    git config user.name "github-actions[bot]"

    git init
    git remote remove origin 2>/dev/null || true
    git remote add origin https://github-actions:$GITHUB_TOKEN@github.com/77160860/singbox-geo.git

    if [ -n "$(git status --porcelain)" ]; then
        git checkout -B geosite
        git add .
        git commit -m "Update geosite rule-set"
        git push -f origin geosite
    else
        echo "No changes to commit for geosite"
    fi
    cd -
fi
