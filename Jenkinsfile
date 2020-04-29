pipeline {
    agent {
        node {
            label 'master'
        }
    }

    stages {

        stage('terraform started') {
            steps {
                sh 'echo "Started...!" '
            }
        }
        stage('git clone') {
            steps {
                sh 'sudo rm -r *;sudo git clone https://github.com/dawitnida/ci.git'
            }
        }
        stage('terraform init') {
            steps {
                sh 'sudo /home/ec2-user/terraform init ./jenkins/src'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'ls ./ci/src; sudo /home/ec2-user/terraform plan ./ci/src'
            }
        }
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }
    }
}
