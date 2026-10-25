# forkpipe

Static site for forkpipe.com. Plain HTML, CSS and a little JS. No build step, no tracking, no cookies.

## Preview locally

    python3 -m http.server 8000

Open http://localhost:8000.

## Deploy (Cloudflare Pages)

1. Push this repo to GitHub.
2. In Cloudflare Pages, create a project from the repo. Framework preset: none. Build command: empty. Output directory: `/`.
3. Add the custom domain `forkpipe.com`, and set a redirect from `www.forkpipe.com` to the apex.
4. `_headers` applies the security headers and CSP automatically.

## Deploy (GitHub Pages alternative)

1. Push to GitHub. In Settings > Pages, set source to the main branch, folder `/ (root)`.
2. `CNAME` already contains `forkpipe.com`. At your DNS provider add four A records for the apex (185.199.108.153, 185.199.109.153, 185.199.110.153, 185.199.111.153) and a `www` CNAME to `<your-username>.github.io`.
3. Once DNS resolves, tick "Enforce HTTPS".

Notes: GitHub Pages ignores `_headers`, so the CSP and security headers do not apply there. Use the custom domain; at `username.github.io/forkpipe/` the root paths like `/assets/...` would break.

## Edit copy

Edit the HTML files directly (`index.html`, `about/`, `event-followup/`, `privacy/`, `terms/`). Colors and spacing are CSS variables at the top of `assets/css/style.css`. Run `scripts/check.sh` before every deploy. It fails on banned words, em dashes and placeholders.

## Show the event banner

In `index.html`, fill the `#event-banner` div with approved dates and remove its `hidden` attribute.

## Add proof later

Put approved, real proof inside `<div class="proof" id="proof">` in `index.html`. It renders nothing while empty. Add it to the claims table in `BUILD_LOG.md`.

See `BUILD_LOG.md` for open items and the claims audit.