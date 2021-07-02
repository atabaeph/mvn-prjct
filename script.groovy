def buildWar() {
	echo 'building app...'
	sh 'mvn package'
}

def buildDockerImg() {
	echo 'building docker image....'
	withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'PASS', usernameVariable: 'DOCKER_ID')]) {
		sh 'docker build -t abubandit/demo-app:1.2 .'
		sh 'echo $PASS | docker login -u $DOCKER_ID --password-stdin'
		sh 'docker push abubandit/demo-app:1.2'
	}
}

def deployApp() {
	echo 'deploying app....'
	sh 'docker run -d -p 8989:8080 abubandit/demo-app:1.2'
}

return this
