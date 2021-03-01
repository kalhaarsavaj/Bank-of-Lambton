pipeline {
    environment {
        JAVA_TOOL_OPTIONS = "-Duser.home=/home/jenkins"
    }
    agent {
            label 'docker-slave'       
    }
    options {
        buildDiscarder(logRotator(numToKeepStr: '5'))
    }
    stages {
        stage ('Compile Stage') {
            steps {
                sh 'mvn package install'
                sh 'ls -la ./target/'
            }
        }

        stage('Code Quality Check via SonarQube') {
               steps {
                   script {
                       def scannerHome = tool 'sonar-scanner';
                       withSonarQubeEnv("SonarQube") {
                       sh "${tool("sonar-scanner")}/bin/sonar-scanner -Dsonar.projectKey=${env.JOB_NAME} -Dsonar.projectName=${env.JOB_NAME} -Dsonar.projectVersion=1.0 -Dsonar.sources=${WORKSPACE}/src/main/java/com/bankapp/pkg -Dsonar.language=java -Dsonar.java.binaries=target/classes"
                   }
               }
           }
       }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                /*always {
                    junit 'target/surefire-reports/*.xml'
                }*/
                success {
                    mail to: 'pallavikotvir@gmail.com',
                     subject: "Success Pipeline: ${currentBuild.fullDisplayName}",
                     body: "Check you build on http://ccbtinfradevop.live:10080 and code analysis on hhtp://ccbtinfradevop.live:10090"
                }
                failure{
                    mail to: 'pallavikotvir@gmail.com',
                     subject: "Failure Pipeline: ${currentBuild.fullDisplayName}",
                     body: "Check you build on http://ccbtinfradevop.live:10080 and code analysis on hhtp://ccbtinfradevop.live:10090"
                }
            }
        }        
    }
}
