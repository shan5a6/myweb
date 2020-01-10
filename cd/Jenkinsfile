pipeline {
  agent any
  stages {
    stage('Preparing dev environment') {
      steps {
        script {
          def container_status = sh(script: "docker ps -a|grep -i myapplication", returnStatus: true) == 0
          if ("${container_status}" ==  "true")
          {
            sh 'docker rm -f myapplication'
          }
          sh """
            docker run -itd --name myapplication -p 80:8080 tomcat:8.0
            docker stop myapplication
          """
        }
      }
    }

    stage('Copying application war') {
      steps {
        script {
          sh "docker cp /tmp/myapplication/app.war myapplication:/usr/local/tomcat/webapps"
        }
      }
    }

    stage("Copying tomcat files")
    {
      steps {
        script {
          sh "docker cp /tmp/myapplication/tomcat-users.xml myapplication:/usr/local/tomcat/conf/"
        }
      }
    }

    stage('Starting Application') {
      steps {
        script {
          sh "docker restart myapplication"
        }
      }
    }
  }
}

