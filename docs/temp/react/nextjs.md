---
title: Next.js
---

Install `npx create-next-app@latest`.

## Rendering

### Server-Side Rendering (SSR)
1. All data for a given page is fetched on the server.
2. The server then renders the HTML for the page.
3. The HTML, CSS, JS for the page are sent to the client.
4. A non-interactive user interface is shown using the generated HTML, CSS.
5. Finally, React hydrates the user interface to make it interactive.

If the data takes long time to load, then the website would be not interactive. To resolve this issue **Streaming** is used

- Since the UI is broken into React components (chunks), the chunks that do not depend on data or with high priority can be sent first. This includes sending the `layout` first.
- Low priority chunks like product reviews, related products can be sent later.
- In short, Streaming prevents long data requests from blocking the page from rendering.
- To implement this use `<Suspense>`
- Also, internally streaming would only start after all the data for `generateMetadata` is fetched, so as to include the `<head>` tags.

    ```tsx
    import { Suspense } from 'react';

    export default function Posts() {
      return (
        <section>
          <Suspense fallback={<p>Loading feed...</p>}>
            <PostFeed />
          </Suspense>
          <Suspense fallback={<p>Loading weather...</p>}>
            <Weather />
          </Suspense>
        </section>
      )
    }
    ```

## Routing
- `app/page.tsx` - maps to `/`.
- `app/dashboard/page.tsx` - maps to `/dashboard`. (static route)
- `app/blog/[slug]/page.tsx` - maps to `/blog/a`, `/blog/b` (dynamic routes)
- `app/blog/[...slug]/page.tsx` - maps to `/blog/a`, `/blog/a/b` (catch-all segments)
- `app/blog/[[...slug]]/page.tsx` - maps to `/blog`, `/blog/a`, `/blog/a/b` (optional catch-all segments)
- `app/@team/members` - used to define parallel routes.
- `page.js` defines the leaf node in the route hiearchy and makes that URL publickly accessible.

### Linking and Navigating
Use `<Link>` instead of `<a>` to get prefetching and client-side navigation between routes.
```tsx
import Link from 'next/link';

export default function Page() {
  // Static links
  return <Link href="/dashboard">Dashboard</Link>;

  // Dynamic Links
  return (
    <ul>
      {posts.map((post) => (
        <li key={post.id}>
          <Link href={`/blog/${post.slug}`}>{post.title}</Link>
        </li>
      ))}
    </ul>
  );
}
```

To check if the current path is active use `usePathname`.
```tsx
'use client';

import { usePathname } from 'next/navigation';
import Link from 'next/link';

export function Links() {
  const pathname = usePathname();

  return (
    <nav>
      <ul>
        <li>
          <Link className={`link ${pathname === '/' ? 'active' : ''}`} href="/">Home</Link>
        </li>
      </ul>
    </nav>
  );
}
```

When a `<Link>` tags becomes visible in the viewport, it is prefetches (if it is static route). For dynamic routes, only the shared layout and `loading.tsx` is prefetched and cached for 30s. To programmatically control the behavior of Link and caching use `useRouter()` hook.

Also, the scroll position is preserved between forwards and backwards navigation.

### Route groups
This allows you to organize files into folders, without affecting the route URL. Let's say you have a file `app/marketing/about/page.js` which would be renderd at `/marketing/about`.

But if you want to exclude `marketing` from the route name, you can wrap it in brackets as `app/(marketing)/about/page.js` and then it would be rendered at `/about`.

This allows to organize route segments and project files into logical groups without affecting the URL path structure.

### Dynamic routes
Wrap folder name in square brackets like `[id]`, and these are passed as `params` to layout, page, route, generateMetadata functions.

To generate routes dynamically every time a request is made use this
```tsx title="app/blog/[slug]/page.tsx"
type TypePage = {
  params: {
    slug: string;
  };
}

export default function Page({ params }: TypePage) {
  const slug = params.slug;
} 
```

To generate routes during build time use this
```tsx title="app/blog/[slug]/page.tsx"
export async function generateStaticParams() {
  const posts = await fetch('...').then((res) => res.json());

  return posts.map((post) => ({
    slug: post.slug,
  }));
}
```

### Parallel routes
Simulaneously or conditionally render one or more pages in the same layout, which is useful on highly dynamic sections of an app like dashboards and feeds (you can simultaneously render the team and analytics page), and this also includes conditional slots based on authentication state.

Define a folder starting with `@`.
```
app
- @analytics
    - page.js
    - error.js
- @team
    - page.js
- layout.js
- page.js
```

In the above case `app/@analytics/page.js` gets routed to `/` as parallel routes do not affect URL structure.

Now you can load both the slots in parallel in `layout.js`.

```tsx title="app/layout.tsx"
type TypeProps = {
  children: React.ReactNode;
  analytics: React.ReactNode;
  team: React.ReactNode;
};

export default function Layout(props: TypeProps) {
  return (
    <>
      {props.children}
      {props.team}
      {props.analytics}
    </>
  );
}
```

For conditional routing it is the same logic
```tsx title="app/layout.tsx"
...

export default function Layout({ dashboard, login }) {
  ...
  return isLoggedIn ? dashboard : login;
}
```

To know which route segment is active you can use this code
```tsx title="app/layout.tsx"
import { useSelectedLayoutSegment } from 'next/navigation';

export default async function Layout(props) {
  // If the user naviagtes to "@auth/login", or "/login" in the URL bar
  // `loginSegments` will be equal to the string 'login'
  const loginSegments = useSelectedLayoutSegment('auth');
}
```

You can also define a `default.js` file to render as a fallback in case Next.js cannot recover a slot's active state based on the current url.

## Special Files
- `layout.tsx` - Shared UI for a segment (directory) and its children. On navigation, layouts preserve state, remain interactive, and do no re-render.
- `page.tsx`- Unique UI of a route and make routes publicly accessible
- `loading.tsx` - Loading UI for a segment and its children
- `not-found.tsx` - Not found UI for a segment and its children
- `error.tsx` - Error UI for a segment and its children
- `global-error.tsx` - Global Error UI
- `route.tsx` - Server side API endpoint
- `template.tsx` - Specialized re-rendered Layout UI
- `default.tsx` - Fallback UI for parallel routes

Internally these are rendered as
```tsx
<Layout>
  <Template>
    <ErrorBoundary fallback={<Error />}>
      <Suspense fallback={<Loading />}>
        <ErrorBoundary fallback={<NotFound />}>
          <Page />
        </ErrorBoundary>
      </Suspense>
    </ErrorBoundary>
  </Template>
</Layout>
```

### RootLayout
`app/layout.tsx` should contain `RootLayout` and it defines `<html>`, `<body>` tags, shared across all pages in an application.

```tsx
type TypeRootLayout = {
  children: React.ReactNode;
};

export default function RootLayout({ children }: TypeRootLayout) {
  return (
    <html lang="en">
      <body>
        {children}
      </body>
    </html>
  )
}
```

### Layout
```tsx
type TypeDashboardLayout = {
  children: React.ReactNode;
};

export default function DashboardLayout({ children }: TypeDashboardLayout) {
  return (
    <section>
      <nav></nav>
      {children}
    </section>
  )
}
```

### Loading
`loading.tsx` creates loading UI with React Suspense. This is shown while the content of a route segment loads. The new content is automatically swapped in once rendering is complete. Also, the loading can be interrupted if navigating to another page.

```tsx title="app/dashboard/loading.tsx"
export default function Loading() {
  return "Loading..."
}
```

Internally this gets translated to
```tsx
<Layout>
  <Suspense fallback={<Loading />}>
    <Page />
  </Suspense>
</Layout>
```

### Error
Use `error.js` to handle unexpected runtime errors. This has the benefit
- Create a specific UI for the error.
- Isolate errors to affected segments while keeping the rest of the application functional.
- Add functionality to attempt to recover from an error without a full page reload.

```tsx
'use client';

import { useEffect } from 'react';

type TypeError = {
  error: Error;
  reset: () => void;
};

export default function Error({ error, reset }: TypeError) {
  useEffect(() => {
    // log the error
    console.log(error);
  }, [error]);

  return (
    <div>
      <h2>Something went wrong!</h2>
      {/* Rerender the component and see if that works. */}
      <button onClick={() => reset()}>Try again</button>
    </div>
  );
}
```

Internally, it uses React error boundary as
```
<Layout>
  <ErrorBoundary fallback={<Error />}>
    <Page />
  </ErrorBoundary>
</Layout>
```

### Global Error
`error.js` does not catch errors thrown in `layout.js` or `template.js` in the same folder. This keeps the layout interactive when an error with a component occurs.

To handle erros for `layout.js` or `template.js`, place an `error.js` file in parent folder.

TO handle errors for the root `layout` or `template` file create `app/global-error.js`. You would rarely reach this error boundary, but it is a good practice to still define this file, and include globally shared UI and branding.

## Metadata
Do not use `<head>` tags, because the next solutions handle de-duplication and streaming.

### Use metadata object
In `layout.tsx` or `page.tsx`.
```tsx
import type { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'Title',
  description: '',
}
```

### Generate metadata dynamically
In `layout.tsx` or `page.tsx`.
```tsx
import type { Metadata, ResolvingMetadata } from 'next';

type Props = {
  params: { id: string };
};

export async function generateMetadata(
  { params }: Props,
  parent: ResolvingMetadata
): Promise<Metadata> {
  // Read route params
  const id = params.id;

  // fetch data
  const product = await fetch('...').then((res) => res.json());

  // Access parent metadata
  const previousImages = (await parent).openGraph?.images || [];

  return {
    title: product.title,
    openGraph: {
      images: ['/page-specific-image.jpg', ...previousImages],
    },
  };
}
```

## API routes
Next.js supports creating `route.ts` (the directory should not contain `page.js`) files to define HTTP methods (GET, POST, PUT, PATCH, DELETE, HEAD, OPTIONS). This is the same as defining these routes in Express. The main difference is when you use Express, you have to host a dedicated server that needs to be running all the time. But Next.js uses AWS Lambda (serverless functions) for this.

You still need API routes. Consider these two cases
- Server side components - These can directly make the backend calls, as the server code is never shown to the client.
- Client side components - These can directly make the backend calls, but this might requrie sharing some sensitive info to the client. For this reason, you make the call the "API Route" created by Next.js which then makes the call to your backend.

