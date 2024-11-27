# Build stage
FROM node:18-alpine3.19 AS builder
WORKDIR /app

# Enable Corepack to manage Yarn versions
RUN corepack enable

# Copy package.json and yarn.lock
COPY app/package.json ./
COPY app/yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the rest of the application
COPY app/ ./

# Build the application
RUN yarn build

# Production stage
FROM node:18-alpine3.19 AS runner
WORKDIR /app

# Enable Corepack in the production image
RUN corepack enable

# Copy necessary files from builder
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static

ENV NODE_ENV=production
ENV PORT=3000
EXPOSE 3000

CMD ["node", "server.js"]