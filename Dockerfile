FROM python:3.11.4

# Install system dependencies
RUN apt-get update -qq -y && \
    apt-get install -y --no-install-recommends \
        chromium \
        chromium-driver && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Selenium
RUN pip install selenium==4.25.0

# Set working directory
WORKDIR /app

# Define a flexible entry point that uses an environment variable
ENTRYPOINT ["sh", "-c", "pip install --no-cache-dir -r requirements.txt && python $SCRIPT_NAME"]
