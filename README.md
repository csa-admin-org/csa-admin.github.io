[![CSA Admin logo](https://csa-admin.org/images/logo-ac7d72c5.png)](https://csa-admin.org)

# csa-admin.github.io

Public site for [CSA Admin](https://csa-admin.org). Three locales, one landing page:

| Locale | Path | Demo registration |
| --- | --- | --- |
| EN | `/` | https://admin.csa-admin.org/demo/new |
| FR (ACP) | `/acp/` | https://admin.acp-admin.ch/demo/new |
| DE (Solawi) | `/solawi/` | https://admin.solawi-admin.org/demo/new |

Middleman 4 + Tailwind v4 + Lucide icons (same set as the app). Copy lives in `locales/{en,fr,de}.yml`. Shared layout in `source/_index.erb`.

## Setup

Ruby version is `.ruby-version`. Then:

```sh
bundle install
```

Tailwind is invoked by Middleman’s `external_pipeline` (`tailwindcss-ruby`). You do not run a separate CSS watcher.

## Preview

```sh
bundle exec middleman server
```

Defaults to [http://localhost:4567](http://localhost:4567). Bind to the LAN if you want another device on the page:

```sh
bundle exec middleman server --bind-address 0.0.0.0
```

Livereload is on. Locale switches in development are host-relative (`/`, `/acp/`, `/solawi/`) so Middleman i18n does not rewrite `/solawi/` back onto the current locale.

## Screenshots

Hero mosaic images live in `source/images/screenshots/` (`{en,fr,de}-{dashboard,member,memberships}.png`). Recapture them against the local demo admin hosts (puma-dev, not `localhost:3000`):

```sh
bin/screenshots
```

Needs `agent-browser`, the CSA Admin repo next to this one (or `CSA_ADMIN_ROOT`), and `AUTO_SIGN_IN_ADMIN_EMAIL` on:

| Locale | Admin |
| --- | --- |
| FR | `https://admin.acp-admin.test` |
| EN | `https://admin.csa-admin.test` |
| DE | `https://admin.solawi-admin.test` |

Each shot is 1440×900 at 2×. Dashboard uses `?welcome=false` so the demo welcome pane stays out of the mosaic.

## Build and publish

```sh
bundle exec middleman build
```

Writes `build/` (gitignored). Production adds asset hashes, gzip, directory indexes, and robots/sitemap.

Pushes to `main` deploy via `.github/workflows/deploy.yml` (GitHub Pages + IndexNow ping for `/`, `/acp/`, `/solawi/`). Preview on a feature branch; merge when you want it live.
