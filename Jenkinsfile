pipeline {
  environment {
    registry = "962093/dcker_spring_test"
    registryCredential = "DockerHub_Reg"
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
            // Get some code from a GitHub repository
         checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'GitHub_SCM', url: 'https://github.com/mahesh997/test_proj.git']]])
            }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
    stage('deploy to k8s') {
      steps {
         kubernetesDeploy configs: 'Deployment.yml', kubeConfig: [path: ''], kubeconfigId: 'Kubeconfig_info', secretName: '', ssh: [sshCredentialsId: '*', sshServer: ''], textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', serverUrl: 'https://']
            }
    }
  }
}