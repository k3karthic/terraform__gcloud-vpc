# Terraform — Create a VPC in Google Cloud
Create a VPC in Google Cloud.

The Terraform script below deploys a server under the [Google Cloud Always Free](https://cloud.google.com/free/) tier,
* terraform__gcloud-instance
	* GitHub: [github.com/k3karthic/terraform__gcloud-instance](https://github.com/k3karthic/terraform__gcloud-instance).
	* Codeberg: [codeberg.org/k3karthic/terraform__gcloud-instance](https://codeberg.org/k3karthic/terraform__gcloud-instance).

## Requirements

Enable the Compute Engine API from [https://console.cloud.google.com/apis/api/compute.googleapis.com/overview?pli=1](https://console.cloud.google.com/apis/api/compute.googleapis.com/overview?pli=1).

## Input Variables

Create a file to store the input variables using the sample file `google.tfvars.sample`. The file should be called `google.tfvars` or edit `bin/plan.sh` with the appropriate file name.

## Deployment

**Step 1:** Use the following command to create a [Terraform plan](https://www.terraform.io/docs/cli/run/index.html#planning),
```
$ ./bin/plan.sh
```

To avoid fetching the latest state of resources, use the following command,
```
$ ./bin/plan.sh -refresh=false
```

**Step 2:** Review the plan using the following command,
```
$ ./bin/view.sh
```

**Step 3:** [Apply](https://www.terraform.io/docs/cli/run/index.html#applying) the plan using the following command,
```
$ ./bin/apply.sh
```

## Encryption

Encrypt sensitive files (SSH private keys) before saving them. `.gitignore` must contain the unencrypted file paths.

Use the following command to decrypt the files after cloning the repository,

```
$ ./bin/decrypt.sh
```

Use the following command after running terraform to update the encrypted files,

```
$ ./bin/encrypt.sh <gpg key id>
```

