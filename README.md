# RAG with Multiple PDFs using AZURE OPEN AI API

## Background and Deployment basics
This repository consists of a Jupyter notebook that allows one to use AZURE OPEN AI API endpoints for text generation and embedding with Retrieval Augmented Generation pipeline. The implementation 
requires one to provide: 
1. Files to be queried, i.e., the database/dataset, under the folder name "Dataset". Create this folder and store the PDFs that should be queried
2. Create a file "key.txt" with all the AZURE OPEN AI API endpoint information. An example is:                           
 `openai.api_base= <Your API Endpoint>                                                                                 
 API KEY= <Your API KEY>                                   
 deployment_name_text= <Deployed Generation Model>                                   
 deployment_name_embed= <Deployed Embedding Generator Model>
`
3. Create a folder with the name "Embed" to hold the generated embeddings so that new embeddings do not need to be generated again (some form of persistency). Note that, the stored database needs to 
be deleted whenever a new file is added. This limitation will be resolved in a future iteration. 

To initialize the deployment. One can follow these steps: 
1. Clone the repo
2. Setup Docker on the desired machine
3. Build the docker image by running this command:`docker build -t <image_name> .`
4. Update the docker compose file `compose.yaml` such that: `image: <image_name>` 
5. Executing: `docker-compose up`. Do not run in the background as the logs contain a `token` in a line such as: `http://<your_ip>:8888/lab?token=26bea3f52b59b641c118e3c5e9406c1dec7fa0dfeb5b8c6f`
6. Step 5 mounts the present working directory with the "Dataset" and "Embed" folder into the docker container. It also exposes the Jupyer notebook on `localhost:10000`. Copy paste the token, as 
explained in Step 5, to login to the notebook. Enjoy playing with RAGs!

