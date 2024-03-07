# Exemple

## namespace, deploy, service

```yml
apiVersion: v1
kind: Namespace
metadata:
  name: alex-ns

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: vol-pod-nginx
  namespace: alex-ns
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: alex-nginx
        image: nginx
        ports:
        - containerPort: 80
        volumeMounts:
        - name: html
          mountPath: /usr/share/nginx/html
      - name: ubuntu
        image: ubuntu:trusty
        volumeMounts:
        - name: html
          mountPath: /data
        command: ["/bin/sh", "-c"]
        args:
          - "while true; do date > /data/index.html; sleep 1; done"
      volumes:
      - name: html
        hostPath:
          path: /html
          type: DirectoryOrCreate
---
kind: Service
apiVersion: v1
metadata:
  namespace: alex-ns
  name: alex-src
spec:
  type: NodePort
  ports:
    - name: http
      port: 80
      targetPort: 80
      nodePort: 30006
  selector:
    app: nginx
```
