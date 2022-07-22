# Single-Page Application Demo 
This application demos a modern single-page application built on:
- Vue.js (front-end)
- Node.js (back-end)
- MongoDB (database)

This application was created to help train people on the [F5 Distributed Cloud Services](https://www.f5.com/cloud) capabilities. 

![Brewz Site](./assets/demo_brewz.png)

# Components
### Frontend
Vue.JS application that simulates a shopping cart application.

- Environment: Internet facing 

### API
Node.JS application running on Express.JS that provides the primary API and access to the database. 

- Environment: Internet facing

### Database
MongoDB database that stores information about the user and the products.  This database is seeded with user and product data on launch. 

- Environment: Internal 

### Recommendations
Node.JS microservice that will recommend products.

- Environment: Internet facing 

### Inventory
Node.JS microservice that will tell the local store inventory.  Note, this microservice is accessed through the API and simulates the API server talking to an internal service. 

- Environment: Internal, accessibly by the API server

# Features
### Stats Page
The stats page provides information for the various components that make up this application:
- service URL
- Latency
- Historic latency graph

![Stats Page](./assets/stats.png)

NOTE: If a component is offline, a component card such as in the image above will turn red.

### Product Detail
The Product detail page contains the recommendations and inventory microservices. 

![Product Detail](./assets/features.png)
# Setup Env
<img width="1157" alt="image" src="https://user-images.githubusercontent.com/8175899/180341850-cd53d743-f3a4-4b1b-97ea-71ce5531ac26.png">
export KUBECONFIG=/Users/wzhu/Documents/git/wordpress-kube/<kubeconfig>.yaml

# Deploy 
```
kubectl apply -f api.yaml

kubectl apply -f inventory.yaml

kubectl apply -f mongodb.yaml

kubectl apply -f recommendations.yaml

kubectl apply -f spa.yaml
```

# Config Load Balance & Ingress
Pool for Frontend
<img width="1132" alt="image" src="https://user-images.githubusercontent.com/8175899/180342085-3f5a251f-725c-4f12-ae1f-8849cd31478c.png">
<img width="903" alt="image" src="https://user-images.githubusercontent.com/8175899/180342195-0aa2da07-afda-4197-9686-4606669d7a61.png">

Pool for Backend
<img width="1138" alt="image" src="https://user-images.githubusercontent.com/8175899/180342243-51383d70-8da6-488c-bffc-4bb009a30756.png">
<img width="1139" alt="image" src="https://user-images.githubusercontent.com/8175899/180342277-ef7e92c1-4607-4fec-a238-31523304f5d1.png">

Load Balance Setup
<img width="1138" alt="image" src="https://user-images.githubusercontent.com/8175899/180342377-e53652bd-b8e9-455d-af8e-f286c9c297b9.png">
Routes:
<img width="899" alt="image" src="https://user-images.githubusercontent.com/8175899/180342415-778c1390-ed74-4353-803f-34bee6885634.png">

<img width="892" alt="image" src="https://user-images.githubusercontent.com/8175899/180342474-17770ed3-366d-4c47-b55c-5f698a73ad67.png">

# Check you application via DNS name from "DNS Info"
<img width="1163" alt="image" src="https://user-images.githubusercontent.com/8175899/180342573-94acdc12-332f-479b-bcd3-d6fec542cd1e.png">



Then start your front-end or back-end as shown above. 

# Attribution
This code is based on the work of [Shaun Wassell](https://www.linkedin.com/in/shaun-wassell?trk=lil_course&lipi=urn%3Ali%3Apage%3Ad_learning_content%3BEJRJvvk4SzmhYz%2Bf1ZJBUw%3D%3D&licu=urn%3Ali%3Acontrol%3Ad_learning_content-view_on_linkedin) and his [Creating and Hosting a Full-Stack Site LinkedIn Learning course](https://www.linkedin.com/learning/vue-js-creating-and-hosting-a-full-stack-site/).

I have extended his demo to:
- run components in docker containers
- abstract API and image URLs 
- seed MongoDB 
- recommendations microservice
- store inventory simulation  
- stats page for all services
