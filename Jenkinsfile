def dv

pipeline {
	agent any
	
	enviroment {
		// variables
		NEW_VERSION = '1.3.2'
		SERVER_CREDENTIALS = credentials('87eeb8b5-64ea-4d67-b561-11e8293b9c0c') //id of credential
	}
	
	tools {
		maven maven-3.8  //maven maven-name
	}
	
	parameters {
		string(name: 'VERSION', defaultValue: '', description: 'version to deploy on prod')
		booleanParam(name: 'executeTests', defaultValue: true, description: '')
	}
	
	stages {
		stage("init") {
			steps {
				script {  //add script block
					gv = load "script.groovy"   //variable gv = load script with functions
				}
			}
		}
		
		stage("build") { #1
			steps {
				script {
					gv.BuildApp()  //call function from script
				}
				
				echo "building app...........${params.VERSION}"
				echo "${NEW_VERSION}..........."
				sh "mvn install"
			}
		}
		
		stage("test") {#2			
			when {
				expression {
					params.executeTests
				}
			}
			
			steps {
				script {
					gv.testApp()  //call function from script
				}
			}
		}
		
		stage("deploy") { #3
			steps {
				echo "deploy app............."
				withCredentials([
					usernamePassword(credentials: '87eeb8b5-64ea-4d67-b561-11e8293b9c0c', usernameVariable: DOCKER_ID, passwordVariable: PASSWORD)
				])
			}
		}
	}	
	post {	
		always {
			// always will do this step
		}
		
		success {
			// will do this step only after success
		}
	}
		
	
}//pipeline end
