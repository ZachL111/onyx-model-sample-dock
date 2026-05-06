# Onyx Model Sample Dock Walkthrough

This note is the quickest way to read the extra review model in `onyx-model-sample-dock`.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | feature drift | 227 | ship |
| stress | window width | 134 | watch |
| edge | metric stability | 136 | watch |
| recovery | explainability | 156 | ship |
| stale | feature drift | 181 | ship |

Start with `baseline` and `stress`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

The useful comparison is `feature drift` against `window width`, not the raw score alone.
