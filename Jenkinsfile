#! groovy
node{
 stage('Source'){
     git 'https://github.com/shan5a6/myweb.git'
 }
 
 stage('Build'){
    // def mvnHome = tool 'maven3'
    sh "mvn clean package" 
 }
 stage('Send Email'){
     mail bcc: '', body: 'Demo Pipeline', cc: '', from: '', replyTo: '', subject: 'Pipeline Demo', to: 'shahan.aix@gmail.com'
 }
 stage('Archive'){
     archiveArtifacts 'target/*.war'
 }
}
