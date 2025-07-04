##########For NGINX#########
# Use the official Nginx image
#FROM nginx:latest

# Set working directory
##WORKDIR /usr/share/nginx/html

# Copy the HTML files
#COPY default.conf /etc/nginx/conf.d/

# Remove the default index.html file
#RUN rm -f /usr/share/nginx/html/index*

#COPY index.html /usr/share/nginx/html/
#COPY ondc-site-verification.html /usr/share/nginx/html/

# Expose port 8080 for Cloud Run
#EXPOSE 8080

# Override the default Nginx configuration (if needed)
##COPY nginx.conf /etc/nginx/nginx.conf

# Start Nginx
#CMD ["nginx", "-g", "daemon off;"]

##########For Python##########
# Use the official Python image
FROM python:3.9-slim
# Set working directory
WORKDIR /app
# Copy requirements and install dependencies
COPY requirements.txt /app/
RUN pip install -r requirements.txt
# Copy the app and the HTML file
COPY app.py /app/
COPY index.html /app/
#this is for nginx##COPY ondc-site-verification.html /app/new/
# Expose port 8080 for Cloud Run
EXPOSE 8080
# Run the app
CMD ["python", "app.py"]
# Use lightweight Node.js Alpine image
#FROM node:18-alpine
# Set working directory
#WORKDIR /app
# Copy package.json and package-lock.json first (optimizing layer caching)
#COPY package*.json ./
# Install dependencies (explicitly setting NODE_ENV)
#ENV NODE_ENV=production
#RUN npm ci --only=production
# Copy remaining application files
#COPY . .
# Expose port (Cloud Run ignores this, but good practice)
#EXPOSE 3000
# Start the application
#gCMD ["node", "src/server.js"]
# Temp updated