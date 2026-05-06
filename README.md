# onyx-model-sample-dock

`onyx-model-sample-dock` treats ml utilities as a local verification problem. The Haskell implementation is intentionally narrow, but the fixtures and notes make the behavior explicit.

## Onyx Model Sample Dock Checkpoints

Treat the compact fixture as the contract and the extended examples as a scratchpad. The code should stay boring enough that a change in behavior is obvious from the test output.

## What This Is For

The repository exists to keep a technical idea small enough to reason about. The implementation avoids external dependencies where possible, then uses fixtures to make changes easy to review.

## Useful Pieces

- Models feature signals with deterministic scoring and explicit review decisions.
- Uses fixture data to keep metric checks changes visible in code review.
- Includes extended examples for windowed behavior, including `surge` and `degraded`.
- Documents explainable outputs tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.

## Architecture Notes

The design is intentionally direct: parse or construct a signal, score it, classify it, and verify the expected branch. This makes the repository useful for studying ml utilities behavior without needing a service or database unless the language project itself is SQL. The Haskell code keeps the pure scoring function isolated so tests can check it without setup.

## Project Layout

- `src`: primary implementation
- `tests`: verification harness
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands

## Tooling

Use a normal shell with Haskell available on `PATH`. The verifier is written as a PowerShell script because the portfolio was assembled on Windows.

## Local Workflow

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.

## Quality Gate

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Case Study

`baseline` is the first example I would inspect because it lands on the `review` path with a score of 118. The broader file also keeps `degraded` at 12 and `surge` at 259, which gives the model a useful low-to-high spread.

## Scope

The scoring model is simple by design. More domain-specific behavior should be added through explicit adapters or extra fixture classes rather than hidden constants.

## Expansion Ideas

- Add a loader for `examples/extended_cases.csv` and promote selected cases into the language test suite.
- Add a short report command that prints the score breakdown for a single scenario.
- Add malformed input fixtures so the failure path is as visible as the happy path.
- Add one more ml utilities fixture that focuses on a malformed or borderline input.
