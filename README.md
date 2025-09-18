# Web Demo
This project demonstrates a simple static web application served using **Nginx** inside a Docker container.  
The entire workflow is automated with **Jenkins CI/CD**.

## How It Works
- The web page is served using an **Nginx Docker image** defined in the `Dockerfile`.
- **Jenkins** is configured to integrate with the GitHub repository where the application source code is stored.
- Whenever a change is pushed to the repository:
  1. Jenkins automatically pulls the updated code.
  2. A new Docker image is built.
  3. The container is redeployed with the latest changes.
- This ensures that the application is updated automatically without manually rebuilding and restarting the container every time.

## CI/CD Workflow
1. Developer pushes code changes to GitHub.
2. GitHub triggers a webhook to Jenkins.
3. Jenkins pipeline:
   - Checks out the latest code.
   - Builds a new Docker image.
   - Deploys the updated container.
4. The website is updated automatically.

---

## How to Run:

### 1. use **ngrok** to expose Jenkins (running locally) to a public URL so GitHub webhooks can reach it.

Run:
```bash
ngrok http 8080
````
The output will look like this:

![image alt](image_url)

Copy the **Forwarding URL**

### 2. Add Webhook in GitHub

Go to your repository settings → **Webhooks**.
Add the copied **ngrok Forwarding URL** to the **Payload URL** and add **/github-webhook/** in the end.

![image alt](image_url)

### 3. Configured Jenkins to Connect with GitHub

![image alt](image_url)

![image alt](image_url)

![image alt](image_url)

### 4. Run the folloing command for the first time building the image:

```bash
docker compose up -d --build
```
This builds the Docker image specified in the **Dockerfile** and starts the container as defined in **docker-compose.yml**.

### 5. Once the container is up, you can access the demo page at `http://localhost:9090`

![image alt](image_url)

### 6. Modify and Deploy Automatically

* Edit the `index.html` file.
* Push the changes to GitHub repository.
* Jenkins will automatically detect the change, rebuild the image, and redeploy the updated container.
* Refresh the browser and the page should now be updated with your modifications.

![image alt](image_url)





