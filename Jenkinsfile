pipeline {
	agent any


	environment {
		MON_IMAGE = "docksaficio/projet-semi-complet"
		}

	
	parameters {
		string( 
                        name: "VERSION",
                        defaultValue: "v0",
                        description: "Quelle version on fait mon singe ?"
)
	}


	stages {

		stage("BuildImage") {
			
			steps {
				sh "docker build -t ${MON_IMAGE}:${params.VERSION} ."
			}
		}

		stage("CREDENTIALS") {
			steps {
				withCredentials([
					usernamePassword(
						credentialsId: "MaCoToDocker",
						usernameVariable: "Username",
						passwordVariable: "lebaysecret"
						)
				])
					{
					sh "echo $lebaysecret | docker login -u $Username --password-stdin"
					}
			}
		}

		stage("PUSH") {
		
			steps {
				sh "docker push ${MON_IMAGE}:{params.VERSION}"
		
			}

		}

	}

		post {
		
			success {
				echo "j'ai battu Jenkins"
			}
			
			failure {
				echo "je me suis fait farcir par Jenkins"
			}

			always {
				echo "fin de la fête"
			}
		}



}
