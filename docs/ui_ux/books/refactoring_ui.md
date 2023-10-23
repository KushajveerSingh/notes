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

Page 132.