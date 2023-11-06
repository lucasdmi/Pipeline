pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Clona o repositório do código fonte
                checkout scm 
                echo 'Código fonte obtido com sucesso.'
            }
        }

        stage('Build') {
            steps {
                // Compila o projeto (por exemplo, uma aplicação Node.js)
                sh 'npm install'
                echo 'Build concluído com sucesso.'
            }
        }

        stage('Testes Unitários') {
            steps {
                // Executa testes unitários (por exemplo, testes Jest em uma aplicação Node.js)
                sh 'npm test'
                echo 'Testes unitários concluídos com sucesso.'
            }
        }

        stage('Empacotamento') {
            steps {
                // Empacota a aplicação para deploy (por exemplo, cria um arquivo .tar)
                sh 'tar -cvf pipelines-frontend.tar ./'
                echo 'Empacotamento concluído com sucesso.'
            }
        }

        stage('Deploy') {
            steps {
                // Copia o arquivo empacotado para o servidor
                sh 'scp pipelines-frontend.tar lucas@web-prod:/caminho/do/servidor/'

                // Conecta ao servidor e descompacta o arquivo
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
