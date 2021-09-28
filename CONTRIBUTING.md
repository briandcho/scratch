# Pre-requisites

- [pre-commit](https://pre-commit.com/#install)
- [nodeenv](https://github.com/ekalinin/nodeenv#install)
- [shellcheck](https://github.com/koalaman/shellcheck#installing)


# Onboarding

```
pre-commit install
pre-commit install --hook-type commit-msg
nodeenv venv
. venv/bin/activate
npm install -g bats bats-assert bats-support
```
