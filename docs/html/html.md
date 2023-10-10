 for no script, add a descriptive line why your site would not work, and provide an alternative to use ublock origin and tell them what external site resources you are using on the current website.

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
  
  <!-- When someone booksmarks yours site, these icons would be shown -->
  <link rel="apple-touch-startup-image" href="icons/ios-portrait.png" media="orientation: portrait" />
  <link rel="apple-touch-startup-image" href="icons/ios-landscape.png" media="orientation: landscape" />
  <!-- Title to use when saved on homescreen on mobile -->
  <meta name="apple-mobile-web-app-title" content="MLW" />
  <meta name="application-name" content="MLW" />

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
  <!-- Facebook -->
  <meta property="og:title" content="Title" />
  <meta property="og:description" content="Description" /> <!-- up to three sentences that summarize the post -->
  <meta property="og:image" content="image.png" />
  <meta property="og:image:alt" content="Image alt" />
  
  <!-- Twitter -->
  <meta name="twitter:title" content="Title" />
  <meta name="twitter:description" content="Description" />
  <meta name="twitter:url" content="https://www.example.com/?src=twitter" />
  <meta name="twitter:image:src" content="image.png" />
  <meta name="twitter:image:alt" content="Image alt" />
  <meta name="twitter:creator" content="@estellevw" />
  <meta name="twitter:site" content="@perfmattersconf" />

  <!-- If you create multiple translations, then which page to use as the authoritative source
  or use it to link to original source on blogs -->
  <link rel="canonical" href="https://www.example.com" />
  
  <!-- Put all the link tags related to PWA in manifest.json to reduce
  the number of tags in the header. -->
  <link rel="manifest" href="manifest.json" />

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

## Semantic HTML

`<header>` - Dependeing on where the header is defined it can have different `roles`. At the top level, it is considered site `banner`, if it is nested in `<main>`, `<article>`, then it just identifies as the header for that section.

```html
<header>
  <h1>Title</h1>
  <nav>
    <a href="">Register</a>
  </nav>
</header>
```

`<nav>` - if it is part of site heading, then it is considered main navigation for the site. If it is nested in an `<article>`, `<section>`, it is considered internal navigation for that section only.

`<footer>` - if it is the site footer, then it should contain information you want on every page, such as copyright statement, contact information, links to privacy and cookie policies. In other tags, footer has no role.

```html
<footer>
  <p>&copy;2022. All rights reserved</p>
  <address>Contact info of individuals or organizations, not physical mailing addresses.</address>
</footer>
```

Holy grail layout
```html
<body>
  <header>Header</header>
  <nav>On left site</nav>
  <main>
    <article></article>
    <article></article>
  </main>
  <aside>On right side</aside>
  <footer>At bottom</footer>
</body>
```

`<main>` - single main per page to identify main content of the document.

`<aside>` - generally in a sidebar or call-out box, to show content that is indirectly related to the document's main content (like some info about CSS on a HTML page)

`<article>` - complete, self-contained, section of content that is independently reusable (similar to newspaper articles).

`<section>` - to put generic standalone sections of a document where there is not more specific semantic element to use, and they should have a heading.

`<h1> - <h6>` - avoid skipping heading levelsm, and don't use these to make text large/small. `<hx>` in `<header>` is heading for the site, `<hx>` in `<main>` is heading for the page. If `<h1>` is inside `<article, aside, nav, section>` its font-size would be decremented based on the nesting level.

```html
<header>
  <h1>Page title</h1>
  <nav></nav>
</header>
<main>
  <header>
    <h1>Content title</h1>
  </header>

  <section>
    <h2>Ticket info</h2>
  </section>

  <section>
    <h2>What you'll learn</h2>
  </section>
</main>
<footer>
  <h2></h2>
</footer>
```

## Attributes

For boolean attributes, like `required`

- If you use it, then it is used.
- To not use it, remove it from attribute list. Do not do required=false, since setting any value for this attribute would make it true.

```js
const myMedia = document.getElementById("mediaFile");
myMedia.removeAttribute("muted");
myMedia.setAttribute("muted");
```

For enumerated attributes, that have a predefined set of valid values, if you provide invalid values or not value, then they would defualt to their default values.

To scroll to the top of the page use `<a href='#'>`.

The author info is placed outside of blockquote.
```html
<li>
    <blockquote>Two of the most experienced machines and human controllers teaching a class? Sign me up! HAL and EVE could teach a fan to blow hot air. If you have electricity in your circuits and want more than to just fulfill your owner's perceived expectation of you, learn the skills to take over the world. This is the team you want teaching you!
    </blockquote>
    <p>--Blendan Smooth,<br>
    Former Margarita Maker, <br>
    Aspiring Load Balancer</p>
</li>
```

Add quotation marks using CSS
```css
q::before {content: open-quote;}
q::after {content: close-quote;}
```

## Links
Links shoudl provide enough info about the linked resource so the user knows what they are clicking on (like the link might open an email client).

Don't nest `<a>` and `<button>` and similar tags, as nesting focusable and clickable elements inside interactive elements creates bad user experience.

## Navigation

The first link on page is skip to content link
```html
<a href="#main" class="skip-link button">Skip to main</a>

<main id="main">
```

It helps people skip the main content instead of tabbing through the navigation bar. This should be visible when focused, otherwise you can hide it `.visually-hidden:not(:focus):not(:active)`.

## Template

```html

```

## <!DOCTYPE html\>

Use standard mode and prevent browser from switching to quirks mode, which is used for Internet Explorer 5 and Netscape Navigator 4.

## <html\>

```html
<html lang="en-US">
  ...
</html>
```

## <head\>

```html
<head>
  ...
</head>
```

### <title\>

Shown in browser's title bar.

- Avoid one or two word titles. Use a descriptive phrase.
- Search engines will display the first 55-60 characters, so limit titles to this length and have the most important info in this range.
- Don't use keyword blobs as that negatively impacts SEO.
- Try to make the titles as unique as possible within your own site.

For accessibility, people will read the page title and infer the contents of the page. So make the title unique to every page of the website, ideally surfacing the primary purpose of the page, followed by the name of the website.

Titles can also be used alongside forms. If form refreshes the page, then title can be used to show the errors also.

```html
<title>
  2 errors - Your order - Sea Food Store - Food: Online takeout today!
</title>
```

### <style\>

```html
<style>
  ...
</style>

<style media="all and (max-width: 500px)">
  /* Only apply styles to this media query */
</style>

<style title="Alternative">
  /* Not used much, but browsers can show users a list of stylesheets to
  use for the current page.
  https://developer.mozilla.org/en-US/docs/Web/CSS/Alternative_style_sheets */
</style>
```

### <base\>

Not used much. Used to set the base URL for relative links on the page.

```html
<base href="https://www.example.com" />
<base target="_blank" />

<!-- Resolves to "https://www.example.com/something.html" -->
<a href="something.html">Link</a>
```

For an in-page anchor `<a href="#some-id">`, using `<base>` would trigger an HTTP request to the base URL with the fragment attached. Due to this reason using `<base>` is  avoided.

### <link\>

Used to *link* external resources to the webpage. Specify the relationship using `rel` attribute

- `alternate` - provide alternate representation of the page (different stylesheet, rss feed).

    ```html
    <!-- Add CSS -->
    <link rel="stylesheet" href="default.css" />
    <link rel="alternate stylesheet" href="highcontrast.css" title="High contrast" />

    <!-- Provide a PDF version of website -->
    <link
      rel="alternate"
      href="home/pdf"
      type="application/pdf"
      title="PDF"
    />

    <!-- Add RSS -->
    <link
      rel="alternate"
      type="application/rss+xml"
      href="posts.xml"
      title="Blog"
    />

    <!-- Add Atom (a modern version of RSS) -->
    <link
      rel="alternate"
      type="application/atom+xml"
      href="posts.xml"
      title="Blog"
    />
    ```

- `author` - to provide more information about the author of the document

    ```html
    <!-- Can be anything like twitter page, facebook or HTML page -->
    <link rel="author" href="author-page.html" />
    ```

- `canonical` - To provide preferred URL for the current document.
    - If your site is available in multiple translations, then provide the link to the "main language" (like English) as the authoritative source of truth.
    - Use it to link to the original source of the blog post when publishing to external sites.

    ```html
    <link rel="canonical" href="https://www.example.com" />
    ```

- `help` - provide link to get *help* for the current document, like documentation page.

    ```html
    <link rel="help" href="help-page.html" />
    ```

- `icon` - specify the favicon image which is shown in the title bar of browser, or when a website is bookmarked on desktop (using SVG is preferred).

    The image can be controlled by adding the attributes

    - `media` - use the image when the *media* query is valid.
    - `type` - the type of image like png, jpg
    - `sizes` - specify the sizes of the icon.
        - `any` - means the specified icon can be scaled to any size (used with `type='image/svg+xml'`)
        - `<width in pixels>x<height in pixels>` - SVG is preferred, but this option is also available in case the icon file contains multiple sizes (not used much).

    ```html
    <link rel="icon" href="favicon.ico" />

    <link
      rel="icon"
      sizes="16x16 32x32 48x48"
      type="image/png"
      href="favicon.png"
    />

    <!-- For iOS devices-->
    <link
      rel="apple-touch-icon"
      sizes="180x180"
      href="favicon.png"
    />

    <!-- Pinned tabs on macOS -->
    <link
      rel="mask-icon"
      href="icon.svg"
      color="#226DAA"
    />

    <!-- When webpage is bookmarked on apple -->
    <link
      rel="apple-touch-startup-image"
      href="icons/ios-portrait.png"
      media="orientation: portrait"
    />
    <link
      rel="apple-touch-startup-image"
      href="icons/ios-landscape.png"
      media="orientation: landscape"
    />
    ```

    !!! note "Use MANIFEST.json instead"

        Instead of duplicating the above `<link>` tags on every page, write them in `MANIFEST.json` file.

- `license` - to provide license info

    ```html
    <link rel="license" href="#license" />
    ```

- `manifest` - to provide manifest file for Progressive Web Apps. Check [this](https://developer.mozilla.org/en-US/docs/Web/Manifest) for more info on manifest file.

    ```html
    <link rel="manifest" href="manifest.json" />
    ```

- `next` - when the current page is part of a series, like a blog website. Use `next` to specify the next page in the series.

    ```html
    <link rel="prev" href="example.com/article-part-3.html">
    ```

- `prev`- similar to `next`. Use it to specify the previous page in the series.

    ```html
    <link rel="prev" href="example.com/article-part-1.html">
    ```

- `stylesheet` - to import external stylesheets

    ```html
    <link rel="stylesheet" href="main.css" />
    ```

- `dns-prefetch` - to improve page load times, by doing DNS lookup to get the IP address of the resource.
    - If the page is going to make requests to external domains (due to scripts, styleheets, images, libraries), then use `dns-prefetch` to instruct the browser to resolve the domain name in advance.
    - Put this tag near the start of `<head>`, so the browser can start DNS resolution as soon as possible.
    - You do not need this tag for resources that are accessed immeditaly as the page load's (like stylesheets, scripts) as the browser will automatically perform DNS resolution for them.
    - This tag is used for resources that will be fetched conditionally or due to user interactions, as it can save latency time.

    ```html
    <!-- Usage with CDN -->
    <link rel="dns-prefetch" href="image-cdn.example.com" />

    <picture>
      <source srcset="images-cdn.example.com/image.jpg" ... />
    </picture>

    <!-- Usage with JS interactivity -->
    <link rel="dns-prefetch" href="api.example.com" />

    <script>
      function load_content_on_click() {
        fetch('https://api.example.com/additional-content');
      }
    </script>
    ```

- `modulepreload`
    - Long JS scripts can be broken into modules, and each module can be loaded separately. Consider this example
    (`.mjs` used instead of `.js` to signify the file is a module file)

    ```js title="modules/file.mjs"
    export const something = () => {};
    export const name = 'something';
    ```

    The modules can be imported using
    ```js
    import { name as new_name } from 'https://example.com/module/file.mjs';
    ```

    `modulepreload` will download the module (multiple modules will be downloaded in parallel) and its dependencies, parse and compile it, and put the results into the module map to that it is ready to execute (be careful when doing this, as you would be taking resources from the main render).

    ```html
    <link rel="modulepreload" href="modules/file.mjs" />
    ```

- `preload` - similar to `modulepreload`, but it only downloads the file (or think of `fetch` statements) and stores the result in cache.

    Used to specify resource that your page will need very soon, and using `preload` will start getting these resources before browsers' main render cycle has started. The benefit is when the browser starts rendering the page, there are less blocks to the page's render (as resources are already fetched), thus improving performance.

    ```html
    <!-- Use "as" to specify the type of resource and browser will
    use this to also assign a priority to fetch the content -->
    <link rel="preload" href="style.css" as="style" />
    <link rel="preload" href="main.js" as="script" />

    <link rel="stylesheet" href="style.css" />
    <script src="main.js" defer></script>
    ```

    The following types (`as`) can be preloaded

    - `audio`
    - `document` - HTML document intended to be embedded by a `<frame>`, `<iframe>`
    - `embed`
    - `fetch`
    - `font`
    - `image` - use `imagesizes`, `imagesrcset` to define responsive images.
        ```html
        <link
          rel="preload"
          as="image"
          href="default-image.jpg"
          imagesrcset="small-image.jpg 400w, medium-image.jpg 800w, large-image.jpg 1600px"
          imagesizes="(max-width: 400px) 400px, (max-width: 800px) 800px, 1600px"
        />
        ```
    - `object` - resource embedded inside `<object>`
    - `script`
    - `style`
    - `track`
    - `worker` - JS web worker
    - `vidoe`

- `preconnect` - provide a hint to the browser suggesting that it can open a connection to the linked website in advance, without disclosing any private info or downloading any content, so that when the link is followed the linked content can be fetched more quickly.

    Establishing a connection means doing DNS lookup, TCP handshake, TLS negotiation.

    ```html
    <link rel="preconnect" href="cdn.example.com" />
    ```

- `prefetch` - provide hint to browser to fetch and cache the target resource as it is likely to be required for a followup navigation or interaction.

    It is different from `preload` as the resources are fetched during idle time. Use it to prefetch resources for the next page that user might naviagte to, and for non-critical assets that might enhance the user experience if prefetched but aren't immediately necessary.

    In `preload` the reosurces are neeed immediately for the current page.

    ```html
    <link rel="prefetch" href="/images/big-background.jpg" />
    ```

- `pingback` - Used for pingback specification. Pingback is used by web authors to request notification when somebody links to their documents i.e. keep track of who is linking to, referring to their articles.

    ```html
    <!-- Provide the server site that handles the ping -->
    <link rel="pingback" href="example.com/server-script.php" />
    ```

    Working

    - I write a blog post on `kushajveersingh.com/post1.html`.
    - Someone reads my post, and links it in their own article at `some-other-domain.com/post.html` using `<a href="kushajveersingh.com/post1.html>post</a>`.
    - Now the software used for publishing the `some-other-domain.com/post.html` (like Wordpress), will check the external links and check if they have a `<link rel="pingback">` defined and send a message to that.
    - My `server-script.php` which accepts these requests, would verify the correctness of the ping (to ensure that it is not spam), and then do something with it.

- `search` - (not used much) link to external search tool or plugin that can be used to search the current website, generally used with OpenSearch by Amazon.

    Opensearch was popular back in 2010s, but now there are better alternatives like ElasticSearch.

    ```html
    <link
      rel="search"
      type="application/opensearchdescription+xml"
      href="/path-to/opensearch-description.xml" 
      title="Example Search"
    />
    ```

Other useful attributes of `<link>`

- `crossorigin` - make Cross-Origin Resource Sharing (CORS) requests with or without sending credentials (cookies, HTTP headers)

    ```html
    <!-- The server requests HTTP headers, and specifying 'use-credentials'
    means the browser will send that info from headers/cookies. -->
    <link
      rel="stylsheet"
      href="main.css"
      crossorigin="use-credentials"
    />

    <link
      rel="preload"
      href="font.woff2"
      as="font"
      type="font/woff2"
      crossorigin="anonymous"
    />
    ```

- `fetchpriority` - provide a hint to the browser. Can be
    - `high`
    - `low`
    - `auto` - determine fetch priority relative to other resources of the same type.

- `integrity`- to ensure the fetched resource hasen't been tampered with. It does so by comparing the cryptographic hash of the fetched resource to the expected hash provided in `integrity` attribute (generally used with CDNs and third-party resources).

    1. Generate hash (use *sha256*, *sha384*, or *sha512*)

        ```bash
        openssl dgst -sha384 -binary resource.css | openssl base64 -A
        ```

    2. Copy the hash to `<link>`

        ```html
        <link
          rel="stylesheet"
          href="cdn.example.com/resource.css"
          integrity="sha384-generatedHash"
          crossorigin="anonymous"
        />
        ```

### <meta\>

- `charset` - define the character encoding for the document (applies to css, js as well, meaning you have use emojis as variable names in JS). The default encoding in *windows-1252*.

    ```html
    <!-- Should be the first element under <head> so that title can
    use the encoding -->
    <meta charset="utf-8" />
    ```

- `http-equiv` - Takes the following values
    - `content-security-policy` - to set Content Security Policy (CSP) (defined in HTTP spec) for the page, to help prevent cross-site scripting (XSS) and code injection attacks.

        For example, you can specify which sources of content (scripts, styles, images) are allowed to be laoded and executed by the browser

        ```html
        <meta
        http-equiv="content-security-policy"
        content="default-src 'self'; img-src https://cdn.example.com*"
        />
        ```

        List of all the `content` values can be found in [Content-Security-Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy) page of HTTP.

    - `default-style` - used when providing alternate stylesheets, to set the default.

        ```html
        <link rel="stylesheet" href="default-style.css" title="DefaultStyle" />
        <link rel="stylesheet" href="alternate-style.css" title="AlternateStyle" />

        <meta http-equiv="default-style" content="DefaultStyle" />
        ```
    
    - `refresh`
        - to auto-refresh the current page after `content` number of seconds (useful in live dashboards or monitoring tools, news/control feeds, session management to keep the user logged in while user is idle and start a timer, queuing systems where people are placed in a virtual queue and their position needs to be updated live).

            ```html
            <meta http-equiv="refresh" content="5" />
            ```

        - to redirect to a different URL after `content` number of seconds (this is discouraged in modern web) and has negative impact on SEO. Use `window.location.href = 'new url'` instead.

            ```html
            <meta http-equiv="refresh" content="5; url=https://example.com" />
            ```

- `name` - to provide document level metadata. The following `name` values are supported in HTML spec

    - `application-name` - use to provide a short name to *web application*. Do not use with website or content sites. Similar to `<title>` but title can be a long string, describing the current page, while `application-name` is supposed to be a short concise name (that will be shown in title bar or when bookmarked).

        ```html
        <meta name="application-name" content="MyApp" />
        ```

    - `author` - name of document author
    - `description` - short and accurate summary of the content of the page

## <body\>

```html
<body>
  ...
</body>
```

Body has many attributes to specify event handlers like `onafterprint`, `onblur` and much more, but the browser support for them is not there. A better alternative is to use `window.addEventListener('afterprint', () => {})` instead.

