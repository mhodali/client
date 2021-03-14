pipeline{
  agent any 
      environment {
        registry = 'mhodali/client'
        dockerImage = ''
        registryCredential='client'
    }
    
    stages{
 stage("clone"){
        steps{
checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/mhodali/client.git']]])        
        }}
        
      
      stage("build"){
        steps{
        script {
          dockerImage = docker.build registry
        }}}
stage('Push image') {
           steps{
        script {
  docker.withRegistry( '', registryCredential ) {
        dockerImage.push() 
           }}}}
      stage("run"){
        steps{
 
         sh './create-client.sh'
        }}
      
    }
  }
