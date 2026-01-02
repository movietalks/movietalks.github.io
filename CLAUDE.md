# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

МувиТокс (MovieTalks) - a Russian-language movie podcast website built with Hugo static site generator. Hosted on GitHub Pages at movietalks.github.io.

## Build Commands

```bash
make install    # Install dependencies (bun install)
make build      # Build site: clears docs/, runs hugo, then postcss
make preview    # Local preview server on http://localhost:1313
```

## Architecture

- **Hugo static site** with custom layouts (not using a theme)
- **PostCSS pipeline** for CSS processing (autoprefixer, cssnano, postcss-import)
- **Output to `docs/`** which GitHub Pages serves directly from main branch
- **Audio hosted externally** on Yandex Cloud Storage (yandexS3 param in config.yml)

## Content Structure

Episodes are markdown files in `content/episode/` with this frontmatter:

```yaml
layout: episode
title: "#43 Episode Title"
date: 2024-11-15
people:          # Array of host/guest IDs from data/people.yml
  - volyx
  - anabilisa
audio: filename.mp3    # Filename only, prepended with yandexS3 URL
size: 100762853        # File size in bytes
duration: 01:44:58
image: https://...     # Cover image URL
description: Short description
draft: False
```

## Key Files

- `config.yml` - Hugo config with site params (itunes, yandex, feed URLs)
- `data/people.yml` - Host/guest profiles (url, image)
- `layout/index.html` - Homepage with paginated episode list
- `layout/_default/episode.html` - Single episode page template
- `layout/partials/` - Header, footer, meta, script partials
- `layout/rss.xml` - Podcast RSS feed template
