# Use the official Python image as the base image
FROM python:3.10

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt .

# Install the required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app files to the container
COPY . .

# Expose the port that your Flask app will listen to
EXPOSE 5000

# Command to run your Flask API using gunicorn (adjust if needed)
CMD ["python", "api.py"]

