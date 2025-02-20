# Stage 1: Install dependencies
FROM node:bookworm AS builder

WORKDIR /react-app
COPY package*.json ./
RUN npm install --legacy-peer-deps

# Stage 2: Use cached dependencies in the final image
FROM node:bookworm AS development

WORKDIR /react-app
COPY --from=builder /react-app/node_modules ./node_modules
COPY . .

CMD ["npm", "start"]
