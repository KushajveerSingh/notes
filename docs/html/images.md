`#!html <img src="image.jpg" loading="lazy" alt="...">` - requests for images are made when they are close to the user's viewport, deferring them from the initial page load. Just don't use it on images are at the top of the layout, and more likely to be in the user's viewport when the page is first loaded.

Also, use `fetchpriority` attribute to control the priority. Set it to `low` for images that are only shown on user interaction (even if the image fall's within the user's viewport), or use `fetchpriority='high'` to priortize an image that will be immediately visible in the viewport as soon as the page is rendered.

Cumulative Layout Shift (CLS) - measure of visual stability. How much of the layout shifts as assets are loaded and the page is rendered. You want low CLS score.
- Set the `height` and `width` attribute `#!html <img src="image.jpg" height="200" width="400" alt="...">`. Browsers internally use these values to determine the aspect ratio of the iamge before the page is renderd, allowing it to reserve the space the image will occupy as the layout is rendered.

So set `height`, `width` to match the original size of the image and then use this css to make the images responsive.
```css
img {
  max-width: 100%;
  height: auto;
}
```

You reserved space by using `height` and `width`, but you do not want to show empty gap or low-quality placeholder while users wait for an image to transfer adn render.

Largest Contentful Paint (LCP) - measures the time it takes to render the largest "contentful" element visible in the user's viewport. This element acts as a proxy for the point where the majority of the page has been rendered, from the user's perspective (i.e. perceived performance).
- do not specify `loading="lazy"` for these images
- use `fetchpriority="high"`.
- keep image source small

SVGs
- alternatives to images.
- are much smaller in size, but the downside is require rendering by the browser
- It's a hit and trial on if you should use image or svg. But in general, interface elements like icons, artwork with shark lines, solid colors, and clearly defined shapes will are strong candidate for svg.

Raster images (JPEG, GIF, PNG, WebP)
- set of pixel-by-pixel instructions for rendering a 2d grid.
- do not extend them beyond their original size.
- server does not send an image over the wire to the browser, instead it sends a stream of bytes describing the pixel grid that make up the iamge for the client to recompose.

GIF (Graphics Interchange Format)
- a single frame is drawn to the logical screen (viewport), then replaced by another.
- lossless
- each frame can contain a maximum of 256 colors, so you loose fidelity when using GIF.
- serves no purpose in modern world.
- support transparency (binary i.e. pixel is either opaque or transparent)
- use SVG instead

PNG (Portable Network Graphics)
- lossless
- color palette can be quantized to 256 colors, or the more common "truecolor" PNG can contain upto 16 million colors.
- support alpha channel transparency (0 fully transparent to 255 fully opaque).
- should not be used much now. Today, PNG should only be considered for simple artwork that requires semi-transparency (even then think about using WebP).
- use SVG instead.

JPEG (Joint Photographic Experts Group)
- `.jpg` is more often used. `.jpeg` is rarely used now
- lossy compression. It tries to throw away details we weren't likely to see in the first place.
- PJPEG (Progressive JPEG) reorders the process of rendering a JPEG. Normal JPEG renders top to bottom. PJPEG renders full-sized scans with each scan increasing the quality of the image i.e. entire image appears immediately, albeit blurry, and grows clearer as the transfer continues.
- Also, the size of PJEG is smaller. This comes at the cost of increased overhead on the client, but this only becomes noticeable on severely underpowered devices.
- just select a value from 0 to 100 to determine the quality and that is it for JPEG

WebP
- lossy + lossless + alpha channel transparency + GIF like animation support
- just select a value from 0 to 100 to determine the quality and that is it for WebP.

AVIF (AV1 Image File Format)
- based on av1 encoding, and probably better tha webp

Responsive images
- Descriptive syntaxes
    - Browser decides what is best for you. And this is the more common scenario, as the browser knows much more than the web developer.
    - `srcset` - provide a list of potential sources for populating a single `<img>`
    - `sizes` - provide info on how the image will be rendered
- Prescriptive syntaxes
    - Tell the browser what to do - what source to select, based on specific criteria you've defined.
    - You can provide info like content of the sources or their formats before the images are transferred.
    - `<picture>` will be used for this.

Descriptive syntaxes
- Provide browser a list of images, and browser will choose the image (it does not swap images. So if you want different images to be displayed at different breakpoints, then this is not the solution).
- You can solve the problem of requesting and rendering an image source tailored to a user's browsing context, including viewport size, display density, user preferences, bandwidth, and more.

Adjust the image based on pixel density. If you display an image with width 400px, and the pixel density is 1, then it would be fine. But if the pixel density is 2, then you need an image of width 800px for the best looks.

In this example, you specify the image for a display with DPR of 2. Or you could have provided the width using `w`.
```html
<img src="low-density.jpg" srcset="double-density.jpg 2x">
<img src="image.jpg" srcset="small.jpg 600w, large.jpg 1200w">
```

The above just gives browser info about the images, and now browser will use this info in its algo to decide which image to render.

You also need to provide info about the size of the images using `sizes` (the size of the image in the rendered layout)
```html
<img
  sizes="80vw"
  srcset="small.jpg 600w, medium.jpg 1200w, large.jpg 2000w"
  src="fallback.jpg"
  alt="..."
>
```

When using the "w", the browser automatically uses the best image that fits the display density of the user. So just use the above syntax and you are done.

Also, for sizes you would use something like `calc(100vw-2em)` to take into consideration the page layout. `sizes` is the default space the image would take once rendered.

Next, you need to adjust `sizes` for your responsive design `sizes="(min-width: 1200px) calc(80vw - 2em), 100vw"`