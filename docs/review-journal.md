# Review Journal

I treated `onyx-model-sample-dock` as a project where the smallest useful behavior should still be inspectable.

The local checks classify each case as `ship`, `watch`, or `hold`. That gives the project a small review vocabulary that matches its ml utilities focus without claiming live deployment or external usage.

## Cases

- `baseline`: `feature drift`, score 227, lane `ship`
- `stress`: `window width`, score 134, lane `watch`
- `edge`: `metric stability`, score 136, lane `watch`
- `recovery`: `explainability`, score 156, lane `ship`
- `stale`: `feature drift`, score 181, lane `ship`

## Note

The repository should be understandable without pretending it is larger than it is.
