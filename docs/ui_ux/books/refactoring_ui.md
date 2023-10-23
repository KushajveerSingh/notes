When starting a new app, focus on features first and then layout. Keep the layout simple (even just HTML), implement the feature and then work on layout. And then repeat the process for the next feature.

Other tips

- Use whiteboard if needed to come up with rough layout for implementing the feature.
- If a part of feature is "nice-to-have", implement it later as another feature. Get something out quick, to get feedback quicker.

Choose personality for the design (bank needs to show security, startup needs to show playful design)

- Font
    - Serif (freight text) - classic/elegant look
    - Rounded sans serif (proxima soft or Roboto) - playful look
    - Neutral sans serif (freight sans) - planier look, where you use other elements to provide personality
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
- Font weight
    - Normal (400 or 500) for most text
    - Heavier (600 or 700) for text to be emphasized
- Line height
- Color
    - Dark - primary content (like headline)
    - Grey - secondary content (like date of an article)
    - Lighter grey - tertiary content (like copyright info)
- Margin
- Padding
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

Layout and spacing

Page 65