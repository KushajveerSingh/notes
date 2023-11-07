Shortcuts

- Space - move around the canvas
- Ctrl + Mouse scroll - zoom in and out
- F - to create frame i.e. choose an area of the canvas to create your design in
- K - to resize objects or layers
- V - to move the object around
- Draw
    - Shapes
        - R - Rectangle
        - L - Line
        - Shift + L - Arrow
        - O - Ellipse
        - Ctrl + Shift + K - place image
        - Polygon (no shortcut)
        - Star (no shortcut)
    - P - to create vector paths, anchor points, bezier curves
    - Shift + P - pencil tool for freehand drawing
    - T - add text
- Ctrl + \ - to toggle visibility of sidebars

Canvas

- Finite size of -65,000 to +65,000 on each axis.

Pages

- Each page is its own canvas and used to organize design files.
- Manage design by milestone or status.
- Organize components.
- Archive older designs.

Layers

- Each object is trearted as a separate layer.
- Use *Groups* to combine layers into a single element.
- Use *Frames* to create containers for layers (like a navigation bar), and for scaffolding for a specific device or screen size.
- Use *Sections* to label a specific region of the canvas, to group related concepts (used more for collaboration purposes).

Mask

- Show or hide specific portions of a layer or object.
- Uses the selection to determine what you can see of any layers underneath.

Combine shape layers using boolean operations

- Select multiple objects, and then choose
- Union selection - combine overlapping vector paths into a single path (the outermost layers take preference)
- Subtract selection - remove any overalpping paths from the base layer (the innermost layers take preference)
- Intersect selection - create single path from any overlapping paths
- Exclude selection - create a single path from the part of the layers that don't overlap
- Flatten selection - create a single layer from the selection

Assets tab (in left sidebar)

- All components can be found here. Drag components to the canvas to create an instance.


## UI fundamentals

### White space

Should be applied based on four factors

- Space availabiilty
- Number of components
- Alignment
- Consistency

### Contrast

Helps separate elements from each other by adjusting color, brightness and/or opacity.

Should be applied based on two factors

- Is it text? If so, is it text they need to read?
    - How large is the type?
    - Should it be readable?
    - Does it adhere to the WCAG Contrast Guidelines
        - Small Text (AA) - 4.5 : 1 ratio
        - Large Text (AA) - 3 : 1 ratio
        - Use **Stark** plugin to check for this in Figma.
        - Large text is generally 14 point (18.66px) and bold or 18 point (24 px) or larger.
- If it's not text, is it an important visual element?

### Scale

Should be applied based on two factors

- Should it be readable?
    - Paragraph text should be no smaller than 16px (like main body text).
    - Adjust type scale to reinforce visual hierarchy.
- How much space is available? Can be an effective way of fillign up space.

Think about reading from the largest font size to the smallest on a page. You want to structure your font-size, so that users start with main heading, sub headings, action buttons, extra things (like date).

### Alignment

Provide structure and flow to a layout. Invisible horizontal and vertical lines defined by the layout.

### Color

- Use no more than 3 hues throughout the UI (primary, secondary, accent).

In the square color picker diagrams
- Hue (the top-right corner, full color saturation).
- Tint (if you add white i.e. move left at the top-line)
- Shade (if you add darkness i.e. move down at the right-line)
- Tone (if you add both lightness and darkness)

How to create color scheme
- Monochromatic - one hue with various tints, shades, and tones.
- Analogous - multiple hues located next to each other in the color spectrun (i.e. the vertical slider you have on the right of the square).
- Complementary - hues that are located opposite of each other on the color wheel.
- Experiment - just try any random colors.

### Typography

- Tracking - space between letters
    - Wider tracking is typically used on titles, labels and watermarks.
    - Stick with default tracking in most cases.
- Leading - space between lines of text
- Font styles - serif, sans serif, script
    - Mostly sans serif fonts are used (Poppins, Roboto)
    - Serif generally considered old. But you can mix them, by using serif font in title, and sans serif in body.
- Font weight
    - Can be used to enforce visual hierarchy.
    - Avoid making too many words bold in paragraph.

### Visual hierarchy

Give priority to elements in the user interface.

Create diagrams for above.