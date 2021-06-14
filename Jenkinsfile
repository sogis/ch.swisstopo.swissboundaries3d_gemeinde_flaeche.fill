import java.nio.file.Paths

def time = new Date()
def timestamp = time.format("yyyyMMddHHmmss", TimeZone.getTimeZone('Europe/Zurich'))
def pubDate = time.format("EEE, dd MMM yyyy HH:mm:ss Z", TimeZone.getTimeZone('Europe/Zurich'))
def dataset = "ch.swisstopo.swissboundaries3d_gemeinde_flaeche.fill"
def downloadUrl = "https://ch.so.agi.integration.s3-eu-central-1.amazonaws.com/"

pipeline {

    agent {
        kubernetes {
            cloud 'openshift'
            yamlFile 'pod.yml'
        }
    }

    options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '3'))
    }

    stages {

        stage('Initialization') {
            steps {
                container('gretl') {
                    sh  label: "Prepare gradle",
                        script: """
                            gradle --version
                        """
                }
                container('postgis') {
                    sh  label: "Wait for database to be ready",
                        script: """
                            until /usr/local/bin/is_ready; do echo 'Waiting for database...'; sleep 3; done
                            echo "Database is ready. Continue with pipeline..."
                        """
                }
            }
        }
        
        stage('Run gretl job') {
            steps {
                container('gretl') {
                    sh  label: "Run gretl job",
                        script: """
                            gretl
                        """
                }
            }
        }
        stage('Deploy result') {
            def xtfFilePath = Paths.get(pathToUnzipFolder.toString(),'swissBOUNDARIES3D_1_3.xtf')
            environment {
                DATA_ID = "${dataset}_${timestamp}"
                DATA_FILE = "${dataset}_${timestamp}.xtf"
                HASH_FILE = "${dataset}_${timestamp}.xtf.txt"
                ZIP_FILE = "${dataset}_${timestamp}.zip"
                FEED_FILE = "${dataset}_${timestamp}_feed.xml"
                DOWNLOAD_FILE_NAME = "${internalFileName}"
                DOWNLOAD_URL = "${downloadUrl}"
            }
            steps {
                container('gretl') {
                    sh  label: "Create deployment directory",
                        script: "mkdir deploy"

                    sh  label: "Bundle models",
                        script: '''
                            mkdir models
                            cp $(find ./ -name '*.ili') models/
                            cp $(find /tmp -name '*.ili') models/
                            zip -r ./deploy/$ZIP_FILE models
                        '''

                    sh  label: "Rename input file",
                        script: '''
                            mv ${xtfFilePath} $DATA_FILE
                            zip -r ./deploy/$ZIP_FILE $DATA_FILE
                        '''

                    sh  label: "Generate checksum",
                        script: '''
                            md5sum $DATA_FILE | awk '{print \$1}' > $HASH_FILE
                            zip -r ./deploy/$ZIP_FILE $HASH_FILE
                        '''
                    
                    sh  label: "Create feed item",
                        script: """
                            tpage \\
                                --define guid=\$DATA_ID \\
                                --define title=\$DATA_FILE \\
                                --define description=\$(cat \$HASH_FILE) \\
                                --define link=\"\$DOWNLOAD_URL/\$ZIP_FILE\" \\
                                --define pubDate=\"${pubDate}\" \\
                                --interpolate ./feed_item.xml \\
                                > ./deploy/\$FEED_FILE
                        """
                    
                    sh  label: "Show content of deploy data",
                        script: """
                            ls -ls ./deploy
                        """
                }
            }
        }
        stage('Run gretl s3 upload job') {
            steps {
                container('gretl') {
                    sh  label: "Run gretl job",
                        script: """
                            gretl uploadS3
                        """
                }
            }
        }
    }
}
