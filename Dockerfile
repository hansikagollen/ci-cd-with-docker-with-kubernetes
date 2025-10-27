# Use an official Python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy all files into container
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port (for Flask app)
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
