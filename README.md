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

   ## Executing SQL Queries from VS Code After Initiating a Tunnel Using PuTTY

### Step 1: Set Up the SSH Tunnel with PuTTY

1. **Download and Install PuTTY**:
   - Download PuTTY from [putty.org](https://www.putty.org/).
   - Install PuTTY by following the on-screen instructions.

2. **Configure PuTTY for SSH Tunneling**:
   - Open PuTTY.
   - In the **Session** section, enter your remote server's IP address (e.g., `182.115.149.1`) and port (e.g., `5023`).
   - In the **Connection > SSH > Auth** section, click **Browse** and select your private key file (`stefan-new-private-key.ppk`).
   - In the **Connection > SSH > Tunnels** section:
     - For **Source port**, enter `3306`.
     - For **Destination**, enter `192.168.196.198:3306`.
     - Click **Add**.
     - Repeat for any additional ports if necessary.
     - Example: For **Source port** `6001`, **Destination** `localhost:6001`, click **Add**.
   - Go back to the **Session** section and save the session by entering a name under **Saved Sessions** and clicking **Save**.
   - Click **Open** to initiate the tunnel.

### Step 2: Set Up VS Code to Execute SQL Queries

1. **Install SQLTools Extension**:
   - Open Visual Studio Code.
   - Go to the Extensions view (`Ctrl+Shift+X`).
   - Search for "SQLTools" and install it.
   - You may also need the "SQLTools MySQL/MariaDB" driver extension. Install it as well.

2. **Configure SQLTools**:
   - Open the Command Palette (`Ctrl+Shift+P`).
   - Type `SQLTools: Add New Connection` and select it.
   - Fill in the connection details:
     - **Connection Name**: Any name you prefer.
     - **Driver**: MySQL/MariaDB.
     - **Server**: `127.0.0.1`.
     - **Port**: `3306`.
     - **Username**: Your MySQL username.
     - **Password**: Your MySQL password.
     - **Database**: The database you want to connect to.
   - Save the connection.
   - Note that in the .vscode folder you need to have a file `settings.json`. This file is ignored by git so not to push password to repo. 

   ```
   {
    "sqltools.connections": [
         {
               "mysqlOptions": {
                  "authProtocol": "default",
                  "enableSsl": "Disabled"
               },
               "previewLimit": 50,
               "server": "127.0.0.1",
               "port": 3306,
               "driver": "MariaDB",
               "name": "Koha prod",
               "database": "kosodertorn",
               "username": "kosodertorn",
               "password": "<add_secret_password_here>"
         }
      ]
   }
### Step 3: Execute SQL Queries

1. **Connect to the Database**:
   - Open the SQLTools extension side panel by clicking on the database icon in the Activity Bar.
   - Find your configured connection and click on the connect icon.

2. **Run SQL Queries**:
   - Open a new SQL file in VS Code (`Ctrl+N` and save it with a `.sql` extension).
   - Write your SQL queries in the file.
   - Select the queries you want to run and use the Command Palette (`Ctrl+Shift+P`) to execute them by choosing `SQLTools: Execute Query`.

### Additional Notes

- Ensure that your SSH tunnel is active while executing the SQL queries.
- If you encounter any connection issues, verify that your SSH tunnel configuration and SQLTools settings are correct.
- This setup allows you to leverage the flexibility of VS Code for writing and executing SQL queries on a remote MySQL database securely.

