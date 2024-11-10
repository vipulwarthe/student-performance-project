# Use an official Python runtime as a parent image
FROM python:3.7

# Create a directory in the container to hold your application files
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt requirements.txt

# Upgrade pip and install the Python packages from requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the rest of your application code into the container
COPY . /app

# Expose the port your application will run on
EXPOSE 5000

# Define the command to run when the container starts
CMD ["python", "application.py"]
