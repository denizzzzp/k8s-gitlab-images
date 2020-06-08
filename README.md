1. On K8S Master cat /root/.kube/config | base64
2. In GitLab-CI Settings \ CI / CD \ VARIABLES create Variables KEY KUBECONFIG_CLUSTER VALUE STEP 1
3. Create .gitlab-ci.yml
```
image: denizzzzp/k8s-kubectl-gitlab-ci:1.18.0
stages:
  - test
before_script:
  - echo $KUBECONFIG_CLUSTER | base64 -d > /root/.kube/config
deploy:
  stage: test
  script:
  - kubectl get node -o wide
```
