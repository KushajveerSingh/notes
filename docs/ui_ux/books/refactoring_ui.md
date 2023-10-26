**Refactoring UI** by *Adam Wathan*, *Steve Schoger* (2018).

## Feature before design

When starting a new application

- Implement feature, while using a simple layout (even just HTML).
- Next, focus on the design.
- Repeat, the process for the next feature.

Tips

- Whiteboard can be used to come up with rough layout, as whiteboard does not allow detail layout design.
- If a part of feature is "nice-to-have", implement it later as another feature. This allows to get feedback quicker.

## Choose personality

Before starting a new application, choose the personality/design theme. This include choosing colors, font-sizes, and more.

This condenses the infinite amount of choices (like color, font-size) to a finite amount, and helps make quicker and consistent designs.

The application domain also needs to be considered, like banks need to show security.

### Font style

- Serif (freight text) - classic/elegant look.
- Rounded sans serif (proxima soft,  Roboto) - playful look.
- Neutral sans serif (freight sans, Helvetica Neue) - plainer look, where other elements are used to show personality.

### Font size

Want more choices for smaller values. The recommended approach is to pick values by hand

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

Use `px` or `rem` instead of `em`` to stick to the type scale.

### Font weight

- Normal (400 or 500 depending on font-family) for most text.
- Heavier (600 or 700) for text to be emphasized.

### Color

Choose what looks best to you, and put less emphasis on the psychology of the color.

- Blue - safe and familiar.
- Gold - expensive, sophisticated.
- Pink - fun.

Any design system includes the following colors

- Dark - primary content (like headline).
- Grey - secondary content (like published date of an article).
- Lighter grey - tertiary content (like copyright info).

### Border radius

- Small - neutral, no personality.
- Large - playful.
- No border - serious, formal.

### Language

- Official or professional tone

    > To confirm your identity, please provide a phone number where we can send you a verification code.

- Friendly, casual tone

    > Just to make sure this is really you, where can we send you a verification code?

### Spacing

Margin, Padding

- The adjacent scale values should not be closer than about 25%.
- Start with a base value (16px), and then build a scale using factors and multiples of that value.
    - 0.25x
    - 0.5x
    - 0.75x
    - 1x
    - 1.5x
    - 2x
    - 3x
    - 4x
    - 6x
    - 8x
    - 12x
    - 16x
    - 24x
    - 32x
    - 40x
    - 48x

### Box shadows

Define 5 shadows. Start with the smallest and largest and fill the gaps linearly.

- `0 1px 3px hsla(0, 0%, .2)`
- `0 4px 6px hsla(0, 0%, .2)`
- `0 5px 15px hsla(0, 0%, .2)`
- `0 10px 24px hsla(0, 0%, .2)`
- `0 15px 35px hsla(0, 0%, .2)`

Double shadows can be utilized to add a stronger affect.

- `0 1px 3px hsla(0, 0%, .12), 0 1px 2px hsla(0, 0%, .24)`
- `0 3px 6px hsla(0, 0%, .15), 0 2px 4px hsla(0, 0%, .12)`
- `0 10px 20px hsla(0, 0%, .15), 0 3px 6px hsla(0, 0%, .10)`
- `0 15px 25px hsla(0, 0%, .15), 0 5px 10px hsla(0, 0%, .5)`
- `0 20px 40px hsla(0, 0%, .2)`

## Visual hierarchy

Establish, visual hierarchy using font size, font weight, spacing, and color (for the initial design use everything except color, and then bring color in).

Visual hierarchy is governed by how much surface area an element takes. If element takes more surface area, then it is more important.

### Font Size

- Big - to emphasize more.
- Small - to emphasize less.

### Font weight

- Bold - to emphasize more.

### Color

White background

- Use softer color (like light grey) for supporting text.

Colored background

- First, get HSL value of background color.
- Keeping the hue same, change saturation/lightness to get a softer color, to use for the text.
- Do not use opacity. As opacity can cause issues, when the background has an images/pattern.

### Labels

Labels are things that are fetched from database, like name, email, phone. Do not show the data as `label: value`, as it makes it harder to establish hierarchy.

Avoid this
```
Name: Erin
Job title: Customer Support
Email: ering@example.com
Phone: (555) 765-1111
```

Solution 1. Skip labels for things that are common sense like email, phone, price.
```
Erin
Customer Support (differ color, smaller text)
erin@example.com (even smaller text)
(555) 765-111 (same text as above)
```

Solution 2. Reframe the label as a sentence.

```
# With label
In stock: 12
Bedrooms: 3

# Without label
12 left in stock
3 Bedrooms
```

Solution 3. On dashboards, where labels might be necessary, make the label secondary (lighter color, smaller size) and the "value" primary.

Solution 4. On information-dense pages, like technical specification of a product, where users are looking for the label, use darker color for the label, and a slightly lighter color for the value.

### Icons

Icons alongside text, would always feel more emphasized because they take more surface area. To de-emphasize use a softer color for the icon.

### Border

Using borders for separation should be avoided as much as possible.

- Use a box shadow (when the element is not the same color as the background).
- Use two different background colors.
- Add extra spacing.

When using borders for separation, use a soft color. To create more visual separation increase the width of the border.

### Buttons

Do not use colors outside palette for buttons, like delete button (red), edit button (blue), publish button (green).

- Primary action (should be obvious) - Solid, high contrast background.
- Secondary action (should be clear but not prominent) - Outline styles or lower contrast background.
- Tertiary action (should be discoverable but unobtrusive) - style similar to links.
- For destructive actions, make them secondary/tertiary (depending on where they are on the current page), and in the popup for confirmation make them primary.

## Spacing

Instead of adding space to make things less cramped, start with a lot of extra white space and then remove it till desired result is achieved.

### Responsive design

- Start with small screen like 400px.
- Then move to the next screen size and repeat.
- This has the benefit, where the new available space can be used to show things that were a compromise for smaller screens.

### Size of elements

Elements that are large on large screens need to shrink faster that elements that are smaller elements. In other words, the difference between small elements and large elements should be less extreme at small screen sizes.

An example of this, is padding and font-size in button

- For larger sizes, the padding should be more generous and disproportionately tighter at smaller sizes.

### Ambiguous spacing

- In forms when the label is spaced evenly between the upper and lower input field. The label should be closer to the input field that it corresponds to.
- In articles where the upper and lower space between headings is same. The lower space should be reduced to bring the heading closer to the text it corresponds to.
- In bulleted lists, where the space between bullets matches the line-height of a single bullet. The space between bullets should be more than the line-height, to create separation between the bullets.

## Text

### Line width

- Number of characters per line should be 45 to 75. No exception to this rule, including the header line.
- Use `20-25em` as the paragraph width, to achieve this.

### Line height

- Depends on paragraph width. Greater the width, the bigger line-height needs to be.
- Depends on font-size also. When text is small, extra line spacing is needed. For large font-sizes, line-length of 1 is fine.

### Text alignment

- Keep majority of text left aligned.
- Center-alignment - works well for headlines or short, independent blocks of text. Do not use for long text.
- Right-alignment - works in tables when showing numbers, as it makes the decimal always appear at the same spot, thus making it easier to compare values.
- Justified content - works well in print and on web looks good for formal look. When using justified content, enable hyphenation also `hyphens: auto`.

### Letter spacing

- Trust the typeface designer and do not modify it for most cases.
- Modifying letter spacing is only needed, when the typeface is being for things the author did not intend them to be.
- Like Open Sans is designed to be legible at small sizes, but that means for headlines with large size, there would be extra letter spacing than a typeface that is designed for headlines (Oswald).
- Do not use a typeface designed for headlines for small text. Adjusting letter spacing would not work.
- When doing all caps, increase the letter spacing (`line-spacing: 0.05em`).

### Text in horizontal line

On a horizontal line with different font-size elements, the elements should be aligned to the baseline instead of the center (`align-items: baseline`).

### Links in cards

In cards, everything is a link. Make the following changes to adjust for that

- Do not use color for the link.
- Use bold weight, or something similar to signify that.
- When a user hovers show an underline.

### Text on big hero image

Using a headline on hero image

- Light text, dark background - Put a black overlay to tone down the light areas of the image and help the light text stand out.
- Dark text, light background - Put a light overlay to brighten up the dark areas and help dark text stand out.

A possible problem in some scenarios is that the entire image gets affected. The following alternatives can be used

- Lower the contrast (increase the brightness alongside) of the image to make the black text stand out.
- Or, colorize the image.
    - Lower the contrast.
    - Desaturate the image to remove any existing color.
    - Add a solid fill (using `multiply`` blend mode).
- Or, use text shadow with large radius `text-shadow: 0 0  50px hsla(0, 0%, 0%, .4)`.
    - This has the benefit that the contrast of the images needs to be reduced by a small amount.

## Color

- Use HSL like `hsl(220, 65%, 61%)`.
- Hue - position of color on the color wheel. Value from 0 degree to 359 degree.
    - 0 degree - red.
    - 120 degree - green.
    - 240 degree - blue.
- Saturation - how colorful or vivid a color looks.
    - 0% - grey (no color).
    - 100% - vibrant and intense.
    - Because at 0% saturation all colors are grey, when choosing the hue, set the saturation to 100%, to see the true color.
- Lightness - measures how close the color is to black or white
    - 0% - pure black.
    - 100% - pure white.
    - 50% - pure color at the given hue.

### Color palette

- Greys - For text, backgrounds, panels, form controls. 8-10 shades.
- Primary color(s) - mostly need 1 for primary actions, active navigation elements. Like facebook is blue. 5-10 shades.
- Accent colors - communicating things with user, like yellow/pink/teal to highlight a new feature, red for confirming destructive action, yellow for warning messages.

## Adding depth

### Raise buttons

Raise button to create depth.

- Add a light shadow at the top, to mimic the sun shining from top. `box-shadow: inset 0 1px 0 hsl(224, 84%, 74%)`. Choose the lighter color by hand, instead of semi-transparent white.
- Add a dark shadow at the bottom, to block light coming from above. `box-shadow: 0 1px 3px hsla(0, 0%, 0%, .2)`. For blur radius use a couple of pixels, as edges need to be sharp.
- This effect works good for text inputs and checkboxes.

### Shadows

- Light shadows work well for buttons that need to be noticed by the users, but the button should not dominate the page. `box-shadow: 0 1px 3px hsla(0, 0%, .2)`.
- Medium shadows work well with dropdowns, that need to sit a bit further above the rest of the UI. `box-shadow: 0 4px 6px hsla(0, 0%, .1)`.
- Large shadows work well for dialog boxes designed to capture the user's attention. `box-shadow: 0 15px 35px hsla(0, 0%, .2)`.
- Double shadows can also be used. `box-shadow: 0 4px 6px hsla(0, 0%, .7), 0 5px 15px hsla(0, 0%, .1)`.
    - First shadow
        - Larger and softer with big vertical offset.
        - Large blur radius.
        - Simulates the shadow cast behind an object by a direct light source.
    - Second shadow
        - Tighter and darker with less vertical offset.
        - Small blue radius.
        - Simulates area underneath an object where even ambient light has a hard time reaching.

### Overlap elements

Adds depth. Can be done in the following ways

- Instead of showing a card entirely in an element, offset it so it crosses the transition between two different backgrounds.
- Make the element taller than its parent, so it overlaps on both sides.
- The controls of a carousel can be overlapped with the edge.
- In user profile cards, have the user image overlap with background and bottom part.

## SVG icons

### Scale up

Do not scale up, as the quality degrades.

If larger icon is not available, enclose the icon in a shape (like a circle) with background color.

### Scale down

Do not scale down.

Instead redraw the icon at the target size, so the compromises can be controlled by the author rather than letting the browser decide.

## Screenshots

Avoid scaling, as the details gets lost, and everything becomes cramped.

- Option 1. Take the screenshot on a smaller screen, so that downscaling is not required.
- Option 2. Take a partial screenshot of the specific area.
- Option 3. Is screenshot of the whole app is required, then draw a simplified UI with details removed and small text replaced with simple lines.

## User uploaded images

### In layout

Handling user-uploaded images in the layout

- Create a fixed size container.
- Center the image.
- Crop the rest.

To implement it, use the image as background image of the container and use `background-size: cover`.

### Profile photos

Users might use the same background color as the UI.

To resolve this issue, add a border with a shadow. `border: 2px solid hsl(212, 12% 72%)`.

The above method, will interfere with the user image. The alternative is to semi-transparent inner border `box-shadow: inset 0 0 0 1px hsla(0, 0%, 0%, .1)`.

## Change the defaults

### Bullet list to icons

Change the default bullet list with an icon

- Padlock when listing security bullet points
- Using checkmark and arrows icons.

### Testimonials quotations

Increase the start and end quotation mark size and make it a lighter color than the text.

### Links

Change the color and font weight, or add a think colorful custom underline that overlaps with the text.

### Form checkboxes/radios

In forms, use custom checkboxes and radio buttons, with colors similar to the theme.

### Accent borders

A thin horizontal line

- At the top of the card, add a light blue thin line.
- A line under the highlighted item in the navbar (put the line on the navbar line, not under the text).
- On alert messages, the line can be placed at the left border.
- A short line can be inserted under a headline.
- Line across the top of the entire layout.

### Different backgrounds/patterns

Changing background colors, to break the monotony. This can also be used to create distinction between entire page sections.

- For an energetic look, a gradient can be used. Choose the two hues that are no more than 30 degree apart.
- Add a repeatable pattern (like dots). https://heropatterns.com/ can be used for this. Use these along a single edge (like in the footer after the text ends), or entire background.
- Simple geometric shapes can be inserted at some locations, instead of repeating the pattern, or do small chunks of repeatable pattern.
- Add a simplified world map, when showing them "Join our newsletter" container.

### Section dropdown

Instead of having a vertical dropdown, a big box with sections can be used.

### Tables

In tables, data from multiple columns can be presented in the same cell (if sorting is not needed).

### Cards instead of radios

If the radio buttons are important part of the UI, like choosing the price of the product, make them selectable cards instead.

## Handle empty states

If the app depends on user-generated data, like list of contacts, then empty state (no contacts) should be handled by creating a UI, rather than leaving it empty or using a dull text "No contacts found".

Show the actions that can be used to add contacts instead.

In the UI, if there are certain actions that can only be used when the user has generated some content, hide the actions if there is no data.
