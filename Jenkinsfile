def gv

pipeline {
    agent any 
    environment {
        NEW_VERSION = "1.2.3"
    }
    parameters {
        string(name: 'CUSTOM_PARAM', defaultValue: 'default_value', description: 'A custom parameter for the build')
        choice(name: 'ENVIRONMENT', choices: ['dev', 'staging', 'production'], description: 'Select the deployment environment')
        booleanParam(name: 'RUN_TESTS', defaultValue: true, description: 'Whether to run tests or not')
    }

    stages {
        stage ('init') {
            steps {
               script {
                    gv = load "script.groovy"
               } 
            }
        }
        stage ('build') {
            input {
                message "Select env"
                ok "Continue"
                parameters {
                    choice(name: 'BUILD_ENV', choices: ['development', 'production'])
                }
            }
            steps {
                script {
                    gv.buildApp()
                }
                echo 'Building...'
                echo "Version: ${NEW_VERSION}"
            }
        }
        stage ('test') {
            when {
                    expression {  params.RUN_TESTS == true }
            }
            steps {
                echo 'Testing...'
            }
        }
        stage ('deploy') {
            script {
                env.ENV = input message "Select deployment environment", parameters: [choice(name: 'ENVIRONMENT', choices: ['dev', 'staging', 'production'], description: 'Select the deployment environment')]
                echo "Selected environment: ${env.ENV}"
            }
            steps {
                echo 'Deploying...'
                echo "Environment: ${params.ENVIRONMENT}"
            }
        }
    }
}
