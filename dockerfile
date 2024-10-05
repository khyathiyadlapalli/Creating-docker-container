FROM python:3.9
# Set the working directory inside the container
WORKDIR /app

# Create a user to avoid permission issues
RUN adduser --disabled-password --gecos '' appuser && chown -R appuser /app

# Use the new user for subsequent commands
USER appuser

# Copy requirements.txt into the container and install dependencies
COPY --chown=appuser:appuser requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your code files into the container
COPY --chown=appuser:appuser . .

# Run the Python script
CMD ["python", "./model.py"]
