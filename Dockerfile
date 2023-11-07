# Use your base image
FROM openjdk:8-jdk-alpine
CMD ["java", "-cp", "/myapp.jar", "com.myapp.App"]


# Add a user with UID 1000 and add to root group
RUN adduser -D -u 1000 myuser

# Set the user to use when running the image
USER myuser

# Copy the built JAR from the target directory into the image
ARG JAR_FILE
COPY ${JAR_FILE} app.jar

# Run the JAR file
ENTRYPOINT ["java","-jar","/app.jar"]
