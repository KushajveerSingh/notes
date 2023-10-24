When starting a new app, focus on features first and then layout. Keep the layout simple (even just HTML), implement the feature and then work on layout. And then repeat the process for the next feature.

Other tips

- Use whiteboard if needed to come up with rough layout for implementing the feature.
- If a part of feature is "nice-to-have", implement it later as another feature. Get something out quick, to get feedback quicker.

Choose personality for the design (bank needs to show security, startup needs to show playful design)

- Font
    - Serif (freight text) - classic/elegant look
    - Rounded sans serif (proxima soft or Roboto) - playful look
    - Neutral sans serif (freight sans, Helvetica Neue) - planier look, where you use other elements to provide personality
- Color
    - Choose what looks best to you
    - Blue - safe and familiar
    - Gold - expensive, sophisticated
    - Pink - fun
- Border radisu
    - Small - neutral, no personality
    - Large - playful
    - No border - serious, formal
- Language
    - Official or professional tone

        > To confirm your identity, please provide a phone number where we can send you a verification code.

    - Friendly, casual tone

        > Just to make sure this is really you, where can we send you a verification code?


Define design system first, to limit your choices for various things

- Font size
    - Similar to spacing, where you want much more choices for smaller values.
    - Choose base font-size (16px).
    - Choose the ratio
        - 4:5 (major third) - round the values to avoid fractional values, as browsers handle these differently.
        - 2:3 (perfect fifth)
        - 1:1.618 (golden ratio or modular scale)
    - Apply the ratio to get a new value and repeat with the new value
    - This approach works when designing articles as the number of font-sizes are limited.
    - This approach does not give much font-size options, and thus might be harder when designing interfaces. 
    - A better approach for interface design is to pick values by hand.
        - 12px
        - 14px
        - 16px
        - 18px
        - 20px
        - 24px
        - 30px
        - 36px
        - 48px
        - 60px
        - 72px
    - Use pixel values or "rem" intead of "em" to stick to the type scale.
- Font weight
    - Normal (400 or 500) for most text
    - Heavier (600 or 700) for text to be emphasized
- Line height
- Color
    - Dark - primary content (like headline)
    - Grey - secondary content (like date of an article)
    - Lighter grey - tertiary content (like copyright info)
- Spacing (Margin, Padding)
    - The adjacent scale values should not be closer than about 25%.
    - Start with a base value (16px), and then build a scale using factors and multiples of that value. (0.25x, 0.5x, 0.75x, 1x, 1.5x, 2x, 3x, 4x, 6x, 8x, 12x, 16x, 24x, 32x, 40x, 48x).
- Width
- Height
- Box shadows
    - Define 5 shadows. Start with the smallest and largest and then fill the gaps linearly.
    - `0 1px 3px hsla(0, 0%, .2)`
    - `0 4px 6px hsla(0, 0%, .2)`
    - `0 5px 15px hsla(0, 0%, .2)`
    - `0 10px 24px hsla(0, 0%, .2)`
    - `0 15px 35px hsla(0, 0%, .2)`
    - For double shadows
    - `0 1px 3px hsla(0, 0%, .12), 0 1px 2px hsla(0, 0%, .24)`
    - `0 3px 6px hsla(0, 0%, .15), 0 2px 4px hsla(0, 0%, .12)`
    - `0 10px 20px hsla(0, 0%, .15), 0 3px 6px hsla(0, 0%, .10)`
    - `0 15px 25px hsla(0, 0%, .15), 0 5px 10px hsla(0, 0%, .5)`
    - `0 20px 40px hsla(0, 0%, .2)`
- Border radius
- Border width
- Opacity

Establish, visual hierarchy using font size, font weight and color (for the initial design try to use everything except color, and then bring color in).

Font Size

- Big - to emphasize more (as you are increasing surface area)
- Small - to emphasize less

Color

- Use softer color for supporting text, like using a lighter grey color (on white background).
- For colored background, choose the background color, keep the hue same, and change the saturation/lightness to get a softer color. Do not use opacity, pick a new color.

Font weight

- Bold - to emphasize more. It works as you are increasing the surface area.

Labels

- Avoid "label: value" as it makes it harder to establish hierarchy.

    ```
    Name: Erin
    Job title: Customer Support
    Email: ering@example.com
    Phone: (555) 765-1111
    ```

- Option 1. Skip labels for things that are common sense, like email, phone, price.

    ```
    Erin
    Customer Support (differ color, smaller text)
    erin@example.com (even smaller text)
    (555) 765-111 (same text as above)
    ```

- Option 2. Present label in a different way.

    With label
    ```
    In stock: 12
    Bedrooms: 3
    ```

    Without label
    ```
    12 left in stock
    3 Bedrooms
    ```

- Option 3. On dashboards, where labels might be necessary, make the label secondary (lighter color, smaller size) and the "value" primary.

- Option 4. On information-dense pages, like technical specification of a product, where users are looking for the label. Use darker color for the label, and a slightly lighter color for the value.

Icons alongside text, would always feel more emphasized because they take more surface area. To de-emphasize use a softer color for the icon.

Borders for separation. Use a soft color. To create more visual separation increase the width (surface area) of the border.

Button colors

- Use selected colors for action buttons also. Do not use red (delete), blue (edit), green (publish).
- Primary action (should be obvious) - Solid, high contrast background
- Secondary action (should be clear but not prominent) - Outline styles or lower contrast background
- Tertiary action (should be discoverable but unobstrusive) - style similar to links
- For destructive actions, make them secondary/tertiary (depending on where they are on the current page) on the first page, and then in the popup for confirmation make them primary.

Spacing

- Instead of adding space to make things less cramped, you should start with a lot of extra white space and then remove it till you are happy with the result.

Responsive design

- Start with small screen like 400px.
- After you are done, move the next screen size and repeat. This has the benefit, where you can use the new available space to show things that were a compromise for smaller screens.

Size of elements

- Elements that are large on large screens need to shrink faster that elements that are already fairly small.
- The difference between small elements and large elements should be less extreme at small screen sizes.
- Similarly for relationship between elements, they don't always have to be proportional.
    - Like relationshiop of padding and font-size of button.
    - You do not want the padding to decrease as font-size decreases, automatically.
    - Instead we want padding to be more generous at the larger sizes and disproportionately tighter at smaller sizes.

Examples of ambiguous spacing

- In forms when the label is spaced evenly between the upper and lower input field. The label should be closer to the input field that it corresponds to.
- In articles where the upper and lower space between headings is same. The lower space should be reduced to bring the heading closer to the text it corresponds to.
- In bulleted lists, where the space between bullets matches the line-height of a single bullet. The space between bullets should be more than the line-height, to create separation between the bullets.

Line height

- Number of characters per line should be 45 to 75.
- Use width of paragraph to "20-35em" to achieve this.
- No matter the situation, maybe it is header line, or the paragraph is part of a bigger component, the number of characters per line need to be limited to the range 45 to 75.

Align items to baseline

- On a horizontal line with different font-size elements, the elements should be aligned to the baseline instead of the center (`align-items: baseline`).

Line height

- Depends on paragraph width also. Greater the width, the bigger line-height needs to be.
- Depends on font-size also. When text is small, extra line spacing is needed. For large font-sizes, line-length of 1 is fine.

Links in interfaces

- When everything is a link, like in a card, you do not need to color the link.
- Instead just use bold weight, or something simler to signify that.
- When a user hovers show an underline.

Text alignment

- For English, keep majority of text left aligned.
- Center-alignment works weell for headlines or short, independent blocks of text. Do not use this for long text.
- Right-alignment works in tables when you want to show numbers, as it makes the decimal always appear at the same spot, thus making it easier to compare values.
- Justified content, works well in print and on web looks good for formal look. When using justified content, enable hypenation also `hyphens: auto`.

Letter spacing

- Trust the typeface designer and not modify it for most cases.
- Only modify letter spacing when you are doing something that is not the primary focus of the typeface. Like Open Sans is designed to be legible at small sizes, but that means for headlines with large size, there would be extra letter spacing than a typeface that is designed for headlines (Oswald).
- Do not use a typeface designed for headlines for small text.
- When doing all caps, increase the letter spacing (`line-spacing: 0.05em`).

Color

- Use HSL (`hsl(220, 65%, 61%)`).
- Hue - position of color on the color wheel. Value from 0 degree to 359 degree.
    - 0 degree - red
    - 120 degree - green
    - 240 degree - blue
- Saturation - how colorful or vivid a color looks.
    - 0% - grey (no color)
    - 100% - vibrant and intense
    - Because at 0% saturation all colors are grey, when choosing the hue, set the saturation to 100%, so you can see the color.
- Lightness - measures how close the color is to black or white
    - 0% - pure black
    - 100% - pure white
    - 50% - pure color at the given hue

Building color palette

- Greys - For text, backgrounds, panels, form controls. 8-10 shades.
- Primary color(s) - mostly need 1 for primary actions, active navigation elements. Like facebook is blue. 5-10 shades.
- Accent colors - communicating things with user, like yellow/pink/teal to hightlight a new feature, red for confirming destructive action, yellow for warning messages.

Raising button to create depth

- Add a light shadow at the top, to mimic the sun shining from top. `box-shadow: inset 0 1px 0 hsl(224, 84%, 74%)`. Choose the lighter color by hand, instead of semi-transparent white.
- Add a dark shadow at the bottom, to block light coming from above. `box-shadow: 0 1px 3px hsla(0, 0%, 0%, .2)`. For blue radius just use a couple of pixels as you want edges to be sharp.
- This effect works good for text inputs and checkboxes.

Shadows (controlling the z-index)

- Light shadows work well for buttons where you want users to notice it, but don't want the button to dominate the page. `box-shadow: 0 1px 3px hsla(0, 0%, .2)`.
- Medium shadows work well with dropdows, that need to sit a bit further above the rest of the UI. `box-shadow: 0 4px 6px hsla(0, 0%, .1)`.
- Large shadows work well for dialog boxes, where you want to capture the user's attention. `box-shadow: 0 15px 35px hsla(0, 0%, .2)`.
- Double shadows can also be used. `box-shadow: 0 4px 6px hsla(0, 0%, .7), 0 5px 15px hsla(0, 0%, .1)`.
    - First, larger and softer with big vertical offset and large blur radius, simulates the shadow cast behind an object by a direct light source.
    - Second, shadow is tighter and darker, with less vertical offset and small blue radius, simulates area underneath an object where even ambioent light has a hard time reaching.

Overlapping elements (adds depth)

- Instead of showing a card entirely in an element, offset it so it crosses the transition between two different backgrounds.
- Make the element taller than its parent, so it overlaps on both sides.
- The controls of a carousel can be overlapped with the edge.
- In user profile cards, have the user image overlap with background and bottom part.

Text on big hero image

- When you want to put a headline on the large background image, put a black overlay to tone down the light areas and help the light text stand out, while a light overlay will brighten up the dark areas and help dark text stand out.
- With an overlay the entire imagge gets affected. An alternative is to lower the contrast (increase the brightness alongside) of the image to make the black text stand out.
- Another alternative is to colorize the image. Lower the contrast, desaturate the image to remove any existing color, and add a solid fill (using multiply blend mode).
- Another alternative is to use text shadow with large radius `text-shadow: 0 0  50px hsla(0, 0%, 0%, .4)`. With this you only need to lower the image contrast by a little.

Scaling SVG icons

- Dont' scale them up. Even though they are SVG, the quality would degrade.
- Use a larger icon instead, if available.
- If larger icon is not available, enclose the icon in a shape (like a circle) with background color.
- Dont' scale then down also. A better option is to redraw the icon at the target size, so you can control the compromises instead of leaving it up to the browser.

Scaling screenshots

- Avoid it, as you loose the detail, and everything becomes cramped.
- Option 1. Take the screenshot on a smaller screen, so you don't have to shrink it.
- Option 2. Take a partial screenshot of the specific area.
- Option 3. If you have to take screenshot of the whole app, then draw a simplified UI with details removed and small text replaced with simple lines.

Handling user-uploaded images in the layout

- Create a fixed size container.
- Center the image.
- Crop the rest.
- To implement it, use the image as background image of the container and use `background-size: cover`.

Handling user-uploaded profile photos

- Users might use the same background color as your UI.
- To solve this issue, add a border with a shadow. `border: 2px soild hsl(212, 12% 72%)`.
- The shadow will conflict with the user image. If you want to resolve this issue, use  semi-transparent inner border. `box-shadow: inset 0 0 0 1px hsla(0, 0%, 0%, .1)`.

Change the defaults

- Change the default bullet list with an icons, like padlock when listing security bullet points, or using chechmarks and arrows.
- For testimonials, you can increase the start and end quotation mark size and make it a lighter color than the text.
- For links, you can change the color and font weight, or add a think colorful custom underline that overlaps with the text.
- In forms, use custom checkboxes and radio buttons, with colors similar to the theme.
- Add accent borders (a thin horizontal line)
    - At the top of the card, add a light blue thin line.
    - A line under the highlighted item in the navbar (put the line on the navbar line, not under the text).
    - On alert messages, the line can be placed at the left border.
    - A short line can be inserted under a headline.
    - Line across the top of the entire layout.
- Changing background colors, to break the monotony. This can also be used to create distinction between entire page sections.
    - For an energetic look, a gradient can be used. Choose the two hues that are no more than 30 degree apart.
    - Add a repeatable pattern (like dots). https://heropatterns.com/ can be used for this. Use these along a single edge (like in the footer after the text ends), or entire background.
    - Simple geometric shapes can be inserted at some locations, instead of repeating the pattern, or do small chunks of repeatable pattern.
    - Or add a simplified world map, when showing them "Join our newsletter" container.
- Empty states should be given preference also. If your app depends on user-generated data, like list of contacts. Then you need to handle the case when there are no contacts, by showing an illustration, or something with an action to add new contact. Instead of just showing the text "No contacts found".
    - In the UI, if there are certain actions that can only be used when the user has generated some content, hide the actions if there is no data.
- Use fewer borders.
    - Use a box shadow (when the element is not the same color as the background).
    - Use two different background colors.
    - Add extra spacing.
- Think outside the box
    - Instead of having a vertical dropdown, you can make it a big box and have sections inside it.
    - In tables, you can present data from multiple columns in the same cell (if sorting is not needed).
    - If the radio buttons are important part of the UI, like choosing the price of the membershiop, make them selectable cards instead.