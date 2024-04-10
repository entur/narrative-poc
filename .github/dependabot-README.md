# Dependabot
## How you can enable Dependabot
Enable from settings take what you like from our example. An example using groups and jfrom registry is found in the getting-started-java fork.
Example: https://github.com/entur/getting-started-java

## How you can transition from Renovate
Renovate does not conflict with Dependabot, you can remove renovate configuration before and after adding the Dependabot configuration.
We recommend moving to Dependabot when you migrate. You will still be able to use Renovate, but we will no longer help with Renovate issues.

## How to configure notifications
Mail notification setting will be up to the individual teams.

## How to debug dependabot
You can debug Dependabot with [CLI](https://github.com/dependabot/cli) or [dry-run](https://github.com/dependabot/dependabot-core/blob/main/README.md#dry-run-script).

## How to manage PRs
[Managing pull requests for dependency updates](https://docs.github.com/en/code-security/dependabot/working-with-dependabot/managing-pull-requests-for-dependency-updates)

## Default labels
Labels can be used in Github Search and as condition in Github Actions for instance.
Custom labels must already exist in the repository for Dependabot to label the PR. We recommend using default and not custom labels.

## Using Github Actions
[Automating Dependabot with GitHub Actions](https://docs.github.com/en/code-security/dependabot/working-with-dependabot/automating-dependabot-with-github-actions)

Don’t use pull_request_target for auto-merge of PR. [Keeping your GitHub Actions and workflows secure Part 1: Preventing pwn requests ](https://securitylab.github.com/research/github-actions-preventing-pwn-requests/)

Be careful with sensitive input types. [Keeping your GitHub Actions and workflows secure Part 2: Untrusted input](https://securitylab.github.com/research/github-actions-untrusted-input/)

Dont use auto-merge for Github Actions. [Keeping your GitHub Actions and workflows secure Part 3: How to trust your building blocks ](https://securitylab.github.com/research/github-actions-building-blocks/)