# GitHub Pages Deployment Workflow

## Overview

This project demonstrates Continuous Integration (CI) and Continuous Deployment (CD) using GitHub Actions.

Whenever the `index.html` file is updated and pushed to the `main` branch, GitHub Actions automatically deploys the website to GitHub Pages.

## Features

* Automatic deployment with GitHub Actions
* Hosted on GitHub Pages
* Deploys only when `index.html` changes
* No manual deployment steps required

## Project URl
https://roadmap.sh/projects/github-actions-deployment-workflow

## Project Structure

```text
gh-deployment-workflow/
│
├── index.html
├── README.md
│
└── .github/
    └── workflows/
        └── deploy.yml
```

## How It Works

The workflow is triggered when:

* A push is made to the `main` branch
* The push includes changes to `index.html`

Workflow steps:

1. Check out the repository
2. Configure GitHub Pages
3. Upload website files as an artifact
4. Deploy the site to GitHub Pages

## Setup Instructions

### 1. Create Repository

Create a GitHub repository named:

```text
gh-deployment-workflow
```

### 2. Add Files

Add:

* `index.html`
* `README.md`
* `.github/workflows/deploy.yml`

### 3. Push to GitHub

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/<username>/gh-deployment-workflow.git
git push -u origin main
```

### 4. Enable GitHub Pages

Go to:

Settings → Pages

Under Source:

* Select "GitHub Actions"

### 5. Verify Deployment

After the workflow completes successfully, the website will be available at:

```text
https://<username>.github.io/gh-deployment-workflow/
```

## Example

If you modify:

```html
<h1>Hello, GitHub Actions!</h1>
```

to

```html
<h1>Hello, CI/CD World!</h1>
```

and push the change:

```bash
git add .
git commit -m "Update homepage"
git push
```

GitHub Actions automatically redeploys the website.

## CI/CD Concepts Demonstrated

### Continuous Integration (CI)

Every code change pushed to the repository triggers an automated workflow.

### Continuous Deployment (CD)

Successful workflow execution automatically deploys the website without manual intervention.

## Stretch Goal Ideas

* Create a personal portfolio website
* Use Jekyll for blog generation
* Use Hugo for a static site
* Use Astro for a modern frontend
* Add custom domain support
* Add automated tests before deployment
* Add HTML validation checks

## Technologies Used

* HTML
* GitHub Actions
* GitHub Pages
* YAML

## Author

Created as part of a DevOps and GitHub Actions learning project.
