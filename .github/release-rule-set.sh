# geoip
cd sing-geoip/rule-set
git init
git remote add origin https://github-action:$GITHUB_TOKEN@github.com/77160860/singbox-geo.git
git checkout -B geoip
git add .
git commit -m "Update rule-set"
git push -f origin geoip

# geosite
cd sing-geosite/rule-set
git init
git remote add origin https://github-action:$GITHUB_TOKEN@github.com/77160860/singbox-geo.git
git checkout -B geosite
git add .
git commit -m "Update rule-set"
git push -f origin geosite

