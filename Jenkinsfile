pipeline {
	agent any


	environment {
		APPLI = "docksaficio/mon_projet_semi_complet"
	}


	parameters {
		string(
			name: "DATE_HEURE",
			defaultValue: "20-07-2026",
			description: "Quelle est la date et l'heure du push ?"
		)
	}


	stages {


                stage("BUILD") {

                        steps {
                                sh "docker build -t ${APPLI}:${params.DATE_HEURE} ."
                        }
                }


		stage("Credentials") {
		
			steps {
				withCredentials([
					usernamePassword(
						credentialsId: "MaCoToDocker",
						usernameVariable: "MonUSR",
						passwordVariable: "MonPSWD"
					)
				])	
					{
						sh "echo $MonPSWD | docker login -u $MonUSR --password-stdin"		
					}		
			}
		}

		stage("push") {

			steps {
				sh "docker push ${APPLI}:${params.DATE_HEURE}"

			}
		}

	}

		post {
			success {
				echo "Bien ouej"
			}
			
			failure {
				echo "retour case depart"
			}
			
			always {
				echo "fin du pipeline"
			}
		}
}
