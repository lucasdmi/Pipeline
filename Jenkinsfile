pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        checkout scm
        echo 'Código fonte obtido com sucesso.'
      }
    }

    stage('Build') {
      steps {
        sh 'cd pipelines-frontend && npm -i'
        sh 'npm run build'
      }
    }

    stage('Testes Unitários') {
      steps {
        sh 'npm test'
        echo 'Testes unitários concluídos com sucesso.'
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
        sh 'scp pipelines-frontend.tar lucas@web-prod:/caminho/do/servidor/'
        sh '''
                ssh lucas@web-prod "cd /caminho/do/servidor && tar -xvf pipelines-frontend.tar"
                '''
        echo 'Deploy concluído com sucesso.'
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