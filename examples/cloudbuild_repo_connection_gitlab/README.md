## Overview

The example will create Cloud Build repositories (2nd gen) using a Gitlab connection.

## Gitlab Requirements for Cloud Build Connection

When using a Cloud Build repositories (2nd gen) GitLab repository, a Cloud Build connection to your repository provider will be created.

For GitLab connections you will need:

- Create a [Personal Access Token](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html) on GitLab with [scope](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html#personal-access-token-scopes) `api`.
- Create a [Personal Access Token](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html) on GitLab with [scope](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html#personal-access-token-scopes) `read_api`.
- Create a [webhook](https://docs.gitlab.com/ee/user/project/integrations/webhooks.html)
- Create three [Google Secret Manager](https://cloud.google.com/secret-manager/docs/overview) secrets, one for the `api` token, one for the `read_api` token, and one for the `webhook`.
- Populate the corresponding [secret versions](https://cloud.google.com/secret-manager/docs/add-secret-version) of each one of the secrets.

For more information on this topic refer to the Cloud Build repositories (2nd gen) documentation:
- [Connect to a GitLab host](https://cloud.google.com/build/docs/automating-builds/gitlab/connect-host-gitlab)
- [Connect to a GitLab repository](https://cloud.google.com/build/docs/automating-builds/github/connect-repo-github?generation=2nd-gen)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| gitlab\_authorizer\_secret\_id | The secret ID for the credential for GitLab authorizer | `string` | n/a | yes |
| gitlab\_read\_authorizer\_secret\_id | The secret ID for the credential for GitLab read authorizer | `string` | n/a | yes |
| gitlab\_webhook\_secret\_id | The secret ID for the WebHook for GitLab | `string` | n/a | yes |
| project\_id | The ID of the project in which to provision resources. | `string` | n/a | yes |
| repository\_name | The name of the test repository. | `string` | n/a | yes |
| repository\_url | The HTTPS clone URL of the repository, ending with .git. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| cloud\_build\_repositories\_2nd\_gen\_connection | Cloudbuild connection created. |
| cloud\_build\_repositories\_2nd\_gen\_repositories | Created repositories. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
