def gv

pipeline {
	agent any
	
	tools {
		maven 'maven-3.8'
	}
	
	stages {	
		stage("init") {
			steps{
				gv = load 'script.groovy'
			}			
		}
		stage("build war") {
			steps {
				script {					
					gv.buildWar()
				}
			}
		}
		stage("building docker image") {
			steps {
				script{
					gv.buildDockerImg()
				}					
			}
		}
		stage("deploying app") {
			steps {
				script {
					gv.deployApp()
				}
			}
		}
	}
}
