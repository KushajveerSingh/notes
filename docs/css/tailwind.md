---
title: Tailwind CSS
---

## Tools
- VsCode [Tailwind CSS IntelliSense](https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss) plugin.
- Prettier plugin for sorting class names. Install it using `npm install -D prettier prettier-plugin-tailwindcss` and then add it to `prettier.config.js`

    ```js
    module.exports = {
      plugins: ['prettier-plugin-tailwindcss'],
    }
    ```

## Pseudo classes
- `hover:bg-white` - style an element when the user hovers over it with the mouse cursor.
- `focus:border-blue-400` - style an element that is targeted/activated by keyboard/mouse.
- `focus-within:shadow-lg` - style an element when it or one of its descendants has focus.
- `focus-visible:ring` - style an element when it has been focused using the keyboard .
- `active:bg-blue-600` - style an element when it is being pressed.
- `visited:text-purple-600` - style a link when it has already been visited. (use with `<a>` tag)
- `target:shadow-lg` - style and element if its ID matches the current URL fragment.
- `first:pt-0` - style an element if it's the first child (apply on `<li>`).
- `last:pb-0` - style an element if it's the last child (apply on `<li>`).
- `only:py-0` - sytle an element if it's the only child (apply on `<li>`).
- `odd:bg-gray-100` - style an element if it's an oddly numbered child (apply on `<li>`).
- `even:bg-gray-100` - style an element if it's an evenly numbered child.
- `first-of-type:ml-6` - style an element if it's the first child of it's type.
- `last-of-type:mr-6` - style an element if it's the last child of it's type.
- `only-of-type:mx-6` - style an element if it's the only child of it's type.
- `empty:hidden` - style an element if it has no content.
- `disabled:opacity-75` - style an input when it's disabled (apply on `<input>`).
- `enabled:hover:border-gray-400` - style an input when it's enabled (apply on `<input>`). Used when you want to apply another style when element is not disabled.
- `checked:bg-blue-500` - style a checkbox or radio button when it's checked.
- `indeterminate:bg-gray-300` - style a checkbox or radio button in an indeterminate state.
- `default:ring-2` - style an option, checkbox or radio button that was the default value when the page initially loaded.
- `required:border-red-500` - style an input when it's required.
- `valid:border-green-500` - style an input when it's valid.
- `invalid:border-red-500` - style an input when it's invalid.
- `in-range:border-green-500` - style an input when it's value is within a specified range limit.
- `out-of-range:border-red-500` - style an input when it's value is outside of a specified range limit.
- `placeholder-shown:border-gray-500` - style an input when the placeholder is shown.
- `autofill:bg-yellow-200` - style an input when it has been autofilled by the browser.
- `read-only:bg-gray-100` - style an input when it is read-only.

### Style based on parent state
When you need to style an element based on the state of some parent element, mark the parent with `group` class and use `group-*` modifier to style target elements.
```html
<a class="group hover:bg-blue-500">
  <p class="group-hover:text-white">Some text</p>
</a>
```

For nested groups, assign a name to group using `group/{name}` and then reference it using `group-hover/{name}`.
```html
<li class="group/item hover:bg-slate-100">
  <a class="group/edit">
    <span class="gropu-hover/edit:text-gray-700">Call</span>
  </a>
</li>
```

### Style based on sibling state
When you need to style an element bsaed on the state of sibling element (only previous siblings can be used), mark the sibling with the `peer` class, and use `peer-*` modifier to style target element.
```html
<label>
  <input type="email" class="peer">
  <p class="invisible peer-invalid:visible">Please provide a valid email.</p>
</label>
```

Peers can be names as `peer/{name}` and used in the same way as groups.

## Pseudo elements
- `before:` - create a pseudo element that is the first child of the selected element.
- `after:` - create a pseudo element that is the last child of the selected element.

    Tailwind automatically adds `content: ''` for these, but you can change it using `after:content-['*']`
    ```html
    <span class="after:content-['*'] after:ml-05">
      Email
    </span>
    ```

    These are not used that often in Tailwind projects, as it is easier to write the real element. Use it when it's important that the content of the pseudo element is not actually in the DOM and can't be selected by the user.

- `placeholder:italic` - style the placeholder text of any input.
- `file:mr-4` - style the button in file inputs `<input type="file">`.
- `marker:text-sky-400` - style the counters or bullets in lists. Can be applied to parent to avoid repeating the styles for each `<li>`.
- `selection:bg-fushsia-300` - style the active text selection. Can be applied to parent, and this allows you to set this style for your entire site from `<body>`.
- `first-line:uppercase` - style the first line in a block of content.
- `first-letter:text-7xl` - style the first letter in a block of content.
- `backdrop:bg-gray-50` - style `<dialog>` element.

## Media queries

### prefers-color-scheme
Add `dark:` modifier to all tailwind classes to set them for dark mode. By default, the classes point to the light mode. This value is set at the operating system level.

### prefers-reduced-motion
Add styles when the user has requested reduced motion.     
- `motion-reduce:hidden`. Add styles when the user has requested reduced motion. Using this can be a lot of work, as you have to "undo" a lot of styles as shown below
    ```html
    <button class="hover:-translate-y-0.5 transition motion-reduce:hover:translate-y-0 motion-reduce:transition-none">
        Save changes
    </button>
    ```
- `motion-safe:hover:-translate-x-0.5` - Use this instead, so that the styles are only applied when the user has not requested reduced motion.

### prefers-contrast
Tells if the user has requested more or less contrast.
- `contrast-more:opacity:100 opacity-10` - add styles when the user has requested more contrast.
- `contrast-less:` - add styles when the user has requested less contrast.

### Viewport orientation
Add styles when the viewport is in a specific orientation. Although, your site might be fully responsive, but these are important to handle changes in aspect ratio of the screen. Like in landscape mode you have fewer horizontal pixels, and would have to adjust the element according to that, and responsive design cannot handle that.
- `portrait:hidden`
- `landscape:hidden`

### Print
Add styles that only apply when the document is being printed `print:hidden`.

### Support rules
Style elements based on whether a feature is supported in the user's browser.
```html
<div class="flex supports-[display:grid]:grid"></div>

<!-- Check for specific properties -->
<div class="bg-black/75 supports-[backdrop-filter]:bg-black/25"></div>
```

Shortcuts can be configured in `tailwind.config.js` for the common`@support` rules
```js
theme: {
    supports: {
    grid: 'display: grid',
    }
}
```

And then use the shortcuts as
```html
<div class="supports-grid:grid"></div>
```

## Attribute selectors

### Data attributes
Use `data-*` to conditionally add styles based on data attributes.
```html
<div data-size="large" class="data-[size=large]:p-8 data-[size-medium]:p-10">
```

Shortcuts for common data attributes can be configured in `tailwind.config.js`
```js
theme: {
    data: {
    checked: 'ui~="checked"',
    }
}
```

And then use the shortcuts as
```html
<div data-ui="checked active" class="data-checked:underline">
```

### RTL support
Can be configured using `rtl`, `ltr`. To use these set `<html dir="ltr">`.

### open
conditionally add styles when a `<details>`, `<dialog>` element is in open state.
```html
<details class="open:bg-white">
</details>
```

### Aria attributes
Use `aria-*` to conditionally style things based on ARIA attributes.
- `aria-checked`
- `aria-disabled`
- `aria-expanded`
- `aria-hidden`
- `aris-pressed`
- `aria-readonly`
- `aria-required`
- `aria-selected`

The above boolean `aria` modifiers are included by default. To add more add them in `tailwind.config.js`
```js
theme: {
    extend: {
    asc: 'sort="ascending"',
    }
}
```

You can also define these aria attributes in the HTML itself, in case they take specific values
```html
<th
    aria-sort="ascending"
    class="aria-[sort=ascending]:bg-[url('/img/down-arrow.svg')]
            aria-[sort=descending]:bg-[url('/img/up-arrow.svg')]"
>
```

Parent and sibling elements can also be targetted using `group-aria-*` and `peer-aria-*`.
```html
<th aria-sort="ascending" class="group">
    <svg class="group-aria-[sort=ascending]:rotate-0 group-aria[sort=descending]:rotate-180"></svg>
</th>
```

### CSS selectors
```html
<li class="[&:nth-child(3)]:underline">Item</li>

<!-- These can be stacked like regular modifiers -->
<li class="lg:[&:nth-child(3)]:hover:underline">Item</li>
```