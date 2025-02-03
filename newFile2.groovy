library 'cicd-jenkins-shared-libraries@v7'
dynamicPipeline 
{
    globals = [
        CFFiles: ["cicd/ContainerDeploy.yaml",
				  "cicd/CloudwatchAlarmsUK1.yaml"],
        defaultLatestTag: "0.0.0",
        ecrImageName : "wfm-etlscheduler",
        ecrWorkstream : "integrations"    ]
	awsProd = [
		awsRegions : [[{region: "us-east-3", name: "Africa", prefix: ""}]],
        awsCredentials : "integrations_deploy_externalId",
        awsRoleId : "pipeline-integrations-deploy-role",
        awsCFRoleId : "pipeline-integrations-cloudformation-role",
        awsAccountId : "1231234567"	]
    infrastructureProd = [
        CFTemplates :[
            [
				template: "cicd/CloudwatchAlarmsUK1.yaml",
				stackName: "integrations-wfm-etlscheduler-alarms",
				paramOverrides: [
					'NotificationDistro="cloudwatch-bmc-info"',
                    'NotificationDistro2="integrations-wfm-alerts"',
                    'EnvironmentType="prod"',
                    'Threshold=1',
                    'Period=3600'
				]
			],
            [
                template: "cicd/ContainerDeploy.yaml",
                stackName: "integrations-wfm-etlscheduler",
                paramOverrides: [
                    'Memory=256',
                    'ContainerName="wfm-etlscheduler"',
                    'NumberOfDockerContainers=1',
                    'EnvironmentType="prod"',
                    'AreaId="Af123456"',
                    'AuroraSecretName="integrations-wfm-aurora-db"',
                    'DwSecretName="integrations-wfm-cor-db"',
                    'AggregatorServiceHost=" "'
                ],
                builtDockerImageParamName : "DockerImage"
            ]
        ]
    ]}
