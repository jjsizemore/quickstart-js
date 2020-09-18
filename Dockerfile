FROM node

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install

RUN npm install -g firebase-tools 
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .


WORKDIR /usr/src/app/messaging

RUN firebase use dashcam-fcm-dev-client --token "1//06FE3bwCfh9TaCgYIARAAGAYSNwF-L9Irl1W0u2vkEbenysGli8BtTXRv8AHNKf63BelHZLgZpTLw9hRHPnL7Kd-LSZdc7igxFjg"

CMD [ "firebase", "serve", "-p", "8088", "-o", "0.0.0.0", "--token", "1//06FE3bwCfh9TaCgYIARAAGAYSNwF-L9Irl1W0u2vkEbenysGli8BtTXRv8AHNKf63BelHZLgZpTLw9hRHPnL7Kd-LSZdc7igxFjg" ]

EXPOSE 8088

