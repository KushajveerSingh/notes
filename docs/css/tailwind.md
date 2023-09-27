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