
# Obsidian Contributor Setup Guide

[https://forum.obsidian.md/t/the-easiest-way-to-setup-obsidian-git-to-backup-notes/51429](https://forum.obsidian.md/t/the-easiest-way-to-setup-obsidian-git-to-backup-notes/51429)

- [ ] Install Obsidian from [https://obsidian.md/download](https://obsidian.md/download)
- [ ] Open Obsidian

Open Settings in the bottom left corner

- [ ] Under Core Plugins
    - [ ] Search for and Turn On "Publish"
    - [ ] Create and Account
    - [ ] Send email to Aram and request access as Site Collaborator

- - [ ] Under Community Plugins, Enable them
        - [ ] Browse
        - [ ] Search for, Install, and Enable the following:

# Plugins

- Obsidian Git
- Share Note
- Setting Search
- Excalidraw

- ### Maybe Later
    
    - Dataview
    - Metadata Menu
    - Digital Garden

# Obsidian Git Sync Setup

[https://publish.obsidian.md/git-doc/Installation](https://publish.obsidian.md/git-doc/Installation)

## Install Git for MacOS

brew install git  
which -a git // to confirm

## Prompt: Best practices for configuring Git

Warp AI: When configuring Git, there are several best practices you can follow to ensure a smooth and efficient workflow. Here are some recommendations:

0. Authentic with GitHub via HTTPS and avoid the SSH setup
    
1. Set up your identity: Configure your name and email address to associate with your Git commits. Use the following commands to set your identity:
    
    ```shell
    git config --global user.name "The AI Product Guy"
    git config --global user.email "aiproductguy@pm.me"
    ```
    
2. Use a text editor: Set your preferred text editor for Git commit messages and other interactions. For example, to set Visual Studio Code as your editor, use:
    
    ```shell
    git config --global core.editor "code --wait"
    ```
    
3. Enable helpful aliases: Define aliases for commonly used Git commands to save time and improve productivity. For example, you can create an alias to show a concise and readable log:
    
    ```shell
    git config --global alias.lg "log --oneline --decorate --all --graph"
    ```
    
4. Configure line endings: Ensure consistent line endings across different platforms. For example, on macOS and Linux, set Git to use Unix-style line endings:
    
    ```shell
    git config --global core.autocrlf input
    ```
    
5. Set a default branch name: Specify a default branch name for new repositories. For example, to use "main" as the default branch name:
    
    ```shell
    git config --global init.defaultBranch main
    ```
    
6. Enable helpful Git features: Configure Git to enable useful features, such as colored output and helpful command suggestions:
    
    ```shell
    git config --global color.ui auto
    git config --global help.autocorrect 1
    ```
    
7. Use Git credential caching: Enable credential caching to avoid entering your username and password repeatedly. For example, to cache credentials for 10 hour:
    
    ```shell
    git config --global credential.helper 'cache --timeout=36000'
    ```
    
8. Customize Git log format: Tailor the output format of `git log` to your preferences. For example, to display a compact and readable log format:
    
    ```shell
    git config --global format.pretty "%C(auto)%h %C(blue)%an%C(reset) %s %C(dim white)(%ar)%C(reset)"
    ```
    

These are just a few best practices to get you started with Git configuration. Feel free to explore additional Git configuration options and customize them according to your needs.

Let me know if you need any further assistance!