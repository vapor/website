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
kiln serve
```

## Translating

The site is template-driven, so — unlike a prose docs site — there are no per-file
translations. Every piece of visible copy is a `#localise("key")` lookup, and the
translations live in per-language string dictionaries in
`Sources/VaporWebsite/main.swift`. To add a language:

1. **Add a string dictionary.** Copy `englishStrings` to a new `<language>Strings`
   and translate the values (keep the keys). English is the default, so any key
   you leave out falls back to English — partial translations are fine.

   ```swift
   let dutchStrings: [String: String] = [
       "home.hero.title": "Swift, maar dan op een server",
       // … translate the rest; copy the keys from englishStrings
   ]
   ```

2. **Register the language** in the `languages:` array of the `KilnSite`:

   ```swift
   .init(
       .dutch,                       // a built-in LanguageCode, or .custom(code: "xx", name: "…")
       customStrings: dutchStrings,
       image: "static/images/opengraph/vapor-og-nl-2x.png", // per-language social card
       localisation: .init(
           // Kiln's built-in chrome (nav labels, theme/language picker, 404, …);
           // anything unset falls back to English.
           home: "Home"
           // …
       )
   )
   ```

3. **Add the social card.** Drop a `1200×630` PNG (ideally 2×, i.e. `2400×1260`)
   at `Content/static/images/opengraph/vapor-og-<code>-2x.png` and reference it from
   `image:` above. Omit it and the language falls back to the site-wide card.

Build and serve (see above), then open `/<code>/` (e.g. `/nl/`) to check it. The
heavy markup lives in the `Theme/` Leaf templates — they're already wired for
`#localise`, so you only ever edit the dictionaries, never the templates.

> NOTE: The site (and the docs) show a small banner offering visitors their
> preferred language. For a brand-new language to be *proactively suggested*
> there, its locale and native name also need adding to the `LOCALES` map in the
> shared design repo, [vapor/design](https://github.com/vapor/design)
> (`src/js/languageSuggestion.js`). The translation works without this — the banner
> just won't suggest the new language until it's added.

## Deployment

Pushing to `main` triggers [`.github/workflows/deploy.yml`](.github/workflows/deploy.yml),
which builds the site (`docker run … swift:6.2 swift run VaporWebsite`), syncs `./site` to S3,
and invalidates CloudFront. Pull requests get a preview deploy via
[`.github/workflows/pr.yaml`](.github/workflows/pr.yaml).
