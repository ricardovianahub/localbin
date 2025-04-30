@rem git for-each-ref --sort=-committerdate --format="%(refname:short) %(objectname:short) %(committerdate:iso8601)"
git for-each-ref --sort=-committerdate --format="%(committerdate:short) - %(refname:short)"
