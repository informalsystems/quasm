# quasm

Exploration of language connections between Quint and Cosmwasm.

## How to look for language patterns

We can detect the specific syntax patterns with `semgrep`:

```sh
semgrep scan --config rules.yaml --json -o out.json submodules/**/contract.rs
```

...and inspect the detected rule identifiers in the JSON output:

```sh
jq <out.json '.results[].check_id'
```
