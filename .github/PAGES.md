# Course site publishing

The repository-root `index.html` is the course homepage. `.github/workflows/pages.yml` publishes it and student resources automatically after a push to `main`. You can also run **Publish course site** manually from GitHub Actions.

## One-time setup

The workflow and homepage must be committed and pushed to the main repository. The repository must support GitHub Pages on its current plan, and the workflow must be able to read every student submodule. Public submodules work with the normal workflow token; private submodules require separate checkout credentials.

Authenticate GitHub CLI with a repository administrator account:

```sh
gh auth login
```

For a repository without Pages enabled:

```sh
gh api --method POST repos/jhudshcg/L1-Digital-Pathway-Units/pages -f build_type=workflow
```

If Pages is already enabled, use `--method PUT` instead of `POST` to change its publishing source to Actions. These are one-time setup commands; the workflow handles subsequent deployments.

After the first successful deployment, the site URL is shown in the deployment job. The expected project URL is:

https://jhudshcg.github.io/L1-Digital-Pathway-Units/

## Updating the site

1. Commit and push resource changes inside the relevant student submodule.
2. Commit the updated submodule reference in the main repository, together with any homepage or workflow changes.
3. Push the main repository to `main`. The workflow publishes those exact committed versions.

A push to a student submodule alone does not update the course site. Uncommitted local changes are not deployed. Commits remain the teacher's responsibility.

## Published files

The workflow copies `index.html` and each registered student submodule's `guides`, `examples`, `template` and `templates` folders, plus its README if present, into a temporary `_site` folder. Paths are preserved so existing relative links work. It checks that every local homepage link has a destination before deploying.

Teacher specifications, unit `src` folders, reference templates, practice documents, student `project` working folders and repository build instructions are excluded. The workflow does not regenerate DOCX files. Only put student-facing resources in the included folders.

The Imaging guide is not available yet. When it is added, register its student submodule and update the homepage link. Guide wording and navigation for hosted use, and teacher screenshot additions, are separate follow-up work.
