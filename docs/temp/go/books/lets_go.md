---
title: Let's Go
---

## Creating a module
1. Create a directort for your project `mkdir snippetbox`.
2. Convention is to use your URL as the module path i.e. `${project_name}.{your_domain}`, for example `snippetbox.kushajveersingh.com`.

    If the project is supposed to be downloaded by other people, then the location from where the project can be downloaded should be the module path, for example `github.com/foo/bar`.

3. Run `go mod init snippetbox.kushajveersingh.com` in the directory to convert it into a module.

    It will create `go.mod` file with the following contents
    ```
    module snippetbox.kushajveersingh.com

    go 1.21.1
    ```

## Hello world example
1. Create `main.go` with the content

    ```go
    package main

    import "fmt"

    func main() {
        fmt.Println("Hello, World!")
    }
    ```

2. Run it using `go run .`.

    This command compiles your code, creates an executable binary in `/tmp`, and then runs the binary. It can accept directory path, go file path, module path. So the next three commands are equivalent
    
    ```bash
    go run .
    go run main.go
    go run snippetbox.kushajveersingh.com
    ```

3. To format the code run `go fmt` and it will format all the files in the directory.

## Web application basics
We need three components

- *Handler* - similar to controllers in MVC. It's job is to execute application logic and write HTTP reponse headers and bodies.
- *Router*/*servemux* - It stores a mapping between the URL patterns for your application adn the corresponding handlers.

    **Note**:- Go also provides a default router called `http.DefaultServeMux`. Do not use it, as it is less explicit.

    Two type of URL patterns are supported

    - *Fixed paths* (do not end with `/`, like `/snippet/create`) - the URL should exactly match for the handler function to be invoked.
    - *Subtree paths* (that end with `/`, like `/`, or `/static/`) - if the start of the URL matches the pattern, then the handler function is invoked.

    In case multiple patterns match the URL, then the longer pattern takes percedence.

    Request URLs are also sanitized to handle `.`, `..`, remove extra `/`. For example, `/foo/bar/..//baz` sends a `301 Permanent Redirect` to `/foo/baz`.

    If a subtree path has been registred (say `/foo/`), then the request for `/foo`, would be redirected with `301 Permanent Redirect` to `/foo/`.

    You can further redirect host names also, and this is why you don't need Nginx, Apace

    - In this case, when a request is received, the host name routes would be checked first.
    - If no match is found, then only non-host name routes would be checked.

        ```go
        mux := http.NewServeMux()
        mux.HandleFunc("foo.example.org/", fooHandler)
        mux.HandleFunc("bar.example.org/", barHandler)
        mux.HandleFunc("/baz", bazHandler)
        ```

- *Web server* - In Go, this is part of the application itself, and you don't need an external third-party server like Nginx, Apache.

```go
package main

import (
	"log"
	"net/http"
)

// Define Home handler
func home(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Hello, World!"))
}

func main() {
	// Define router
	mux := http.NewServeMux()
	// Note: "/" is a catch-all i.e. it will match all the URL paths
	mux.HandleFunc("/", home)

	log.Print("Server starting on: 4000")

	// Start web server.
	// The format is host:port, so you do
	// - ":4000" - "localhost:4000"
	// - ":http" or ":http-alt" - in this case the port will be looked in `/etc/services`
	err := http.ListenAndServe("127.0.0.1:4000", mux)
	log.Fatal(err)
}
```

Internal details

- All incoming HTTP requests are handled concurrently (in parallel), and this means you need to be aware of (and protect against) race conditions when accessing shared resources from your handlers.
- `mux.HandleFunc` is a shorthand for converting any function to a handler. This works by adding a `ServeHTTP()` method to the function. So below two pieces of code are equivalent

    ```go
    mux.Handle("/", http.HandlerFunc(home))
    mux.HandleFunc("/", home)
    ```

## Restrict the root url pattern
If you do not want `"/"` to act as a catch-all, and display a `404 page not found` response for all invalid routes, modify the home handler. You cannot modify the behavior of servemux.

```go
func home(w http.ResponseWriter, r *http.Request) {
	// Use "/" only for the home page
	if r.URL.Path != "/" {
		http.NotFound(w, r)
		return
	}

	w.Write([]byte("Hello from Snippetbox"))
}
```

## Customize HTTP headers
`/snippet/create` should only respond to HTTP requests with `POST` method. Also, we will add the info that only POST requests are allowed in the HTTP response.

```go
func snippetCreate(w http.ResponseWriter, r *http.Request) {
	if r.Method != "POST" {
		// Add "Allow: POST" header to response header map
		w.Header().Set("Allow", "POST")
		w.WriteHeader(405) // Can only be called once per response
		w.Write([]byte("Method Not Allowed"))
		return
	}

	w.Write([]byte("Create a new snippet..."))
}
```

Now you can test it using `curl -i -X POST http://localhost:4000/snippet/create`, and the response is
```
HTTP/1.1 200 OK
Date: Sat, 23 Sep 2023 21:59:37 GMT
Content-Length: 23
Content-Type: text/plain; charset=utf-8

Create a new snippet...
```

Or if you try a `GET` request the response it
```
❯ curl -i -X GET http://localhost:4000/snippet/create
HTTP/1.1 405 Method Not Allowed
Allow: POST
Date: Sat, 23 Sep 2023 22:00:05 GMT
Content-Length: 18
Content-Type: text/plain; charset=utf-8

Method Not Allowed
```

In practice, you rarely use `w.Write`, `w.WriteHeader` directly. Instead, you use `http.Error` for the above example. Also, use `http.MethodPost` instead of the string `POST` and `http.StatusMethodNotAllowed` instead of the integer constant `405` (these help avoid runtime error, and act as self documentation).

```go
func snippetCreate(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		w.Header().Set("Allow"golang projects 
```

By default, Go sets three system-generated headers with every response
- `Date`
- `Content-Length`
- `Content-Type` - Go uses `http.DetectContentType()` function for this and uses `application/octet-stream` as the fallback. This function cannot distinguish text from json. So for JSON response you have to set it manually using `!#go w.Header().Set("Content-Type", "application/json")`.

To remove the system-generated headers, set their values to `nil` directly in the header map
```go
w.Header()["Date"] = nil
```

Modify the HTTP header map using these functions
```go
// Create a new "Cache-Control" or overwrite an existing one
w.Header().Set("Cache-Control", "public, max-age=3153")

// Appends a new "Cache-Control" header
w.Header().Add("Cache-Control", "public")
w.Header().Add("Cache-Control", "max-age=3153")

// Delete all values for "Cache-Control" header
w.Header().Del("Cache-Control")

w.Header().Get("Cache-Control")

// Retrieve a slice of all values for "Cache-Control" header
w.Header().Values("Cache-Control")
```

`Cache-Control` in the above example is case-insenstiive, as Go uses `textproto.CanonicalMIMEHeaderKet()` to convert the header string to the correct format. For HTTP/2, it converts everything to lowercase. If you do not want this behavior, then you can edit the header map directly as
```go
w.Header()["X-XSS-Protection"golang projects , but not we can pass variables also
	// Calls `w.Write` internally.
	fmt.Fprintf(w, "Display a specific snippet with ID %d...", id)
}
```

## Project structure
[https://github.com/thockin/go-build-template](https://github.com/thockin/go-build-template) is a good reference.

For our simple project we can use this structure
```
.
├── cmd
│   └── web
│       ├── handlers.go
│       └── main.go
├── go.mod
├── internal
└── ui
    ├── html
    └── static
```

- `cmd` - contain application-specific code for the executable applications in the project. For now, we only have one executable application (the web application) at `cmd/web`.

    If in the future you want to add an CLI application to automate some admin functions you can create that at `cmd/cli`.

- `internal` - non-application-specific code (like utils). This can include validation helpers, SQL database models.

    `internal` directory also has a special behavior. Any code inside this directory, can be imported by code inside the *parent of the* `internal` directory i.e. packages inside `internal` can only be imported by code inside `snippetbox` directory. So now people cannot use your GitHub code directly and have to import it from a package.

- `ui` - user interface assets used by the web application.

## Create HTML templates

If you are just using a single HTML file without a template use these steps.

Create `ui/html/pages/home.tmpl.html` file with all your HTML content. Here `.tmpl` is just used to signify that it is a template file (it does nothing special).

Then invoke if from the required handler
```go
package main

import (
	"fmt"
	"html/template"
	"log"
	"net/http"
}

func home(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path != "/" {
		http.NotFound(w, r)
		return
	}

    // The path here can be absolute or relative
	ts, err := template.ParseFiles("./ui/html/pages/home.tmpl.html")
	if err != nil {
		log.Print(err.Error())
		http.Error(w, "Internal Server Error", http.StatusInternalServerError)
		return
	}

    // Pass dynamic data to the template using the second argument
	err = ts.Execute(w, nil)
	if err != nil {
		log.Print(err.Error())
		http.Error(w, "Internal Server Error", http.StatusInternalServerError)
	}
}
```

If you are defining tempalates, then use these steps.

For HTML, you can define base templates and reuse them across pages

- `{{define "base"}}` to mark start of a named template, and `{{end}}` to mark the end.
- `{{tempalte "title" .}}`, `{{template "main" .}}` - to invoke named templates called 'title' and 'main'. The dot here represent any dynamic data you want to pass to the template.
- Define partials (reusable bits of HTML for different pages) in `ui/html/partials`.
- Tempaltes can further define blocks, that be used to modify the code inside template. So the template can define a default sidebar, and then pages can modify it if needed.

    ```html
    {{define "base"}}
        <h1>An example template</h1>
        {{block "sidebar" .}}
            <p>
                My default sidebar content. If you want to modify it, then just
                include "sidebar" tempalte and this would get overwritten.
            </p>
        {{end}}
    {{end}}
    ```

Define a partial for navigation in `ui/html/partial/nav.tmpl.html`
```html
{{define "nav"}}
<nav>
  <a href="/">Home</a>
</nav>
{{end}}
```

Define the base template in `ui/html/base.tmpl.html` (and invoke the partial just like a normal template)
```html
{{define "base"}}
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>{{tempalte "title" .}} - Snippetbox</title>
  </head>
  <body>
    {{template "nav" .}}
    <main>{{template "main" .}}</main>
  </body>
</html>
{{end}}
```

Define the home template now `ui/html/pages/home.tmpl.html` (define the named templates, that you want to use inside the base template)
```html
{{define "title"}} Home {{end}}

{{define "main"}}
<h2>Latest Snippets</h2>
<p>There's nothing to see here yet.</p>
{{end}}
```

Update the handler code to parse both template files
```go
func home(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path != "/" {
		http.NotFound(w, r)
		return
	}

	files := []string{
		"./ui/html/base.tmpl.html",
        "./ui/html/partials/nav.tmpl.html",
		"./ui/html/pages/home.tmpl.html",
	}

	ts, err := template.ParseFiles(files...)
	if err != nil {
		log.Print(err.Error())
		http.Error(w, "Internal Server Error", http.StatusInternalServerError)
		return
	}

	// We have three templates now "base", "title", "main", "nav" and we have to
	// specify which template to respond with.
	err = ts.ExecuteTemplate(w, "base", nil)
	if err != nil {
		log.Print(err.Error())
		http.Error(w, "Internal Server Error", http.StatusInternalServerError)
	}
}
```

## Handle static files
To host static files like images/css/js, create a file server using `http.FileServer`, and you need to create a route `/static/` for that.

Add the handler to the router
```go
mux := http.NewServeMux()

// Create file server to serve files from "./ui/static"
fileServer := http.FileServer(http.Dir("./ui/static"))
// Need to strip the prefix since, otherwise the file server would see
// the path "/static/.ui/static/" which is incorrect, as the path should
// be "./ui/static/"
mux.Handle("/static/", http.StripPrefix("/static", fileServer))
```

Now you can use static assets in your HTML by refering the path `/static/`. For example
```html
<link rel="stylesheet" href="/static/css/main.css" />
<script src="/static/js/main.js" defer></script>
```

Also, you can go to `localhost:4000/static` to see the FTP server.

Extra features of `http.FileServer`
- Sanitizes request path using `path.Clean()` before searching for a file to remove any `.`, `..` from the url path, which helps to stop directory traversal attacks.
- "Range requests" are supported to allow resuamble downloads. For example, you can request bytes 100-199 of the `logo.png` `curl -i -H "Range: bytes=100-199" --output - http://localhost:4000/static/img/logo.png`.
- Supports `Last-Modified` and `If-Modified-Since` headers. This means if the file hasen't changed since the user last requested it, then `304 Not Modified` would be sent.
- `Content-Type` is automatically set using the file extension. And to add custom extensions you can use `mime.AddExtensionType()`.

### Serve files from a handler
To serve a specific file in response to a request. This is useful for
- Dynamic File Serving - determine the file to serve based on some logic
- Access Control - serve the file only if the user is authorized
- Logging and monitoring
- Modification of reponse headers before sending the file.

```go
func downloadHandler(w http.ResponseWriter, r *http.Request) {
    http.ServeFile(w, r, "./ui/static/file.zip")
}
```

### Disable directory listing
Solution 1.
- If you naviagte to `/static`, then all the files inside the directory would be listed. But you can prevent this by adding an empty `index.html` files inside `static` folder, and now this would be shown instead of directory listing.
- Now if you navigate to `/static/js`, then it would still list all the files in that directory.
- So you have to add `index.html` to all the directories and that can be done using `find ./ui/static -type d -exec touch {}/index.html \;`.
- This solution would send `200 OK` response.

A better solution is to create a custom FileServer
```go
    mux := http.NewServeMux()

    // Use this logic to prevent directory listing, restrict access to files
    // and logging (log everytime a file is requested)
    fileServer := http.FileServer(neuteredFileSystem{http.Dir("./static")})
    mux.Handle("/static", http.NotFoundHandler())
    mux.Handle("/static/", http.StripPrefix("/static", fileServer))

type neuteredFileSystem struct {
	fs http.FileSystem
}

func (nfs neuteredFileSystem) Open(path string) (http.File, error) {
	f, err := nfs.fs.Open(path)
	if err != nil {
		return nil, err
	}

	s, err := f.Stat()
	if err != nil {
		return f, nil
	}

	if s.IsDir() {
		// If "index.html" file exists in the directory, then render it
		index := filepath.Join(path, "index.html")
		if _, err := nfs.fs.Open(index); err != nil {
			closeErr := f.Close()
			if closeErr != nil {
				return nil, closeErr
			}

			return nil, err
		}
	}

	return f, nil
}
```

continue from 03.01-managing-configuration-settings.html