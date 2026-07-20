pipeline {
	agent any


	environment {
		$APPLI = mon_projet_semi_complet
	}


	parameters {
		string(
			name: 'DATE et HEURE',
			defaultvalue: 'Début',
			description: 'Quelle est la date et l'heure du push ?')
		}


	stages {


                stage('BUILD') {

                        steps {
                                sh 'docker build -t ${APPLI}:${params.DATE ET HEURE} .'
                        }
                }


		stage('Credentials') {
		
			steps {
				withCredentials([
					usernamePassword(
						credentialsId: 'MaCoToDocker',
						usernameVariable: 'MonUSR',
						passwordVariable: 'MonPSWD'
					)
				])	
					{
						sh 'echo $MonPSWD | docker login -u $MonUSR --passwrd-stdin'		
					}		
			}
		}

		stage('push') {

			steps {
				sh 'docker push ${APPLI}:${params.DATE ET HEURE}'

			}
		}

	}

		post {
			success {
				echo 'Bien ouej'
			}
			
			failure {
				echo 'retour case depart'
			}
			
			always {
				echo 'fin du pipeline'
			}
		}
}
