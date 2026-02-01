pipeline {
    agent any
    tools {
        nodejs "my-nodejs"
    }
    stages {
        stage('Build Image') {
            steps {
                echo 'Building...'
                withCredentials([
                    usernamePassword(credentialsId: 'docker-hub-repo', usernameVariable: "USERNAME", passwordVariable: "PASSWORD")
                ]) {
                    sh 'docker build -f Containerfile -t aniruddhapai/demo-app:2.0 .'
                    sh 'echo $PASSWORD | docker login -u $USERNAME --password-stdin'
                    sh 'docker push aniruddhapai/demo-app:2.0'
                }

            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                // Add test steps here
            }
        }
        stage('Deploy') {
            steps {     
                echo 'Deploying...'
            }
        }
    }
}
