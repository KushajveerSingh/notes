---
title: MkDocs
---

- Install `pip install mkdocs`.
- Create new project `mkdocs new my-project`.
- Configure using `my-project/mkdocs.yml`.
- Put documentation in `my-project/docs` folder as `.md` files.
- Start development server using `mkdocs serve` or `mkdocs serve --dev-addr=0.0.0.0:8000` at `http://127.0.0.1:8000`.
- Put custom favicon in `my-project/docs/img/favicon.ico` to use custom favicon.
- Put CNAME file in `my-project/docs/CNAME`.
- Build the site using `mkdocs build`, which creates `my-project/site` directory.

## Customize the theme

### Using .css/.js files
This is for simple updates, that can be put in `.css`, `.js` files. Create the `.css`/`.js` files in the `docs` directory and include them in `mkdocs.yml` as
```yaml
extra_css:
  - style.css

extra_js:
  - default.js
```

Both the CSS/JS would be added to the generated HTML document after the page content.

### Override theme files
Create a directory outside `docs` (say `overrides`), and add it to `mkdocs.yml`
```yaml
theme:
  custom_dir: 'overrides'
```

In `overrides` directory
- If file name is same as the one provided by the theme, the file would get replaced.
- If the file is new, it would get added to the theme.

## mkdocs config file
```yaml
site_name: string # Title of project
site_url: https://... # Set the canonical URL i.e. base path

repo_name: 'KushajveerSingh/notes' # provide the host name
repo_url: https://github... # GitHub url
edit_uri: blob/main/docs # path from base `repo_url` to the docs directory and it is used
                         # to view/edit the source page from the website

site_description: string # To add meta tag
site_author: string # To add meta tag
copyright: string # Copyright info used by the theme

remote_branch: gh-pages # When using `gh-deploy` action to deploy to GitHub pages, which
                        # branch to deploy the documentation
remote_name: origin # remote name to push to when using `gh-deploy`

# Specify the navbar to the side (with prev/next functionality)
# Default order is alpanumerical, with index.md files appearing first
nav:
  - Introduction: 'index.md'
  - 'about.md'
  - 'Issue Tracker': 'https://example.com'

# Specify pattern for files not to be included in the build site (like .gitignore)
exclude_docs: |
  .*
  /templates/

# To exclude files from navbar (i.e. hidden files)
not_in_nav: |
  /private.md

# Set the theme and theme specific configuration
theme:
  name: mkdocs
  locale: en

docs_dir: docs
site_dir: site # Where the build files are created

extra_css:
  - ...

extra_js:
  - plain.js # <script src="plain.js"></script>
  - path: plain.js # <script src="plain.js" defer></script>
    defer: true
  - path: plain.js # <script src="plain.js" async></script>
    async: true

watch: # Files to watch for changes in 'mkdocs serve'
 - docs
 - mkdocs.yml
use_directory_urls: true # index.md maps to '/', if false it would map to '/index.html'
strict: false # Set to true, to halt build process on warnings
dev_addr: '127.0.0.0:8000' # Address of 'mkdocs server'

markdown_extensions:
  - name:
      extension_config: option

# Mkdocs add 'search' plugin as default which uses "lunr.js" as the search engine
plugins:
  - search:
      separator: '[\s\-]+' # Use whitespace and hyphen as word separators
      min_search_length: 3 # Minimum length of search query in characters
      lang: theme.locale
      prebuild_index: false # Set to true, to generate a pre-built index of all pages
                            # at build time, to improve performance on larger sites
      indexing: 'full' # reduce the scope to 'sections', 'titles' for larger sites to
                       # reduce the size of index file
```

### Use env variables
You can set the values in `mkdocs.yml` using environment variables also.
```yaml
site_name: !ENV SITE_NAME
site_name: !ENV [SITE_NAME, FALLBACK_ENV, 'Fallback value']
```

### Define parent config file
If you have multiple projects, then defining a parent config file can be useful. For this, define the parent `base.yml` file, and then include it in your current `mkdocs.yml` file
```yaml
INHERIT: ../base.yml
site_name: ...
```

## Command line
### mkdocs
- `-V` - show version
- `-q` - silence warnings
- `-v` - enable verbose output

### mkdocs build
- `-c` - remove old files from site_die before building (default true)
- `-f` - path to `mkdocs.yml` file
- `-s` - enable strict mode, to abort build on warnings
- `-q` - silence warnings
- `-v` - enable verbose output

### mkdocs get-deps
Show required PyPI packages inferred from plugins in mkdocs.yml.

### mkdocs gh-deploy
Deploy documentation to github pages

- `-c` - remove old files from site_dir before building
- `-m` - commit message
- `--no-history` - replace the whole git history with one new commit

## Build custom plugins