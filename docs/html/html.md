To scroll to the top of the page use `<a href='#'>`.

 for no script, add a descriptive line why your site would not work, and provide an alternative to use ublock origin and tell them what external site resources you are using on the current website.

The first link on page is skip to content link
```html
<a href="#main" class="skip-link button">Skip to main</a>

<main id="main">
```

It helps people skip the main content instead of tabbing through the navigation bar. This should be visible when focused, otherwise you can hide it `.visually-hidden:not(:focus):not(:active)`.


## Attributes

For boolean attributes, like `required`

- If you use it, then it is used.
- To not use it, remove it from attribute list. Do not do required=false, since setting any value for this attribute would make it true.

```js
const myMedia = document.getElementById("mediaFile");
myMedia.removeAttribute("muted");
myMedia.setAttribute("muted");
```

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
      type="application/pdf## Attributes"
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

    <!-- Title to use when saved on homescreen on mobile -->
    <meta name="apple-mobile-web-app-title" content="Title" />
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
    <link rel="next" href="example.com/article-part-3.html" />
    ```

- `prev` - similar to `next`. Use it to specify the previous page in the series.

    ```html
    <link rel="prev" href="example.com/article-part-1.html" />
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
    - `content-security-policy` - to set Content Security Policy (CSP) (defined in HTTP spec) for the page, to help prevent cross-site scripting (XSS) and data injection attacks.

        Three type of XSS attacks

        1. Stored XSS - a user can add malicious script on the target server (e.g. by posting it in the forum, comment section). And when the user visits the affected page, the script runs in their browser.
        2. Reflected XSS - attacker crafts a URL containing malicious script input. The victim clicks on the URL, and the malicious code is sent to the server, and the server reflects the input back in the page content (e.g. in an error message or search result) and the victim's browser executes the malicious script.
        3. DOM-based XSS - attacker injects a payload directly into the DOM. For example if you have JS to read the part of URL after the hash

            ```js
            x.innerHTML = document.location.hash.substring(1);
            ```

            Then the above code can be exploited by using the URL `http://vulnerable-website.com/page#<img src=x onerror=alert('XSS')>`

        For example, you can specify which sources of content (scripts, styles, images) are allowed to be laoded and executed by the browser

        ```html
        <meta
        http-equiv="content-security-policy"
        content="default-src 'self'; img-src https://cdn.example.com*"
        />
        ```

        List of all the `content` values can be found in [Content-Security-Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy) page of HTTP.

        !!! note "Setting HTTP headers is preferred"

            Setting HTTP headers through the backend server is preferred over using `<meta>` tags. Use `<meta>` for cases, when site is being deployed statically.

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

        ```html
        <meta name="author" content="Kushaj" />
        ```

    - `description` - short and accurate summary of the content of the page

        ```html
        <meta name="description" content="Lorem ipsum ..." />
        ```

    - `generator` - if you used a software to generate the current site like Wordpress, Astro

        ```html
        <meta name="generator" content="Astro" />
        ```

    - `keywords` - comman separated list of keywords to describe the page. Do not use now, as browsers ignore this, as people started exploiting the keywords.

        ```html
        <meta name="keywords" content="html,css" />
        ```

    - `referrer` - set it through HTTP header instead. When you click a link to an external site, then your info (i.e. the link from which the user came) would be shared with the external site. To prevent this you can use *referrer*.

        ```html
        <!-- Send no info -->
        <meta name="referrer" content="no-referrer" />

        <!-- (default) Send full URL, except when going from HTTPS to HTTP-->
        <meta name="referrer" content="no-referrer-when-downgrade" />

        <!-- Send origin info like scheme, host, port -->
        <meta name="referrer" content="origin" />

        <!-- For same-origin destination send everything, for cross-origin
        send 'origin' -->
        <meta name="referrer" content="origin-when-cross-origin" />

        <!-- Send full URL (stripped of parameters) for everything -->
        <meta name="referrer" content="unsafe-url" />

        <!-- Send full info, when destination is same origin, otherwise send
        no info -->
        <meta name="referrer" content="same-origin" />

        <!-- Send 'origin' when destination is as secure as host HTTP(S) -> HTTPS -->
        <meta name="referrer" content="strict-origin" />

        <!-- Send full URL when on the same origin, and moving to the same security level
        HTTP(S) -> HTTPS -->
        <meta name="referrer" content="strict-origin-when-cross-origin" />
        ```

    - `theme-color` - To set the color of surrounding user interface like the browser's address bar or toolbar.

        ```html
        <meta
          name="theme-color"
          media="(prefers-color-scheme: light)"
          content="cyan"
        />
        <meta
          name="theme-color"
          media="(prefers-color-scheme: dark)"
          content="black"
        />
        ```

    - `color-scheme` - set the default theme for the page to light/dark

        ```html
        <meta name="theme-color" content="dark" />

        <!-- Tell browser document prefers dark mode but does render in light mode also. -->
        <meta name="theme-color" content="dark light" />

        <meta name="theme-color" content="only light" />
        ```

        And use `(prefers-color-scheme: dark)` to define the styles.

    - `viewport` - give hint to the browser about the intial size of `viewport`.

        - `width` - (pixel value or `device-width`) width of viewport you want the website to be rendered at
        - `height` - (pixel value or `device-height`) (not used by browsers)
        - `initial-scale` - 0.0 to 10.0, to define the ratio between device width (in portrait mode, or height in landscape mode) and the viewport size.
        
        ```html
        <!-- No need of specifying initial-scale, user-scalable as these are set to accessible
        values by default -->
        <meta name="viewport" content="width=device-width" />
        ```
    
    - `robots` - give hint to the search engines to not index site and follow links. The default is to allow indexing and following of links.

        ```html
        <!-- "index, follow" is default -->
        <meta name="robots" content="noindex, nofollow" />
        ```

        The web crawlers will automatically look for `robots.txt` file in the root directory. So you can skip this tag if `robots.txt` file is used.

[OpenGraph](https://ogp.me/) protocol tags can be defined, to control how the pages when posted on Facebook, Twitter

```html
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
```

## <body\>

```html
<body>
  ...
</body>
```

Body has many attributes to specify event handlers like `onafterprint`, `onblur` and much more, but the browser support for them is not there. A better alternative is to use `window.addEventListener('afterprint', () => {})` instead.

## Scripting

### <canvas\>

Used for drawing graphics. It is better to set the width/height in HTML or JavaScript and not CSS. If there is no translucency use `canvas.getContext('2d', { alpha: falkse })` to improve the rendering performance.

### <noscript\>

HTML to be inserted in the page if script type on the page is unsupported or if scripting is currently turned off in the browser.

```html
<noscript>
  <p>This is some HTML</p>
</noscript>
```

### <script\>

- `async` - script is fetched in parallel and evaluated as soon as it is available. Scripts with async do not have a guranteed order of execution.

  This can be usefule to prevent FOUC (Flash of Unstyuled Content), where the webpage would briefly appear in it raw, unstyled content before the styles are applied.

- `defer` - script is fetched in parallel and evaluated after the document is parsed and before firing `DOMContentLoaded`. The scripts are executed in order.

- `fetchpriority` - provide hint to use when fetching `high`, `low`, `auto` (default).

- `blocking` - Block the HTML parsing. You do not need to set it, as it is the default when you use `<script src="">` without any attributes.

- `crossorigin`

    ```html
    <!-- Script is fetched without including any credentials (cookies, HTTP authentication) -->
    <script src="external/script.js"></script>

    <!-- Fetch the script with CORS request but no credentials are included -->
    <script src="external/script.js" crossorigin="anonymous"></script>

    <!-- The browser will include credentials (like cookies, HTTP authentication, client
    side SSL certificates) and the server must also set "Access-Control-Allow-Credentials: true" -->
    <script src="external/script.js" crossorigin="use-credentials"></script>
    ```

- `integrity` - provide the SHA hash to verify the integrity of the script.

- `referrerpolicy` - indicates which referrer to send when fetching the script.

- `src` - URL of the script

- `type`
    - leave it empty - to treat it as classic script
    - `importmap` - body of the element contains an import map, used to specify how the browser resolves module specifier when importing JS modules.

        ```html
        <script type="importmap">
          {
            "imports": {
              "square": "./shapes/square.js",
              "circle": "https://example.com/shapes/circle.js"
            }
          }
        </script>
        ```

        Now you can import modules much easily in JS
        ```js
        import { name as squareName, draw } from "square";
        import { name as circleName } from "circle";
        ```

        Otherwise you would have to do this
        ```js
        import { name as squareName, draw } from "./shapes/square.js";
        import { name as circleName } from "https://example.com/shapes/circle.js";
        ```
    - `module` - Treat script as JS module. The script is deferred by default.

    - any other value - can be used for server side rendering

        ```html
        <!-- Generated by the server -->
        <script id="data" type="application/json">
          {
            "userId": 1234,
            "userName": "Maria Cruz",
            "memberSince": "2000-01-01"
          }
        </script>

        <!-- Static -->
        <script>
          const userInfo = JSON.parse(document.getElementById("data").text);
        </script>
        ```
## Content sectioning

Organize the document content into logical pieces.

### <header\>

At the top level (when parent is 'body'), it defines the site `banner` (logo, company name, search feature, global navigation), and if it is nested in `<main>`, `<article>`, it identifies as header for that section.

```html
<header>
  <h1>Main Page Title</h1>
  <img src="" />
</header>
```

### <footer\>

When used for the whole site (i.e. parent is `body`), it should contain info that should be displayed on every page like copyright statement, contact info, links to privacy and cookie policies. In other places, footer has no special meaning.

```html
<body>
  <header>...</header>
  <main>...</main>
  <footer>...</footer>
</body>
```

### <main\>

Single use per page to identify main content of the document, or the central functionality of an application.

This content should expand upon the central topic of a document, so do not include things that are repeated on multiple pages like sidebars, navigation links, copyright info, site logos, search forms.

```html
<body>
  <main>...</main>
</body>
```

### <article\>

Self-contained, section of content that is independently reusable (like forum post, blog, product card, user-submitted comment)

Put `<h1> - <h6>` as the first child element to identify the article.

```html
<article>
  <h1>Something</h1>
  <article>
    <h2>Sub post</h2>
    <p>...</p>
  </article>
  <article>
    <h2>Sub post</h2>
    <p>...</p>
  </article>
</article>
```

### <aside\>

Generally in a sidebar or call-out box, to show content that is indirectly related to the document's main content (like some info about CSS on a HTML page).

```html
<aside>
  <p>...</p>
</aside>
```

### <section\>

To put generic standalone sections of a document where there is not more specific semantic element to use. Each section should have a heading.

Exampes include, a list of search results, or a map display and its controls.

Use this workflow to think

- If content is standalone, that makes sense as a standalone piece like blog, use `<article>`.
- If content provides info that is relevant to the main content but not directly part of it, like related links, author bio, use `<aside>`.
- If content is the main content of the page use `<main>`.
- If element needs to be used just for styling purposes, use `<div>`.

```html
<section>
  <h2>Heading</h2>
  <p>...</p>
</section>
```

Cases when heading is not required in `<section>`, are typically found in application/UI sections.

```html
<!-- Secondary navigation -->
<section>
  <a href="#">Previous article</a>
  <a href="#">Next article</a>
</section>

<!-- Button bar for controlling your app -->
<section>
  <button class="reply">Reply</button>
  <button class="reply-all">Reply to all</button>
  <button class="fwd">Forward</button>
  <button class="del">Delete</button>
</section>
```

### <address\>

To provide contact info, like physical address, URL, email address, phone number, social media handle, etc. Include the name of person to which the contact refers to inside `<address>`.

```html
<address>
  You can contact author at
  <a href="">www.example.com</a>.
  
  If you see any bugs, please <a href="...">contact me</a>.
  You may also want to visit:
  Street, city, zip
</address>
```

### <search\>

Part of document that contains form controls or other content related to performing a search or filtering operation. It is not for showing the search results.

```html
<!-- When using a form -->
<header>
  <h1>Movie</h1>
  <search>
    <form action="./search/">
      <input type="search" ... />
      <button type="submit">Search</button>
    </form>
  </search>
</header>

<!-- When using JS to filter results -->
<search>
  <label>
    Find and filter your query
    <input type="search" ... />
  </label>
  <label>
    <input type="checkbox" ... />
    Exact matches only
  </label>
</search>

<!-- When using multiple 'search' tags on a page, use a title -->
<header>
  <search title="Website search">...</search>
</header>
<main>
  <search title="Cars">...</search>
</main>
```

### <nav\>

If it is part of site heading, then it is considered main navigation for the site. If it is nested in an `<article>`, it is considered internal navigation for that section only.

```html
<nav>
  <ul>
    <li><a href="#">Home</a></li>
    <li><a href="#">About</a></li>
    <li><a href="#">Contact</a></li>
  </ul>
</nav>

<!-- 'nav' is required to provide links, which can also be in a form of paragraphs -->
<nav>
  <h2>Navigation</h2>
  <p>
    You are on home page. Check <a href="#">my blog</a>.
  </p>
</nav>
```

### <hgroup\>

Represents a heading (`<h1> - <h6>`) and related content (`<p>`). You can group subheadings, alternative title, or tagline.

```html
<hgroup>
  <h1>Docs</h1>
  <p>Last updated on date</p>
</hgroup>
```

### <h1\> - <h6\>

- Do not use these to make text large/small. HTML's purpose if to define the structure of the page, and CSS's purpose is to style.
- Avoid skipping heading levels. People using screen reading software, will quickly jump from heading to heading to determine the content of the page, so don't skip heading levels as it might confuse the people as to where the missing heading is.
- `<hx>` in `<main>` is heading for the page. When nesting `<h1>` inside `<article>, <aside>, <nav>` its font-size woudl be decremented based on the nesting level.

## Text Content

### <blockquote\>

```html
<blockquote
  cite="https://example.com/quotation-src.html"
>
  Words can be like X-rays
</blockquote>
<p>--Blendan Smooth,<br>
Former Margarita Maker, <br>
Aspiring Load Balancer</p>
```

Add quotation marks using CSS
```css
q::before {content: open-quote;}
q::after {content: close-quote;}
```

### <dl\>

Description list to provide definition of preceding terms. Used to implement gloassay or to display metadata (list of key-value pairs).

```html
<dl>
  <dt>Term</dt>
  <dd>Meaning</dd>
  
  <dt>Term2</dt>
  <dd nowrap>Text will not wrap</dd>
</dl>
```

### <div\>

Used to group content and apply styling.

### <figure\>

Usually it is an image, illustration, diagram, code snippet that is referenced in the main flow of the document, but that can be moved to another part of the document or to an appexdix without affecting the main flow.

```html
<figure>
  <img src="src.jpg" />
  <figcaption>Caption</figcaption>
</figure>

<figure>
  <figcaption>Get browser details using <code>navigator</code>.</figcaption>
  <pre>
  function NavigatorExample() {
    ...
  }
  </pre>
</figure>

<figure>
  <figcaption><b>Edsger Dijkstra</b></figcaption>
  <blockquote>
    If debugging is the process of removing software bugs.
  </blockquote>
</figure>
```

### <hr\>

To create a thematic break between paragraph level elements (for example a change of scene in a story, a shift of topic within section).

Do not use this to draw a horizontal line, as `<hr>` has a semantic meaning.

```html
<p>...</p>

<hr
  align="left"
  color="black"
  noshade
  size="10px"
  width="100px"
/>

<p>...</p>
```

### <menu\>

Semantic alternative to `<ul>`, but browsers treat it the same as `<ul>`. The key difference being, it was mainly intended for interactive items.

```html
<!-- Create a toolbar -->
<menu>
  <li><button onclick="copy()">Copy</button></li>
  <li><button onclick="cut()">Cut</button></li>
  <li><button onclick="paste()">Paste</button></li>
</menu>
```

### <ol\>

Numberd list.

- `reversed` - to start numbering in reverse
- `start` - integer to provide start count (always an integer)
- `type`
    - `a`
    - `A`
    - `i` - lowercase roman numerals
    - `I`
    - `1` - for numbers (default)

### <p\>

Can be structured grouping of related content, such as images, or form fields. Screen-readers provide shortcuts to let the users skip to the next or previous paragraph, letting them skim content like how white space lets visual users skip around.

### <pre\>

Preformatted text which is to be presented exactly as written in HTML file.

If you are using this to draw figures, provide an alternative on what the image is for accessibility.
```html
<figure>
  <pre role="img" aria-label="ASCII COW">
     ___________________________
  &lt; I'm an expert in my field. &gt;
      ---------------------------
          \   ^__^
           \  (oo)\_______
              (__)\       )\/\
                  ||----w |
                  ||     ||
  </pre>
  <figcaption id="cow-caption">
    A cow saying, "I'm an expert in my field". The cow is ullistrated using
    preformatted text characters.
  </figcaption>
</figure>
```

### <ul\>

Use css `line-height: 80%` to make the list compact and `list-style-type` to set the type of the marker.