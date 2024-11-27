FROM node:18-alpine3.19 AS builder
WORKDIR /app

# Copy package files first
COPY package.json ./
COPY yarn.lock ./

# Install dependencies using npm instead
RUN npm install

# Copy the rest of the application
COPY . .

# Build the application
RUN npm run build

# Production stage
FROM node:18-alpine3.19 AS runner
WORKDIR /app

# Copy production files
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package.json ./
COPY --from=builder /app/node_modules ./node_modules

ENV NODE_ENV=production
EXPOSE 3000

CMD ["npm", "run", "start:prod"]