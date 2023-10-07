```html
<!DOCTYPE html><!-- Use standard mode, to disable quirks mode for IE and Netscape -->
<html lang="en"> <!-- en-US, fr-CA -->
<head>
  <!-- charset should be first, so that title can use this encoding -->
  <meta charset="utf-8" /> <!-- Default is windows-1252 -->

  <title>Title of page</title>
  
  <!-- Make the width of the content, the same as width of the screen. You can include
  initial-scale=1, user-scalable=1 but these values default to accessible values. -->
  <meta name="viewport" content="width=device-width" />
  
  <!-- Can be in body, but put in head for performance, as you want the browser to know
  how to render the content, to prevent unnecessary repainting if content is loaded first. -->
  <link rel="stylesheet" href="styles.css" />
  <!-- By default browser looks for "favicon.ico" in top-level directory. -->
  <link rel="icon" sizes="16x16 32x32 48x48" type="image/png" href="/images/favicon.png" />
  <link rel="apple-touch-icon" sizes="180x180" href="/images/mlwicon.png" /> <!-- for iOS devices -->
  <link rel="mask-icon" href="/images/mlwicon.svg" color="#226DAA" /> <!-- pinned tabs on macOS -->

  <!-- Link can be used to provide alternate versions of your site -->
  <link rel="alternate" href="https://www.example.com/fr/" hreflang="fr-FR" /> <!-- different translation -->
  <link rel="alternate" type="application/x-pdf" href="https://example.com/site.pdf" /> <!-- pdf version -->
  <link rel="alternate" type="application/rss_xml" href="..." />
  <link rel="alternate stylesheet" title="Basic" href="basic.css" /> <!-- alternate stylesheet that user can select -->
  
  <!-- Define 'content policy' using 'content-security-policy', to specify allowed
  server origins, script endpoints, to help prevent cross-site scripting attacks. -->
  <meta http-equiv="content-security-policy" content="default-src https:" />
  
  <!-- Named meta tags for SEO -->
  <!-- <meta name="keywords"> No longer useful, as search engines ignore it now.-->
  <meta name="description" content="This is displayed under page's title in search results." />
  <!-- Tell search engines to not index site and follow any links (bots can ignore the
  request also) -->
  <meta name="robots" content="noindex, nofollow" /> <!-- "index, follow" is default -->
  <!-- Define color to use for browser interface (title bar, tab bar) -->
  <meta name="theme-color" content="#226DAA" /> <!-- can use media query also -->
  
  <!-- Open graph protocol -->

  
  <!-- If you create multiple translations, then which page to use as the authoritative source
  or use it to link to original source on blogs -->
  <link rel="canonical" href="https://www.example.com" />

  <script src="default.js" defer></script>
</head>
<body>
  
</body>
</html>
```

## <script\>

- Use at the end of the `<body>` to ensure all elements are loaded first.
- Use in the head, with `DOMContentLoaded` event.
- JS is render-blocking, and browser stops downloading all assets when scripts are downloaded and dosen't resume downloading other assets until the JS has finished execution.
- `defer` - HTML rendering is not blocked during the download, and JS executes after the document has finished rendering.
- `async` - HTML rendering is not blocked during the download, but the rendering is paused while the JS is executed.
