# Vapor Website

This repository contains the code for the Vapor website at [vapor.codes](https://vapor.codes).
The site is built with [Kiln](https://github.com/brokenhandsio/kiln), a static-site generator
written in Swift. Content lives under `Content/`, the custom theme (Leaf templates + assets)
under `Theme/`, and the site config in `Sources/VaporWebsite/main.swift`.

## Building locally

Build the site — the output is written to `./site` (Kiln's default output directory):

```bash
swift run VaporWebsite
```

Then serve it with any static file server, for example:

```bash
python3 -m http.server --directory site
```

## Deployment

Pushing to `main` triggers [`.github/workflows/deploy.yml`](.github/workflows/deploy.yml),
which builds the site (`docker run … swift:6.2 swift run VaporWebsite`), syncs `./site` to S3,
and invalidates CloudFront. Pull requests get a preview deploy via
[`.github/workflows/pr.yaml`](.github/workflows/pr.yaml).
