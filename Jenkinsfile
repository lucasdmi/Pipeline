pipeline {
  agent {
    docker {
      image 'node:lts-bullseye-slim' 
            args '-p 3000:3000'
    }
  }
  stages {
    stage('Checkout') {
      environment {
        CI = 'True'
      }
      steps {
        checkout scm
        echo 'Código fonte obtido com sucesso.'
      }
    }

    stage('Build') {
          steps {
            dir('pipelines-frontend') {
                sh 'npm install'
                sh 'npm run build'
            }
            
        }

      
    }
    stage('Testes Unitários') {
      steps {
            dir('pipelines-frontend'){
                sh 'npm test'
                echo 'Testes unitários concluídos com sucesso.'
            }
        }      
    }     
   stage('Empacotamento') {
      steps {
        sh 'tar -cvf pipelines-frontend.tar ./'
        echo 'Empacotamento concluído com sucesso.'
      }
     }

    stage('Deploy') {
      steps {
        sh 'scp pipelines-frontend.tar lucas@web-prod:/Documents/pipelines/'
        sh 'ssh lucas@web-prod "cd ~/Documents/pipelines/ && tar -xvf pipelines-frontend.tar'          
        echo 'Deploy concluído com sucesso.'
        //EXemplo simples de Deploy adicionando os arquivos do frontend no servidor - 
        //Para o deploy funcionar precisa comentar o sh
      }
    }

  }

  post {
    success {
      echo 'Pipeline concluído com sucesso!'
    }

    failure {
      echo 'Ocorreu um erro durante o pipeline.'
    }

  }
}