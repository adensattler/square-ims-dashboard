# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define environment variable to tell Flask to use production settings
ENV FLASK_ENV=production

# Define environment variable for Cloud Run to use the expected port
ENV PORT=8080

# Run the app when the container launches
CMD ["python", "wsgi.py"]
