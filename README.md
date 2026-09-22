# Data Science (PHDSI)

Jupyter Book 2 site for the **Data Science** course text (probability, statistics, labs) plus interactive notebooks such as PCA.

**Live site (after GitHub Pages is enabled):** https://computationalUncertaintyLab.github.io/nuts_and_bolts/

## Local build (Jupyter Book 2)

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
cd book
jupyter book build --html
# static site is in book/_build/html
npx --yes serve _build/html
```

Preview with the live MyST server:

```bash
cd book
jupyter book start
```

## Regenerating chapters from LaTeX

```bash
./scripts/convert_latex_chapters.sh
```

Source LaTeX lives in `2022S_PHDSI_text/`. Converted MyST markdown is under `book/content/`.

## Deploy

Pushing to `main` runs `.github/workflows/deploy-book.yml`, which builds with Jupyter Book 2.1.x and deploys to GitHub Pages.

In the GitHub repo settings, enable **Pages → GitHub Actions** as the source.
