# aws cicd

## Github Workflow

CI/CD 작업을 하기 위한 파일

필요한 값 (Secrets)

- AWS_REGION

AWS 서비스를 사용하고 있는 AWS Region, 한국의 경우 `ap-northeast-2`이다.

- AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY

AWS 서비스에 접근할 수 있는 키 값

ROOT Account의 키 값을 이용해서 모든 리소스에 접근할 수 있지만,

IAM을 통해서 필요한 권한만 부여해서 만든 IAM의 키 값을 사용하는 것이 좋다.

- ECR_REPOSITORY

ECR 레포지토리 이름

- IMAGE_TAG (default : `latest`)

Github Action이 실행되면 빌드된 이미지 태그, 정책에 따라서 유기적으로 설정할 수 있다.

Github SHA 값으로 커밋 시점을 기준으로 태그를 붙여서 Post-Modem 과정에서 사용할 수 있다.

- ECS_SERVICE

AWS ECS 서비스 이름

- ECS_CLUSTER

AWS ECS 서비스의 클러스터 이름

- ECS_TASK_DEFINITION (default : `aws/task-definition.json`)

ECS에서 만들어질 컨테이너의 정책이 담겨있는 `json` 파일이다.

여기서 호스트 머신의 스펙, 네트워크, 등 다양한 구성을 작성할 수 있다.

**이 값은 사용 X**

- TASK_DEFINITION_S3_PATH

`task-definitoin.json`을 불러오는 S3 경로

- WORKING_TASK_DEFINITION_PATH

`${{ env.TASK_DEFINITION_S3_PATH }}`에서 다운로드 받은 task-definition.json의 경로

ECS Deploy에 사용된다.

- CONTAINER_NAME

ECS 내에 업데이트할 컨테이너 이름

### ./github/workflows/ECS-deploy.yml

\#**TODO** : `ECR Push`와 `ECS Deploy` 과정을 분리해서 따로 작성할 것...

`ECR Push`는 단순히 커밋과 같아서 오류가 나는 경우는 거의 없지만

`ECS Deploy` 과정에서 주로 장애가 발생해서 따로 작성하는 것이 좋아보인다.

## 