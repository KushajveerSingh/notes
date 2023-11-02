## npm vs pnpm

### Dependency management

- `npm` - dependencies are copied.
- `pnpm` - dependencies are stored in a content-addressable store (like global node_modules) and hard-linked to the project.

### node_modules

- `npm`- All packages (dependencies and sub-dependencies) are stored at the root of the node_modules, meaning the source code has access to the sub-dependencies as well.
- `pnpm` - only the symlinks of direct dependencies are added to `node_modules`.

### Package install process

1. Dependency resolution. All required dependencies are identified and fetched to the store.
2. Directory structure calculation. The `node_modules` directory structure is calculated based on the dependencies.
3. Linking dependencies. All remaining dependencies are fetched and hard linked from the store to `node_modules`.

- `npm` - Resolving/Fetching/Linking start in stages, starting one after the other is finished.
- `pnpm` - Can be started concurrently.

### npm_config_

`pnpm` validates all options. So `pnpm install --target_arch x64` will not work, since target_arch is not a valid option.

But dependencies might use `npm_config` to define the environment variable. Two ways to handle it are

- Explicitly set the environment variable `npm_config_target_arch=x64 pnpm install`.
- Force the unknown option `--config.: pnpm install --config.target_arch=x64`.

## Running pnpm

`-C <path>` or `--dir <path>` - run as it pnpm was started in `<path>`.

`-w`, `--workspace-root` - run as it pnpm was started in the root of the workspace.

`pnpm <cmd>` - if `<cmd>` is an unknown command, then pnpm will check if there's a script with the specified name and execute it. If there is no script, then it will treat `<cmd>` as a shell script. So you can do `pnpm eslint`.

Env variables

- XDG_CACHE_HOME
- XDG_CONFIG_HOME
- XDG_DATA_HOME
- XDG_STATE_HOME

How does pnpm work with multiple drives, filesystems

`pnpm config set store-dir /path/to/.pnpm-store`.

If you have multiple drives, then a store would be created on each drive/filesystem, and from there the hard-links would be created.

When the store is set in the config, using the above command, copies would only be created when the project is on a different drive than the store.

Filtering

Used with monorepos (like you can just focus on your project, or exclude the packages from commands if they don't need to be run like testing), and also with CI/CD to only build/test/deploy the packages that have been modified. Or when you have multiple versions of the package and want to run on a specific one.

`pnpm --filter <package_selector> <command>`

- `<package_name>` - to select exact package `@scope/pkg` or use a pattern to select a set of packages `@scope/*`.
- `<package_name>...` - select package and its dependencies (direct and non-direct).

    `pnpm --filter foo... test` will run tests of `foo` and all of its dependencies.

- `<package_name>^...` - to only select the dependencies of a package (direct and non-direct).

    `pnpm --filter foo^... test` will run tests for all of foo's dependencies.
- `...<package_name>` - select package and its dependent packages (direct and non-direct).

    `pnpm --filter ...foo test` - run tests of foo and all packages dependent on it.
- `...^<package_name>` - select only a package's dependents (direct and non-direct).

    `pnpm --filter ...^foo test` - run tests for all packages dependent on foo.
- `"[<since>]"` - select all packages changed since the specified commit/branch. Can be suffixed or prefixed with `...` to include dependencies/dependents.

    `pnpm --filter "...[origin/master]" test` - run tests in all changed packages since `master` and on any dependent packages.

    `pnpm --filter "...{HEAD-1}" test` - to test packaghes changed since last commit, and all its dependants.

- `./<glob>`, `{<glob>}` - provide a glob pattern relative to the current working directory. `...` can be used, `"[<since>]"` can be used.

    - `pnpm filter "./packages/**" <cmd>` - includes all projects under the specified directory.
    - `pnpm --filter ...{<directory>}... <cmd>` - to select dependent/dependencies.
    - `pnpm --filter "{packages/**}[origin/master]" <cmd>`
    - `pnpm --filter "...{packages/**}[origin/master]..." <cmd>`
    - `pnpm --filter "...@babel/*{components/**}[origin/master]" <cmd>` - select all packages from a directory with names matching the given pattern.

Excluding packages

Use a leading `!` with any of the patterns. (In most shells `!` would need to be escaped using `\!`).

Multiple filters

Can be specified by adding `--filter`. `pnpm --filter ...foo --filter bar --filter baz... test`.

`--filter-prod` - same as `--filter` but omits `devDependencies` when selecting dependency projects.

`--test-pattern <glob>` - when checking for modified files, you can specify which files to check for using `--test-patterns`. This is useful because changes to test files typically do not affect the functionality of the packge and thus running tests on packages is a waste.

`pnpm --filter="...[origin/master]" --test-pattern="test/*" test` - If the changes are only in `test/*`, then pnpm will not run, as pnpm will assume those are just test files.

`--changed-files-ignore-pattern <glob>` - provide files that should not be checked when checking for modified files.

`pnpm --filter="...[origin/master]" --changed-files-ignore-pattern="**/README.md" run build`

`devPreInstall` - `scripts` in package.json can include this

- Runs only on local `pnpm install`
- Runs before any dependency is installed.

Usage can include

- Checking for required global dependencies or versions before proceeding with the install.
- Setting up or validating environment variables that are necessary for the installation.
- Running any preliminary checks or setup tasks that need to be in place for the development environment before dependencies are pulled in.


CLI commands