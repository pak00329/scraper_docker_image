# Python App Docker Setup

This repository provides a Dockerized setup for running Python applications with dynamic dependency installation and script execution. The Dockerfile is designed to install dependencies at runtime and allows you to specify the entry-point script via an environment variable.

---

## Features

- **Runtime Dependency Installation**: Dependencies listed in `requirements.txt` are installed when the container starts.
- **Dynamic Script Execution**: Specify the Python script to execute via the `SCRIPT_NAME` environment variable.
- **Lightweight and Reusable**: The base image is decoupled from the application source code and dependencies, making it reusable across multiple projects.

---

## Usage

### 1. **Prerequisites**
- Install [Docker](https://docs.docker.com/get-docker/).
- Ensure your application includes:
  - A `requirements.txt` file listing all dependencies.
  - A valid Python script (e.g., `main.py`, `app.py`, or any custom script).

### 2. **Build the Docker Image**
Build the Docker image using the provided Dockerfile:

```bash
docker build -t python-app .

### 3. **Run the Container**
Run the container while dynamically mounting your source code and specifying the script to execute:

```bash
docker run \
  -v $(pwd):/app \              # Mount the current directory to /app
  -e SCRIPT_NAME="src/main.py" \ # Specify the script to execute
  -e ENV_VAR1="value1" \         # (Optional) Pass additional environment variables
  python-app

    - Replace src/main.py with the path to the script you want to run.
    - Use -e flags to pass other environment variables your application requires.

### 4. **Customizing the Script**
You can specify any Python script as the entry point using the SCRIPT_NAME environment variable. If no script is specified, the container will default to src/main.py.