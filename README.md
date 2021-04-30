# changed-in-duration

This GitHub action can be used to check if there have been any changes in code in last day or any other duration.

## How it works

- Prior to this, code has been cloned and checked out to a specific tag/branch using `actions/checkout`.
- It checks the latest commit on HEAD and gets the time value from there as `latest`.
- It then calculates the time against which we want to check. This is calculated using `against = current_time - duration`. See examples for how to pass this duration.
- If `against < latest`, then status is set to true, otherwise false.
- It sets this status as `changed` output value, usable in your workflow.

## Examples

To use this action in your project, use the following:

```yaml
- name: Changed in duration
  id: changed-in-duration
  uses: vikramtiwari/changed-in-duration@main
```

The Action sets an output variable called `changed` which can be used in a following step by using `${{ steps.changed-in-duration.outputs.changed}}`.

By default it checks for new commits in last 24 hours. You can customize this to pass any other duration.

```yaml
- name: Changed in duration
  id: changed-in-duration
  uses: vikramtiwari/changed-in-duration@main
  with:
    duration: 3600 # 1 hour
```
