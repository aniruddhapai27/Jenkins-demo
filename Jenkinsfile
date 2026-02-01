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
        stage ('build') {
            steps {
                echo 'Building...'
                echo "Version: ${NEW_VERSION}"
            }
        }
        stage ('test') {
            when {
                expression { return params.RUN_TESTS }
            }
            steps {
                echo 'Testing...'
            }
        }
        stage ('deploy') {
            steps {
                echo 'Deploying...'
                echo "Environment: ${params.ENVIRONMENT}"
            }
        }
    }
}
