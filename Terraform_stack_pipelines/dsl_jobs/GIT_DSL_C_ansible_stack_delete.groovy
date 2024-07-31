pipelineJob('C_Ansible_Infrastracture_delete_pipeline') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url('https://github.com/fanfanafankianki/JenkinsCreator.git')
                    }
                    branch('main')
                }
            }
            scriptPath('Terraform_stack_pipelines/C_ansible_stack_delete.json')
        }
    }
}
