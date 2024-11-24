# Submodule vs. Package

## Common Benefits

* **Reuse Code Across Projects**: Both approaches allow you to reuse code in multiple projects without duplicating it.
* **Isolate Dependencies**: Dependencies remain separate from your main codebase, whether through a submodule or a package.
* **Collaborate with Different Teams**: Both options help maintain independence in development, allowing different teams to work on different parts of a project.

## When to Use What

### Git Submodule

* Use when you need to **modify or debug** the external code within your project.
* Useful when you want to closely **track and manage the external repository** as a separate entity.

### Package

* Use when you need a **simple, stable, pre-built dependency** that doesn’t require modification.
* Ideal when you can use a **package manager** to install and manage external code.

## Adding a Git Submodule

To add a submodule to your project, run:

```bash
git submodule add git@bitbucket.org:xxx/common.git common
```

### Creating a Symbolic Link

You can create a symbolic link to the submodule's source directory with the following command:

```bash
ln -s ../common/src/common common
```

### Useful Git Submodule Alias

You can set up an alias to initialize and update submodules recursively:

```bash
alias git_submodule-init='git submodule update --init --recursive'
```
