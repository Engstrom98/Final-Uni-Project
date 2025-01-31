# Stage 1: Build Stage
FROM ubuntu:22.04 AS builder

# Install build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake

# Set the working directory in the Docker image
WORKDIR /app

# Copy the source code into the Docker image
COPY . /app

# Build the project
RUN mkdir build && cd build && \
    cmake .. && \
    make

# Stage 2: Runtime Stage
FROM ubuntu:22.04

# Install runtime dependencies only
RUN apt-get update && apt-get install -y \
    libstdc++6 && \
    rm -rf /var/lib/apt/lists/*

# Copy the binary from the build stage
COPY --from=builder /app/build/MyExecutable /app/MyExecutable

# Set the working directory in the Docker image
WORKDIR /app

# Command to run the application
CMD ["./MyExecutable"]
