# terraform-tfe-workspace
Terraform module which creates Terraform Enterprise workspace resources.

## Migration Changes

### 0.6.0

- Replaces `project_name` with `project_id` to fix issue with dependency tree on plan and apply

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | 0.48.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.48.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_run_trigger.self](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/run_trigger) | resource |
| [tfe_variable.self](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/variable) | resource |
| [tfe_workspace.self](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/workspace) | resource |
| [tfe_workspace_variable_set.self](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/workspace_variable_set) | resource |
| [tfe_organization.self](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/data-sources/organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_agent_pool_id"></a> [agent\_pool\_id](#input\_agent\_pool\_id) | ID of the agent pool to associate with the workspace. | `string` | `null` | no |
| <a name="input_allow_destroy_plan"></a> [allow\_destroy\_plan](#input\_allow\_destroy\_plan) | Whether to allow the creation of destroy plans. | `bool` | `false` | no |
| <a name="input_assessments_enabled"></a> [assessments\_enabled](#input\_assessments\_enabled) | Whether to enable health assesments. | `bool` | `false` | no |
| <a name="input_auto_apply"></a> [auto\_apply](#input\_auto\_apply) | Whether to automatically apply changes when a Terraform plan is successful. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the workspace to create. | `string` | n/a | yes |
| <a name="input_execution_mode"></a> [execution\_mode](#input\_execution\_mode) | The execution mode of the workspace to create. | `string` | `"remote"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the workspace to create. | `string` | n/a | yes |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | The name of the organization to use. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The id of the project to use. | `string` | n/a | yes |
| <a name="input_run_trigger_workspace_ids"></a> [run\_trigger\_workspace\_ids](#input\_run\_trigger\_workspace\_ids) | A list of workspace IDs to associate with the workspace. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A list of tags to add to the workspace. | `list(string)` | `[]` | no |
| <a name="input_variable_set_ids"></a> [variable\_set\_ids](#input\_variable\_set\_ids) | A list of variable set IDs to associate with the workspace. | `list(string)` | `[]` | no |
| <a name="input_variables"></a> [variables](#input\_variables) | A list of variables to add to the workspace. | <pre>list(object({<br>    category    = string<br>    description = optional(string)<br>    hcl         = optional(bool)<br>    key         = string<br>    sensitive   = optional(bool)<br>    value       = string<br>  }))</pre> | `[]` | no |
| <a name="input_vcs_repo"></a> [vcs\_repo](#input\_vcs\_repo) | The VCS repository to associate with the workspace. | <pre>object({<br>    github_app_installation_id = string<br>    identifier                 = string<br>  })</pre> | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
