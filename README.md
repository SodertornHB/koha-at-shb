# Koha resourses at Södertörn University library

Here we have gathered resourses used when working with ILS Koha at Södertörn University library. 

## Content

### Sql queries 

Here we store sql queries to use with Koha 

### Sqripts 

Nothing here yet 

## Getting data from Github

### Prerequisit: Install Git

1. Download Git for Windows from [git-scm.com](https://git-scm.com/download/win).
2. Run the installer and follow the on-screen instructions. Make sure to select "Use Git from the Windows Command Prompt" during the installation.

## Clone repository 

`git clone https://github.com/SodertornHB/koha-at-shb.git` 

## Instructions for Setting Up and Pushing Code to GitHub

Follow these steps to set up your environment, create a Personal Access Token (PAT), and push code to GitHub.

### 1. Install Visual Studio Code

1. Download Visual Studio Code from [code.visualstudio.com](https://code.visualstudio.com/).
2. Run the installer and follow the on-screen instructions to complete the installation.

### 2. Create account in GitHub

1. Create an account in GitHub 
1. Join the [Södertörn University Library organization in GitHub](https://github.com/SodertornHB). 

### 3. Create a Personal Access Token (PAT) in GitHub

1. Go to [github.com](https://github.com) and log in to your account.
2. Click on your profile picture in the upper-right corner and select **Settings**.
3. In the left sidebar, click **Developer settings**.
4. Click **Personal access tokens**, then **Tokens (classic)**.
5. Click **Generate new token**.
6. Give your token a descriptive name and select the scopes or permissions you want to grant this token. Ensure you select the `repo` scope.
7. Click **Generate token** and copy the token. **This will be shown only once, so save it somewhere secure**.

### 4. Clone the Repository

1. Open Visual Studio Code.
2. Open the Command Palette (`Ctrl+Shift+P` or `Cmd+Shift+P`).
3. Type `Git: Clone` and select it.
4. Enter the HTTPS URL of your GitHub repository:
   ```plaintext
   https://github.com/SodertornHB/koha-at-shb.git
5. Choose a local directory to clone the repository.

### 5. Configure PAT in Git Config

1. Open the integrated terminal in VS Code (``Ctrl+` ``).
2. Navigate to your repository’s root directory.
3. Open the `.git` folder (note that this is a hidden folder).
4. Edit the `.git/config` file and update the `[remote "origin"]` section with your PAT:
   ```plaintext
   [remote "origin"]
       url = https://stefan-sh:YOUR_PAT_HERE@github.com/SodertornHB/koha-at-shb.git
       fetch = +refs/heads/*:refs/remotes/origin/*
### 6. Update Code

1. Create or modify files in the repository using Visual Studio Code.
2. Save your changes.

### 7. Stage, Commit and Push Changes

1. In the VS Code Source Control view (icon with branches), click the `+` icon next to the files you want to stage, or use the terminal:
   ```bash
   git add .
   git commit -m "Your commit message"
   git push origin main
