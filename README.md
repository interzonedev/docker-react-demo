# docker-react-demo

Demo project for deploying a Docker application to AWS Elastic Beanstalk.

## NodeJS Commands

To create the app:
```
npx create-react-app docker-react-demo
```

To start the app:
```
npm run start
```
or
```
npm start
```

To run the unit tests:
```
npm run test
```
or
```
npm test
```

To create a production build:
```
npm run build
```

To clean the production build:
```
npm run clean
```

Note:
The `npm test`, `npm start`, `npm restart`, and `npm stop` commands are all aliases for `npm run xxx`.

For all other scripts use `npm run xxx`.

## Docker Commands
Build a tagged development image and see output:
```
docker build -f Dockerfile.dev -t boltgun69/docker-react-demo --progress=plain .
```

Build a tagged production image and see output:
```
docker build -t boltgun69/docker-react-demo --progress=plain .
```

Run with port mapping:
```
docker run -p <local port>:<port in running container> --name <container name> <image ID or tag name>
```

Run development app (just NodeJS):
```
docker run -p 3000:3000 --name docker-react-demo boltgun69/docker-react-demo
```

Run production app (Nginx):
```
docker run -p 8080:80 --name docker-react-demo boltgun69/docker-react-demo
```

Run with port mapping and volumes:
```
docker run -p <local port>:<port in running container> -v /app/node_modules -v "$(pwd):/app" <image ID or tag name>
```
```
docker run -p 3000:3000 -v /app/node_modules -v "$(pwd):/app" boltgun69/docker-react-demo
```

To stop local container:
```
docker stop <image ID or tag name>
```

The development app will be available at [http://localhost:3000](http://localhost:3000).

Explore the file system of the running container:
```
docker run -it <image ID or tag name> sh
```

Run unit tests:
```
docker run -it <image ID or tag name> npm run test
```

Build and run the development app and unit test containers:
```
docker compose -f docker-compose-dev.yml up --build
```

Stop the development app and unit test containers:
```
docker compose -f docker-compose-dev.yml down
```

Build and run the production app container:
```
docker compose up --build
```

Stop the production app container:
```
docker compose down
```

To deploy via the Elastic Beanstalk command line client:
```
eb init
eb create
eb open
```

To terminate the Elastic Beanstalk environment:
```
eb terminate
```

To make a request of the endpoint of the local container:
```
curl -i -X GET "http://localhost:8080"
```

To make a request of the endpoint in AWS Elastic Beanstalk (example):
```
curl -i -X GET "http://docker-react-demo-gh-env.eba-w23x24z6.us-west-1.elasticbeanstalk.com"
```
