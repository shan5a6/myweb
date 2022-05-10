pipeline {
  agent {
    docker {
      image "maven"
      args "-v /tmp/myapplication:/tmp/myapplication"
    }
  }
  stages {
    stage('Git clone') {
      steps {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'gitaccess', url: 'https://github.com/shan5a6/myweb.git']]])
      }
    }

    stage('building artifact') {
      steps {
        script {
          sh "mvn clean install"
        }
      }
    }

    stage('copying artifact') {
      steps {
        script {
          if(fileExists("/tmp/myapplication/app.war")) {
          sh """
            cp /tmp/myapplication/app.war /tmp/myapplication/app-${BUILD_NUMBER}.war
            cp ${workspace}/target/myweb*.war /tmp/myapplication/app.war
            cp ${workspace}/tomcat-users.xml /tmp/myapplication/tomcat-users.xml -f
          """
        }
        else {
          sh """
          cp ${workspace}/target/myweb*.war /tmp/myapplication/app.war
          cp ${workspace}/tomcat-users.xml /tmp/myapplication/tomcat-users.xml -f
          """
        }
      }
      }
    }

  }
  }

