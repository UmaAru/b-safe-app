pipeline {

    agent any

    environment {

        DOCKER_USERNAME = 'umaaru'
        IMAGE_NAME = 'umaaru/b-safe-app'
        CONTAINER_NAME = 'b-safe-app'

    }

    stages {

        stage('Checkout') {

            steps {

                echo 'Checking out source code from GitHub'

                checkout scm

            }
        }


        stage('Run Automated Tests') {

            steps {

                echo 'Running automated tests'

                sh '''
                    chmod +x test/test.sh
                    ./test/test.sh
                '''
            }
        }


        stage('Build Docker Image') {

            steps {

                echo 'Building Docker image'

                sh '''
                    docker build \
                    -t ${IMAGE_NAME}:${BUILD_NUMBER} \
                    -t ${IMAGE_NAME}:latest \
                    .
                '''
            }
        }


        stage('Docker Login') {

            steps {

                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-credentials',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASSWORD'
                    )
                ]) {

                    sh '''
                        echo "$DOCKER_PASSWORD" | docker login \
                        -u "$DOCKER_USER" \
                        --password-stdin
                    '''
                }
            }
        }


        stage('Push Docker Image') {

            steps {

                echo 'Pushing Docker image to Docker Hub'

                sh '''
                    docker push ${IMAGE_NAME}:${BUILD_NUMBER}
                    docker push ${IMAGE_NAME}:latest
                '''
            }
        }


        stage('Deploy Application') {

            steps {

                echo 'Deploying application container'

                sh '''
                    docker rm -f ${CONTAINER_NAME} 2>/dev/null || true

                    docker run -d \
                    --name ${CONTAINER_NAME} \
                    -p 80:80 \
                    ${IMAGE_NAME}:${BUILD_NUMBER}
                '''
            }
        }


        stage('Verify Deployment') {

            steps {

                echo 'Verifying application deployment'

                sh '''
                    sleep 5

                    curl -f http://localhost:80

                    echo ""
                    echo "Application successfully deployed!"
                '''
            }
        }

    }


    post {

        always {

            echo 'Cleaning unused Docker images'

            sh '''
                docker image prune -f || true
            '''
        }

        success {

            echo '''
            ==========================================
            B-SAFE CI/CD PIPELINE SUCCESSFUL
            ==========================================
            Docker Image:
            ${IMAGE_NAME}:${BUILD_NUMBER}

            Application:
            http://EC2-PUBLIC-IP
            ==========================================
            '''
        }

        failure {

            echo '''
            ==========================================
            B-SAFE CI/CD PIPELINE FAILED
            ==========================================
            Please check Jenkins console output.
            ==========================================
            '''
        }
    }
}
