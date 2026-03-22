# Stage 1: Build
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install --production

# Stage 2: Run
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY . .

# Environment variables akan di-override oleh Docker Compose atau K8s
EXPOSE 3000
CMD ["npm", "start"]