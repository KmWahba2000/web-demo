# Web Demo
This project demonstrates a simple static web application served using **Nginx** inside a Docker container.  
The entire workflow is automated with **Jenkins CI/CD**.

## How It Works
- The web page runs on an **Nginx Docker image** defined in the `Dockerfile`.
- Jenkins is connected to the GitHub repository and uses a `Jenkinsfile` to define the pipeline.
- The workflow is simple:
  1. Code changes are pushed to GitHub.
  2. A webhook notifies Jenkins.
  3. Jenkins checks out the latest code, builds a new Docker image, and redeploys the container.
- As a result, the website is updated automatically without any manual steps.

## How to Run:

### 1. Use **ngrok** to expose Jenkins (running locally) to a public URL so GitHub webhooks can reach it.

Run:
```bash
ngrok http 8080
````

The output will look like this:

![image alt](https://github.com/KmWahba2000/web-demo/blob/29ea23c272f12762521c7ce42f08ea07dad6805d/Assets/1.png)

Copy the **Forwarding URL**.

### 2. Add Webhook in GitHub

Go to repo settings → **Webhooks**.
Add the copied **ngrok Forwarding URL** to the **Payload URL** and add **/github-webhook/** at the end.

![image alt](https://github.com/KmWahba2000/web-demo/blob/6958f12f91bbf0240159f6361da3adc9db927f4e/Assets/2.png)

### 3. Configure Jenkins to Connect with GitHub

![image alt](https://github.com/KmWahba2000/web-demo/blob/6958f12f91bbf0240159f6361da3adc9db927f4e/Assets/3.png)

![image alt](https://github.com/KmWahba2000/web-demo/blob/6958f12f91bbf0240159f6361da3adc9db927f4e/Assets/4.png)

![image alt](https://github.com/KmWahba2000/web-demo/blob/6958f12f91bbf0240159f6361da3adc9db927f4e/Assets/5.png)

![image alt](https://github.com/KmWahba2000/web-demo/blob/6958f12f91bbf0240159f6361da3adc9db927f4e/Assets/6.png)

### 4. Run the following command for the first time building the image:

```bash
docker compose up -d --build
```

This builds the Docker image specified in the **Dockerfile** and starts the container as defined in **docker-compose.yml**.

### 5. Once the container is up, you can access the demo page at `http://localhost:9090`

![image alt](https://github.com/KmWahba2000/web-demo/blob/6958f12f91bbf0240159f6361da3adc9db927f4e/Assets/7.png)

### 6. Modify and Deploy Automatically

* Edit the `index.html` file.
* Push the changes to GitHub repo.
* Jenkins will automatically detect the change, rebuild the image, and redeploy the updated container.
* Refresh the browser and the page should now be updated with your modifications.

![image alt](https://github.com/KmWahba2000/web-demo/blob/6958f12f91bbf0240159f6361da3adc9db927f4e/Assets/8.png)

![image alt](https://github.com/KmWahba2000/web-demo/blob/6958f12f91bbf0240159f6361da3adc9db927f4e/Assets/9.png)

![image alt](https://github.com/KmWahba2000/web-demo/blob/6958f12f91bbf0240159f6361da3adc9db927f4e/Assets/11.png)

### Final Test:

https://github.com/user-attachments/assets/c589c899-97f3-4dd6-a661-4859f2be5bf0