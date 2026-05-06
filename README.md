# onyx-model-sample-dock

`onyx-model-sample-dock` is a compact Haskell repository for ml utilities, centered on this goal: Create a Haskell reference implementation for sample workflows, centered on policy evaluation, deny and allow fixtures, and explainable decision traces.

## Project Rationale

The project exists to keep a narrow engineering decision visible and testable. For this repo, that decision is how feature drift and metric stability should influence a review result.

## Onyx Model Sample Dock Review Notes

For a quick review, compare `feature drift` with `window width` before reading the middle cases.

## Feature Set

- `fixtures/domain_review.csv` adds cases for feature drift and window width.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/onyx-model-sample-walkthrough.md` walks through the case spread.
- The Haskell code includes a review path for `feature drift` and `window width`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Architecture

The implementation keeps the scoring rule plain: reward signal and confidence, preserve slack, penalize drag, then classify the result into a review lane.

The Haskell implementation avoids hidden state so fixture changes are easy to reason about.

## Usage

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Test Command

The same command runs the local verification path. The highest-scoring domain case is `baseline` at 227, which lands in `ship`. The most cautious case is `stress` at 134, which lands in `watch`.

## Next Improvements

The repository is intentionally scoped to local checks. I would expand it by adding adversarial fixtures before adding features.
